package controllers.stocks;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Ingredient;
import models.Stock;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class StocksIndexServlet
 */
@WebServlet("/stocks/index")
public class StocksIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StocksIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        }
        catch(NumberFormatException e) {
        }

        User login_user = (User)request.getSession().getAttribute("login_user");

        List<Ingredient> ingredients = em.createNamedQuery("getAllIngredients", Ingredient.class)
                                         .getResultList();

        long ingredients_count = (long)em.createNamedQuery("getIngredientsCount", Long.class)
                                         .getSingleResult();

        List<Stock> stocks = em.createNamedQuery("getAllMyStocks", Stock.class)
                               .setParameter("user", login_user)
                               .getResultList();

        //在庫にない材料リスト
        List<Ingredient> no_stocks = new ArrayList<Ingredient>();
        no_stocks.addAll(ingredients);
        if(stocks.size() != 0) {
            for(int i = 0; i < stocks.size(); i++) {
                no_stocks.remove(stocks.get(i).getStockIngredient());
            }
        }

        //在庫リストと在庫にない材料リストを表示するものだけに絞って切り取る
        //在庫リストが空の場合
        if(stocks.size() == 0) {
            if(no_stocks.size() < 30 * page) {
                no_stocks = no_stocks.subList(30 * (page - 1), no_stocks.size());
            }
            else {
                no_stocks = no_stocks.subList(30 * (page - 1), 30 * page);
            }
        }
        //表示ページで在庫リストの表示を終えて、続けて在庫にない材料リストの表示が始まる場合
        else if(stocks.size() > 30 * (page - 1) && stocks.size() < 30 * page) {
            stocks = stocks.subList(30 * (page - 1), stocks.size());
            if(stocks.size() + no_stocks.size() > 30 * page) {
                no_stocks = no_stocks.subList(0, 30 - stocks.size());
            }
        }
        //表示ページがすべて在庫リストの表示で埋まる場合（在庫にない材料リストの表示がない場合）
        else if(stocks.size() >= 30 * page) {
            stocks = stocks.subList(30 * (page - 1), 30 * page);
            no_stocks.clear();
        }
        //在庫リストの表示を既に終えていて、表示ページでは在庫にない材料リストの表示のみの場合
        else {
            if(stocks.size() + no_stocks.size() < 30 * page) {
                no_stocks = no_stocks.subList(30 * (page - 1) - stocks.size(), no_stocks.size());
            }
            else {
                no_stocks = no_stocks.subList(30 * (page - 1) - stocks.size(), 30 * page - stocks.size());
            }
            stocks.clear();
        }

        em.close();

        request.setAttribute("stocks", stocks);
        request.setAttribute("no_stocks", no_stocks);
        request.setAttribute("ingredients_count", ingredients_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/stocks/index.jsp");
        rd.forward(request, response);
    }

}

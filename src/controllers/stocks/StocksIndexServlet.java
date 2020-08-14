package controllers.stocks;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

        String stock_search = request.getParameter("stock_search");
        String type_search = request.getParameter("type_search");
        String name_search = request.getParameter("name_search");

        User login_user = (User)request.getSession().getAttribute("login_user");

        List<Ingredient> s_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
                                           .setParameter("type", "スピリッツ")
                                           .getResultList();

        List<Ingredient> l_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
                .setParameter("type", "リキュール")
                .getResultList();

        List<Ingredient> o_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
                .setParameter("type", "その他酒")
                .getResultList();

        List<Ingredient> sub_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
                .setParameter("type", "副材料")
                .getResultList();

        List<Ingredient> ingredients = new ArrayList<Ingredient>();
        ingredients.addAll(s_ingredients);
        ingredients.addAll(l_ingredients);
        ingredients.addAll(o_ingredients);
        ingredients.addAll(sub_ingredients);

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

        //在庫有無による絞込
        if(stock_search != null && !stock_search.isEmpty()) {
            if(stock_search.equals("在庫あり")) {
                no_stocks.clear();
            }
            else if(stock_search.equals("在庫なし")) {
                stocks.clear();
            }
        }

        //材料分類による絞込
        if(type_search != null && !type_search.isEmpty()) {
            Iterator<Stock> stocksIterator = stocks.iterator();
            Iterator<Ingredient> no_stocksIterator = no_stocks.iterator();
            if(type_search.equals("スピリッツ")) {
                while(stocksIterator.hasNext()) {
                    Stock s = stocksIterator.next();
                    if(!s.getStockIngredient().getType().equals("スピリッツ")) {
                        stocksIterator.remove();
                    }
                }
                while(no_stocksIterator.hasNext()) {
                    Ingredient i = no_stocksIterator.next();
                    if(!i.getType().equals("スピリッツ")) {
                        no_stocksIterator.remove();
                    }
                }
            }
            if(type_search.equals("リキュール")) {
                while(stocksIterator.hasNext()) {
                    Stock s = stocksIterator.next();
                    if(!s.getStockIngredient().getType().equals("リキュール")) {
                        stocksIterator.remove();
                    }
                }
                while(no_stocksIterator.hasNext()) {
                    Ingredient i = no_stocksIterator.next();
                    if(!i.getType().equals("リキュール")) {
                        no_stocksIterator.remove();
                    }
                }
            }
            if(type_search.equals("その他酒")) {
                while(stocksIterator.hasNext()) {
                    Stock s = stocksIterator.next();
                    if(!s.getStockIngredient().getType().equals("その他酒")) {
                        stocksIterator.remove();
                    }
                }
                while(no_stocksIterator.hasNext()) {
                    Ingredient i = no_stocksIterator.next();
                    if(!i.getType().equals("その他酒")) {
                        no_stocksIterator.remove();
                    }
                }
            }
            if(type_search.equals("副材料")) {
                while(stocksIterator.hasNext()) {
                    Stock s = stocksIterator.next();
                    if(!s.getStockIngredient().getType().equals("副材料")) {
                        stocksIterator.remove();
                    }
                }
                while(no_stocksIterator.hasNext()) {
                    Ingredient i = no_stocksIterator.next();
                    if(!i.getType().equals("副材料")) {
                        no_stocksIterator.remove();
                    }
                }
            }
        }

        //材料名による絞込
        if(name_search != null && !name_search.isEmpty()) {
            Iterator<Stock> stocksIterator = stocks.iterator();
            Iterator<Ingredient> no_stocksIterator = no_stocks.iterator();
            while(stocksIterator.hasNext()) {
                Stock s = stocksIterator.next();
                if(!s.getStockIngredient().getName().contains(name_search)) {
                    stocksIterator.remove();
                }
            }
            while(no_stocksIterator.hasNext()) {
                Ingredient i = no_stocksIterator.next();
                if(!i.getName().contains(name_search)) {
                    no_stocksIterator.remove();
                }
            }
        }

        //ページ総数計算のために材料数カウント
        long ingredients_count = stocks.size() + no_stocks.size();

        //絞込条件入力直後にページネーションから遷移された場合の対策
        if(ingredients_count <= 30 * (page - 1)) {
            page = 1;
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
        request.setAttribute("stock_search", stock_search);
        request.setAttribute("type_search", type_search);
        request.setAttribute("name_search", name_search);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/stocks/index.jsp");
        rd.forward(request, response);
    }

}

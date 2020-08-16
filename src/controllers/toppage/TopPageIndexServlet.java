package controllers.toppage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Recipe;
import models.RecipeIngredient;
import models.Stock;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class TopPageIndexServlet
 */
@WebServlet("/index.html")
public class TopPageIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopPageIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        }
        catch(NumberFormatException e) {
        }

        User login_user = (User)request.getSession().getAttribute("login_user");

        List<Recipe> recipes = em.createNamedQuery("getAllRecipes", Recipe.class)
                                 .getResultList();

        List<Stock> stocks = em.createNamedQuery("getAllMyStocks", Stock.class)
                               .setParameter("user", login_user)
                               .getResultList();

        //在庫が揃っていないレシピをリストから削除する
        Iterator<Recipe> recipesIterator = recipes.iterator();
        while(recipesIterator.hasNext()) {
            Recipe r = recipesIterator.next();
            List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                     .setParameter("makeRecipe", r)
                                                     .getResultList();
            Integer enough = 0;
            for(int i = 0; i < useIngredient.size(); i++) {
                Integer id = useIngredient.get(i).getUseIngredient().getId();
                Integer vol = useIngredient.get(i).getVol();
                String ing_type = useIngredient.get(i).getUseIngredient().getType();
                String vol_type = useIngredient.get(i).getType();
                    for(int j = 0; j < stocks.size(); j++) {
                        if(stocks.get(j).getStockIngredient().getId() == id) {
                            if(ing_type.equals("副材料")) {
                                enough += 1;
                            }
                            else if(vol_type.equals("tsp") && (stocks.get(j).getVol() >= vol * 5)) {
                                enough += 1;
                            }
                            else if(stocks.get(j).getVol() >= vol) {
                                enough += 1;
                            }
                        }
                    }
            }
            if(enough != useIngredient.size()) {
                recipesIterator.remove();
            }
        }

        if(recipes.size() >= 1) {
            Collections.shuffle(recipes);
            if(recipes.size() >= 12) {
                recipes = recipes.subList(0, 12);
            }
            else{
                recipes = recipes.subList(0, recipes.size());
            }
        }

        //材料リストを表示するものだけに絞って作成
        List<RecipeIngredient> ingredients = new ArrayList<RecipeIngredient>();
        for(int i = 0; i < recipes.size(); i++) {
            ingredients.addAll(em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                 .setParameter("makeRecipe", recipes.get(i))
                                 .getResultList());
        }

        //在庫リストを表示するものだけに絞って切り取る
        if(stocks.size() < 5 * page) {
            stocks = stocks.subList(5 * (page - 1), stocks.size());
        }
        else {
            stocks = stocks.subList(5 * (page - 1), 5 * page);
        }

        //ページ総数計算のために在庫数カウント
        long stocks_count = em.createNamedQuery("getStocksCount", Long.class)
                              .setParameter("user", login_user)
                              .getSingleResult();

        em.close();

        request.setAttribute("stocks", stocks);
        request.setAttribute("stocks_count", stocks_count);
        request.setAttribute("recipes", recipes);
        request.setAttribute("ingredients", ingredients);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
        rd.forward(request, response);
    }

}

package controllers.recipes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
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
 * Servlet implementation class RecipesConsumeServlet
 */
@WebServlet("/recipes/consume")
public class RecipesConsumeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesConsumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            User login_user = (User)request.getSession().getAttribute("login_user");
            Recipe r = em.find(Recipe.class, Integer.parseInt(request.getParameter("recipe_id")));

            List<Stock> stocks = em.createNamedQuery("getAllMyStocks", Stock.class)
                                   .setParameter("user", login_user)
                                   .getResultList();

            List<RecipeIngredient> ingredients = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                   .setParameter("makeRecipe", r)
                                                   .getResultList();

            List<String> consumptions = new ArrayList<String>();

            //作ったカクテルの分、在庫の数量を減らす
            for(int i = 0; i < stocks.size(); i++) {
                Stock s = stocks.get(i);
                //副材料については数量管理はしない
                if(!s.getStockIngredient().getType().equals("副材料")) {
                    for(int j = 0; j < ingredients.size(); j++) {
                        RecipeIngredient ri = ingredients.get(j);
                        if(s.getStockIngredient().equals(ri.getUseIngredient())) {
                            //消費量の単位をmlに変換
                            Integer consumed_vol = new Integer(0);
                            if(ri.getType().equals("ml") || ri.getType().equals("dash")) {
                                consumed_vol = ri.getVol();
                            }
                            else if(ri.getType().equals("tsp")) {
                                consumed_vol = ri.getVol() * 5;
                            }

                            em.getTransaction().begin();
                            if(s.getVol() > consumed_vol) {
                                s.setVol(s.getVol() - consumed_vol);
                                em.persist(s);
                                consumptions.add(s.getStockIngredient().getName() + "を" + consumed_vol + "ml消費しました。在庫数量は残り約" + s.getVol() + "mlです。");
                            }
                            else if(s.getVol() <= consumed_vol) {
                                em.remove(s);
                                consumptions.add(s.getStockIngredient().getName() + "の在庫が無くなりました。");
                            }
                            em.getTransaction().commit();
                            em.close();
                        }
                    }
                }
            }
            if(consumptions.size() > 0) {
                request.getSession().setAttribute("consumptions", consumptions);
            }

            response.sendRedirect(request.getContextPath() + "/recipes/show?id=" + r.getId());
        }
    }

}

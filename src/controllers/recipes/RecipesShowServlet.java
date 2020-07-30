package controllers.recipes;

import java.io.IOException;
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
import utils.DBUtil;

/**
 * Servlet implementation class RecipesEditServlet
 */
@WebServlet("/recipes/show")
public class RecipesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Recipe r = em.find(Recipe.class, Integer.parseInt(request.getParameter("id")));

        List<RecipeIngredient> ingredients = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                               .setParameter("makeRecipe", r)
                                               .getResultList();

        //レシピのアルコール度数計算の可否
        Boolean abv_cal_flag = true;
        for(int i = 0; i < ingredients.size(); i++) {
            if(ingredients.get(i).getType().equals("適量")) {
                abv_cal_flag = false;
                break;
            }
        }

        //可能ならレシピのアルコール度数を計算、不可なら"不明"とする
        Integer total_vol = 0;
        Double total_alc = 0.0;
        if(abv_cal_flag) {
            for(int i = 0; i < ingredients.size(); i++) {
                total_vol += ingredients.get(i).getVol();
                total_alc += ingredients.get(i).getVol() * (ingredients.get(i).getUseIngredient().getAbv() * 0.01);
            }
            long recipe_abv = Math.round(total_alc / total_vol * 100);
            request.setAttribute("recipe_abv", "約 " + recipe_abv + " ％");
        }
        else {
            request.setAttribute("recipe_abv", "不明");
        }

        em.close();

        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("recipe", r);
        request.setAttribute("ingredients", ingredients);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("recipe_id", r.getId());
        if(request.getSession().getAttribute("consumptions") != null) {
            request.setAttribute("consumptions", request.getSession().getAttribute("consumptions"));
            request.getSession().removeAttribute("consumptions");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/show.jsp");
        rd.forward(request, response);
    }

}

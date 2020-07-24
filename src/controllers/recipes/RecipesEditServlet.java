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
@WebServlet("/recipes/edit")
public class RecipesEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesEditServlet() {
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

        if(ingredients.size() >= 1) {
            request.getSession().setAttribute("ing1", ingredients.get(0).getUseIngredient());
            request.setAttribute("ing1_vol",ingredients.get(0).getVol());
        }
        if(ingredients.size() >= 2) {
            request.getSession().setAttribute("ing2", ingredients.get(1).getUseIngredient());
            request.setAttribute("ing2_vol",ingredients.get(1).getVol());
        }
        if(ingredients.size() >= 3) {
            request.getSession().setAttribute("ing3", ingredients.get(2).getUseIngredient());
            request.setAttribute("ing3_vol",ingredients.get(2).getVol());
        }
        if(ingredients.size() >= 4) {
            request.getSession().setAttribute("ing4", ingredients.get(3).getUseIngredient());
            request.setAttribute("ing4_vol",ingredients.get(3).getVol());
        }
        if(ingredients.size() >= 5) {
            request.getSession().setAttribute("ing5", ingredients.get(4).getUseIngredient());
            request.setAttribute("ing5_vol",ingredients.get(4).getVol());
        }
        if(ingredients.size() >= 6) {
            request.getSession().setAttribute("ing6", ingredients.get(5).getUseIngredient());
            request.setAttribute("ing6_vol",ingredients.get(5).getVol());
        }
        if(ingredients.size() >= 7) {
            request.getSession().setAttribute("ing7", ingredients.get(6).getUseIngredient());
            request.setAttribute("ing7_vol",ingredients.get(6).getVol());
        }
        if(ingredients.size() >= 8) {
            request.getSession().setAttribute("ing8", ingredients.get(7).getUseIngredient());
            request.setAttribute("ing8_vol",ingredients.get(7).getVol());
        }
        if(ingredients.size() >= 9) {
            request.getSession().setAttribute("ing9", ingredients.get(8).getUseIngredient());
            request.setAttribute("ing9_vol",ingredients.get(8).getVol());
        }
        if(ingredients.size() == 10) {
            request.getSession().setAttribute("ing10", ingredients.get(9).getUseIngredient());
            request.setAttribute("ing10_vol",ingredients.get(9).getVol());
        }

        em.close();

        request.setAttribute("recipe", r);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("recipe_id", r.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/edit.jsp");
        rd.forward(request, response);
    }

}

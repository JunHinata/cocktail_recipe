package controllers.recipes;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Recipe;
import models.RecipeIngredient;
import utils.DBUtil;

/**
 * Servlet implementation class RecipesDestroyServlet
 */
@WebServlet("/recipes/destroy")
public class RecipesDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesDestroyServlet() {
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

            Recipe r = em.find(Recipe.class, (Integer)(request.getSession().getAttribute("recipe_id")));

            List<RecipeIngredient> ingredients = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                   .setParameter("makeRecipe", r)
                                                   .getResultList();
            Iterator<RecipeIngredient> i = ingredients.iterator();

            em.getTransaction().begin();
            while(i.hasNext()) {
                RecipeIngredient ri = i.next();
                em.remove(ri);
            }
            em.remove(r);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "レシピ削除が完了しました。");

            request.getSession().removeAttribute("recipe");
            request.getSession().removeAttribute("recipe_id");

            response.sendRedirect(request.getContextPath() + "/recipes/index");
        }
    }

}

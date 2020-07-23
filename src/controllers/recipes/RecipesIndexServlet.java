package controllers.recipes;

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

import models.Recipe;
import models.RecipeIngredient;
import utils.DBUtil;

/**
 * Servlet implementation class RecipesIndexServlet
 */
@WebServlet("/recipes/index")
public class RecipesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesIndexServlet() {
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
        List<Recipe> recipes = em.createNamedQuery("getAllRecipes", Recipe.class)
                                 .setFirstResult(12 * (page - 1))
                                 .setMaxResults(12)
                                 .getResultList();

        long recipes_count = (long)em.createNamedQuery("getRecipesCount", Long.class)
                                     .getSingleResult();

        List<RecipeIngredient> ingredients = new ArrayList<RecipeIngredient>();
        for(int i = 0; i < recipes.size(); i++) {
            ingredients.addAll(em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                 .setParameter("makeRecipe", recipes.get(i))
                                 .getResultList());
        }

        em.close();

        request.setAttribute("recipes", recipes);
        request.setAttribute("recipes_count", recipes_count);
        request.setAttribute("ingredients", ingredients);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/index.jsp");
        rd.forward(request, response);



    }

}

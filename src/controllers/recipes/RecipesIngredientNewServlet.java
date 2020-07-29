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

import models.Ingredient;
import models.Recipe;
import utils.DBUtil;

/**
 * Servlet implementation class RecipesIngredientServlet
 */
@WebServlet("/recipes/ingredient_new")
public class RecipesIngredientNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesIngredientNewServlet() {
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

            int page = 1;
            try{
                page = Integer.parseInt(request.getParameter("page"));
            }
            catch(NumberFormatException e) {
            }
            List<Ingredient> ingredients = em.createNamedQuery("getAllIngredients", Ingredient.class)
                                             .setFirstResult(30 * (page - 1))
                                             .setMaxResults(30)
                                             .getResultList();

            long ingredients_count = (long)em.createNamedQuery("getIngredientsCount", Long.class)
                                             .getSingleResult();

            Recipe r = new Recipe();

            r.setName(request.getParameter("name"));
            r.setType(request.getParameter("type"));
            r.setColor(request.getParameter("color"));
            r.setTaste(request.getParameter("taste"));
            r.setGlass(request.getParameter("glass"));
            r.setTechnique(request.getParameter("technique"));
            r.setIntroduction(request.getParameter("introduction"));

            request.getSession().setAttribute("recipe", r);

            em.close();

            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("ingredients", ingredients);
            request.setAttribute("ingredients_count", ingredients_count);
            request.setAttribute("page", page);
            request.setAttribute("ing_number", request.getParameter("ing_number"));
            request.setAttribute("ing1_vol", request.getParameter("ing1_vol"));
            request.setAttribute("ing2_vol", request.getParameter("ing2_vol"));
            request.setAttribute("ing3_vol", request.getParameter("ing3_vol"));
            request.setAttribute("ing4_vol", request.getParameter("ing4_vol"));
            request.setAttribute("ing5_vol", request.getParameter("ing5_vol"));
            request.setAttribute("ing6_vol", request.getParameter("ing6_vol"));
            request.setAttribute("ing7_vol", request.getParameter("ing7_vol"));
            request.setAttribute("ing8_vol", request.getParameter("ing8_vol"));
            request.setAttribute("ing9_vol", request.getParameter("ing9_vol"));
            request.setAttribute("ing10_vol", request.getParameter("ing10_vol"));
            request.setAttribute("ing1_type", request.getParameter("ing1_type"));
            request.setAttribute("ing2_type", request.getParameter("ing2_type"));
            request.setAttribute("ing3_type", request.getParameter("ing3_type"));
            request.setAttribute("ing4_type", request.getParameter("ing4_type"));
            request.setAttribute("ing5_type", request.getParameter("ing5_type"));
            request.setAttribute("ing6_type", request.getParameter("ing6_type"));
            request.setAttribute("ing7_type", request.getParameter("ing7_type"));
            request.setAttribute("ing8_type", request.getParameter("ing8_type"));
            request.setAttribute("ing9_type", request.getParameter("ing9_type"));
            request.setAttribute("ing10_type", request.getParameter("ing10_type"));

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/ingredient_new.jsp");
            rd.forward(request, response);
        }
    }

}

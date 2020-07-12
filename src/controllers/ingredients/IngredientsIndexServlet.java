package controllers.ingredients;

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
import utils.DBUtil;

/**
 * Servlet implementation class IngredientsIndexServlet
 */
@WebServlet("/ingredients/index")
public class IngredientsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngredientsIndexServlet() {
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
        List<Ingredient> ingredients = em.createNamedQuery("getAllIngredients", Ingredient.class)
                             .setFirstResult(30 * (page - 1))
                             .setMaxResults(30)
                             .getResultList();

        long ingredients_count = (long)em.createNamedQuery("getIngredientsCount", Long.class)
                                   .getSingleResult();

        em.close();

        request.setAttribute("ingredients", ingredients);
        request.setAttribute("ingredients_count", ingredients_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/ingredients/index.jsp");
        rd.forward(request, response);
    }

}

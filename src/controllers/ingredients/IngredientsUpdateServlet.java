package controllers.ingredients;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Ingredient;
import models.validators.IngredientValidator;
import utils.DBUtil;

/**
 * Servlet implementation class IngredientsUpdateServlet
 */
@WebServlet("/ingredients/update")
public class IngredientsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngredientsUpdateServlet() {
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

            Ingredient i = em.find(Ingredient.class, (Integer)(request.getSession().getAttribute("ingredient_id")));

            i.setName(request.getParameter("name"));
            i.setType(request.getParameter("type"));
            i.setAbv(Integer.parseInt(request.getParameter("abv")));
            i.setSoda_flag(Integer.parseInt(request.getParameter("soda_flag")));
            i.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = IngredientValidator.validate(i);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("ingredient", i);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/ingredients/edit.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("ingredient_id");

                response.sendRedirect(request.getContextPath() + "/ingredients/index");
            }
        }
    }

}

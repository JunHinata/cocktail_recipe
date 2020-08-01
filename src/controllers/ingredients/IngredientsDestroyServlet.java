package controllers.ingredients;

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

import models.Ingredient;
import utils.DBUtil;

/**
 * Servlet implementation class IngredientsDestroyServlet
 */
@WebServlet("/ingredients/destroy")
public class IngredientsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngredientsDestroyServlet() {
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

            long stocks_count = (long)em.createNamedQuery("getIngredientStocksCount", Long.class)
                                        .setParameter("ingredient", i)
                                        .getSingleResult();

            long recipes_count = (long)em.createNamedQuery("getUsedIngredientsCount", Long.class)
                                         .setParameter("ingredient", i)
                                         .getSingleResult();

            if(stocks_count == 0 && recipes_count == 0) {
                em.getTransaction().begin();
                em.remove(i);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "削除が完了しました。");

                response.sendRedirect(request.getContextPath() + "/ingredients/index");
            }
            else{
                em.close();

                List<String> errors = new ArrayList<String>();
                errors.add("レシピあるいは在庫管理に対象の材料が使用されているため削除できませんでした。");

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("ingredient", i);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/ingredients/edit.jsp");
                rd.forward(request, response);
            }
        }
    }

}

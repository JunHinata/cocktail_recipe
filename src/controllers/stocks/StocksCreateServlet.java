package controllers.stocks;

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
import models.Stock;
import models.User;
import models.validators.StockValidator;
import utils.DBUtil;

/**
 * Servlet implementation class StocksCreateServlet
 */
@WebServlet("/stocks/create")
public class StocksCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StocksCreateServlet() {
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
            Ingredient stock_ingredient = em.find(Ingredient.class, Integer.parseInt(request.getParameter("ingredient_id")));

            Stock s = new Stock();

            s.setStockUser(login_user);
            s.setStockIngredient(stock_ingredient);
            s.setComment(request.getParameter("comment"));

            if(request.getParameter("vol_f") != null && !request.getParameter("vol_f").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol_f")));
            }
            else if(request.getParameter("vol_o") != null && !request.getParameter("vol_o").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol_o")));
            }
            else if(request.getParameter("vol") != null && !request.getParameter("vol").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol")));
            }

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            s.setCreated_at(currentTime);
            s.setUpdated_at(currentTime);

            List<String> errors = StockValidator.validate(s);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("stock", s);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/stocks/new.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.persist(s);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/stocks/index");
            }
        }
    }

}

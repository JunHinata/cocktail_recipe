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

import models.Stock;
import models.validators.StockValidator;
import utils.DBUtil;

/**
 * Servlet implementation class StocksUpdateServlet
 */
@WebServlet("/stocks/update")
public class StocksUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StocksUpdateServlet() {
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

            Stock s = em.find(Stock.class, (Integer)(request.getSession().getAttribute("stock_id")));

            s.setComment(request.getParameter("comment"));
            s.setUpdated_at(new Timestamp(System.currentTimeMillis()));
            System.out.println();

            if(request.getParameter("vol_f") != null && !request.getParameter("vol_f").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol_f")));
            }
            else if(request.getParameter("vol_o") != null && !request.getParameter("vol_o").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol_o")));
            }
            else if(request.getParameter("vol") != null && !request.getParameter("vol").isEmpty()) {
                s.setVol(Integer.parseInt(request.getParameter("vol")));
            }

            List<String> errors = StockValidator.validate(s);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("stock", s);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/stocks/edit.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("stock_id");

                response.sendRedirect(request.getContextPath() + "/stocks/index");
            }
        }
    }

}

package controllers.stocks;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Stock;
import utils.DBUtil;

/**
 * Servlet implementation class StocksDestroyServlet
 */
@WebServlet("/stocks/destroy")
public class StocksDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StocksDestroyServlet() {
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

            em.getTransaction().begin();
            em.remove(s);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "破棄が完了しました。");

            response.sendRedirect(request.getContextPath() + "/stocks/index");
        }
    }

}

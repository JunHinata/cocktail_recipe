package controllers.stocks;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Stock;
import utils.DBUtil;

/**
 * Servlet implementation class StocksShowServlet
 */
@WebServlet("/stocks/show")
public class StocksShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StocksShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Stock s = em.find(Stock.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("stock", s);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/stocks/show.jsp");
        rd.forward(request, response);
    }

}

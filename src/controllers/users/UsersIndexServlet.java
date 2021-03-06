package controllers.users;

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

import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UsersIndexServlet
 */
@WebServlet("/users/index")
public class UsersIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersIndexServlet() {
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

        String user_search = request.getParameter("user_search");

        List<User> users = new ArrayList<User>();

        if(user_search != null && !user_search.isEmpty()) {
            if(user_search.equals("更新日時順")) {
                users.clear();
                users.addAll(em.createNamedQuery("getAllUsersUpdated", User.class)
                               .setFirstResult(30 * (page - 1))
                               .setMaxResults(30)
                               .getResultList());
            }
            else if(user_search.equals("ユーザー名順")) {
                users.clear();
                users.addAll(em.createNamedQuery("getAllUsersName", User.class)
                               .setFirstResult(30 * (page - 1))
                               .setMaxResults(30)
                               .getResultList());
            }
            else if(user_search.equals("ID昇順")) {
                users.clear();
                users.addAll(em.createNamedQuery("getAllUsersASC", User.class)
                               .setFirstResult(30 * (page - 1))
                               .setMaxResults(30)
                               .getResultList());
            }
            else{
                users.clear();
                users.addAll(em.createNamedQuery("getAllUsers", User.class)
                               .setFirstResult(30 * (page - 1))
                               .setMaxResults(30)
                               .getResultList());
            }
        }
        else{
            users.addAll(em.createNamedQuery("getAllUsers", User.class)
                           .setFirstResult(30 * (page - 1))
                           .setMaxResults(30)
                           .getResultList());
        }

        long users_count = (long)em.createNamedQuery("getUsersCount", Long.class)
                                   .getSingleResult();

        em.close();

        request.setAttribute("users", users);
        request.setAttribute("users_count", users_count);
        request.setAttribute("page", page);
        request.setAttribute("user_search", user_search);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/index.jsp");
        rd.forward(request, response);
    }

}

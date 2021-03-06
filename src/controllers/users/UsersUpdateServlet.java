package controllers.users;

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

import models.User;
import models.validators.UserValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class UsersUpdateServlet
 */
@WebServlet("/users/update")
public class UsersUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersUpdateServlet() {
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

            User u = em.find(User.class, (Integer)(request.getSession().getAttribute("user_id")));

            //現在の値と異なるユーザー名が入力されていたら重複チェックフラグを立てる
            Boolean name_duplicate_check_flag = true;
            if(u.getName().equals(request.getParameter("name"))) {
                name_duplicate_check_flag = false;
            }
            else {
                u.setName(request.getParameter("name"));
            }

            //現在の値と異なるメールアドレスが入力されていたら重複チェックフラグを立てる
            Boolean email_duplicate_check_flag = true;
            if(u.getEmail().equals(request.getParameter("email"))) {
                email_duplicate_check_flag = false;
            }
            else {
                u.setEmail(request.getParameter("email"));
            }

            //パスワードの入力があったら入力値チェックフラグを立てる
            Boolean password_check_flag = true;
            String password = request.getParameter("password");
            if(password == null || password.equals("")) {
                password_check_flag = false;
            }
            else {
                u.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("salt")
                                )
                        );
            }

            u.setAdmin_flag(Integer.parseInt(request.getParameter("admin_flag")));
            u.setDelete_flag(Integer.parseInt(request.getParameter("delete_flag")));
            u.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = UserValidator.validate(u, name_duplicate_check_flag, email_duplicate_check_flag, password_check_flag);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/edit.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("user_id");

                response.sendRedirect(request.getContextPath() + "/users/index");
            }
        }
    }

}

package controllers.login;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.IOUtils;

import models.User;
import models.validators.LoginValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class LoginCreateServlet
 */
@WebServlet("/login/create")
@MultipartConfig
public class LoginCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCreateServlet() {
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

            User u = new User();

            u.setName(request.getParameter("name"));
            u.setEmail(request.getParameter("email"));
            u.setAdmin_flag(0);

            Part filePart = request.getPart("image");
            InputStream fileContent = filePart.getInputStream();
            byte[] byteArray = IOUtils.toByteArray(fileContent);
            try {
                Blob blob = new SerialBlob(byteArray);
                u.setImage(blob);
            } catch (SerialException e) {
                // TODO 自動生成された catch ブロック
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO 自動生成された catch ブロック
                e.printStackTrace();
            }

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            u.setCreated_at(currentTime);
            u.setUpdated_at(currentTime);
            u.setDelete_flag(0);

            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            List<String> errors = LoginValidator.validate(u, pass1, pass2, true, true, true);
            u.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                            pass1,
                            (String)this.getServletContext().getAttribute("salt")
                            )
                    );
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/new.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.persist(u);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

}

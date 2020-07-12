package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        //cssフォルダ内および新規ユーザー登録は認証処理から除外
        if(!servlet_path.matches("/css.*") && !servlet_path.matches("/images.*") && !servlet_path.matches("/login/new")&& !servlet_path.matches("/login/create")) {
            HttpSession session = ((HttpServletRequest)request).getSession();

            //セッションスコープに保存されたユーザー情報を取得
            User u = (User)session.getAttribute("login_user");

            //ログイン画面以外について
            if(!servlet_path.equals("/login")) {
                //ログアウトしている状態であればログイン画面にリダイレクト
                if(u == null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                    return;
                }

                //ユーザー管理および材料管理の機能は管理者のみが閲覧できるようにする
                if((servlet_path.matches("/users.*") || servlet_path.matches("/ingredients.*")) && u.getAdmin_flag() == 0) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }
            }
            //ログイン画面について
            else {
                //ログインしているのにログイン画面を表示させようとした場合はトップページにリダイレクト
                if(u != null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }
            }

        }

        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}

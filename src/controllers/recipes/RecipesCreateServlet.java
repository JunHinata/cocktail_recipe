package controllers.recipes;

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

import models.Recipe;
import models.RecipeIngredient;
import models.User;
import models.validators.RecipeIngredientValidator;
import models.validators.RecipeValidator;
import utils.DBUtil;

/**
 * Servlet implementation class RecipesCreateServlet
 */
@WebServlet("/recipes/create")
public class RecipesCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesCreateServlet() {
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

            //Recipeのプロパティセット
            Recipe r = new Recipe();

            r.setName(request.getParameter("name"));
            r.setType(request.getParameter("type"));
            r.setColor(request.getParameter("color"));
            r.setTaste(request.getParameter("taste"));
            r.setGlass(request.getParameter("glass"));
            r.setTechnique(request.getParameter("technique"));
            r.setIntroduction(request.getParameter("introduction"));
            r.setDelete_flag(0);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            r.setCreated_at(currentTime);
            r.setUpdated_at(currentTime);

            User login_user = (User)request.getSession().getAttribute("login_user");
            r.setCreateUser(login_user);

            //Recipeのエラーチェック
            List<String> errors = RecipeValidator.validate(r, true);

            //RecipeIngredientのプロパティセット
            String ing1_vol = request.getParameter("ing1_vol");
            String ing2_vol = request.getParameter("ing2_vol");
            String ing3_vol = request.getParameter("ing3_vol");
            String ing4_vol = request.getParameter("ing4_vol");
            String ing5_vol = request.getParameter("ing5_vol");
            String ing6_vol = request.getParameter("ing6_vol");
            String ing7_vol = request.getParameter("ing7_vol");
            String ing8_vol = request.getParameter("ing8_vol");
            String ing9_vol = request.getParameter("ing9_vol");
            String ing10_vol = request.getParameter("ing10_vol");

            RecipeIngredient ri1 = (RecipeIngredient)request.getSession().getAttribute("ing1");
            if(ri1 != null && !ing1_vol.isEmpty()) {
                ri1.setMakeRecipe(r);
                ri1.setVol(Integer.parseInt(ing1_vol));
            }

            RecipeIngredient ri2 = (RecipeIngredient)request.getSession().getAttribute("ing2");
            if(ri2 != null && !ing2_vol.isEmpty()) {
                ri2.setMakeRecipe(r);
                ri2.setVol(Integer.parseInt(ing2_vol));
            }

            RecipeIngredient ri3 = (RecipeIngredient)request.getSession().getAttribute("ing3");
            if(ri3 != null && !ing3_vol.isEmpty()) {
                ri3.setMakeRecipe(r);
                ri3.setVol(Integer.parseInt(ing3_vol));
            }

            RecipeIngredient ri4 = (RecipeIngredient)request.getSession().getAttribute("ing4");
            if(ri4 != null && !ing4_vol.isEmpty()) {
                ri4.setMakeRecipe(r);
                ri4.setVol(Integer.parseInt(ing4_vol));
            }

            RecipeIngredient ri5 = (RecipeIngredient)request.getSession().getAttribute("ing5");
            if(ri5 != null && !ing5_vol.isEmpty()) {
                ri5.setMakeRecipe(r);
                ri5.setVol(Integer.parseInt(ing5_vol));
            }

            RecipeIngredient ri6 = (RecipeIngredient)request.getSession().getAttribute("ing6");
            if(ri6 != null && !ing6_vol.isEmpty()) {
                ri6.setMakeRecipe(r);
                ri6.setVol(Integer.parseInt(ing6_vol));
            }

            RecipeIngredient ri7 = (RecipeIngredient)request.getSession().getAttribute("ing7");
            if(ri7 != null && !ing7_vol.isEmpty()) {
                ri7.setMakeRecipe(r);
                ri7.setVol(Integer.parseInt(ing7_vol));
            }

            RecipeIngredient ri8 = (RecipeIngredient)request.getSession().getAttribute("ing8");
            if(ri8 != null && !ing8_vol.isEmpty()) {
                ri8.setMakeRecipe(r);
                ri8.setVol(Integer.parseInt(ing8_vol));
            }

            RecipeIngredient ri9 = (RecipeIngredient)request.getSession().getAttribute("ing9");
            if(ri9 != null && !ing9_vol.isEmpty()) {
                ri9.setMakeRecipe(r);
                ri9.setVol(Integer.parseInt(ing9_vol));
            }

            RecipeIngredient ri10 = (RecipeIngredient)request.getSession().getAttribute("ing10");
            if(ri10 != null && !ing10_vol.isEmpty()) {
                ri10.setMakeRecipe(r);
                ri10.setVol(Integer.parseInt(ing10_vol));
            }

            //RecipeIngredientのエラーチェック
            List<String> errors_ri = RecipeIngredientValidator.validate(ri1, ri2, ri3, ri4, ri5, ri6, ri7, ri8, ri9, ri10);
            errors.addAll(errors_ri);

            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("recipe",r);
                request.setAttribute("errors", errors);
                request.setAttribute("ing1_vol", ing1_vol);
                request.setAttribute("ing2_vol", ing2_vol);
                request.setAttribute("ing3_vol", ing3_vol);
                request.setAttribute("ing4_vol", ing4_vol);
                request.setAttribute("ing5_vol", ing5_vol);
                request.setAttribute("ing6_vol", ing6_vol);
                request.setAttribute("ing7_vol", ing7_vol);
                request.setAttribute("ing8_vol", ing8_vol);
                request.setAttribute("ing9_vol", ing9_vol);
                request.setAttribute("ing10_vol", ing10_vol);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/new.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.persist(r);
                em.persist(ri1);
                em.persist(ri2);
                if(ri3 != null) {
                    em.persist(ri3);
                }
                if(ri4 != null) {
                    em.persist(ri4);
                }
                if(ri5 != null) {
                    em.persist(ri5);
                }
                if(ri6 != null) {
                    em.persist(ri6);
                }
                if(ri7 != null) {
                    em.persist(ri7);
                }
                if(ri8 != null) {
                    em.persist(ri8);
                }
                if(ri9 != null) {
                    em.persist(ri9);
                }
                if(ri10 != null) {
                    em.persist(ri10);
                }
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "レシピ投稿が完了しました。");

                response.sendRedirect(request.getContextPath() + "/recipes/index");
            }
        }
    }

}

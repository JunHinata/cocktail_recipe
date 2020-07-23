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

import models.Ingredient;
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
            Ingredient ing1 = (Ingredient)request.getSession().getAttribute("ing1");
            Ingredient ing2 = (Ingredient)request.getSession().getAttribute("ing2");
            Ingredient ing3 = (Ingredient)request.getSession().getAttribute("ing3");
            Ingredient ing4 = (Ingredient)request.getSession().getAttribute("ing4");
            Ingredient ing5 = (Ingredient)request.getSession().getAttribute("ing5");
            Ingredient ing6 = (Ingredient)request.getSession().getAttribute("ing6");
            Ingredient ing7 = (Ingredient)request.getSession().getAttribute("ing7");
            Ingredient ing8 = (Ingredient)request.getSession().getAttribute("ing8");
            Ingredient ing9 = (Ingredient)request.getSession().getAttribute("ing9");
            Ingredient ing10 = (Ingredient)request.getSession().getAttribute("ing10");

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


            RecipeIngredient ri1 = new RecipeIngredient();
            if(ing1 != null && !ing1_vol.isEmpty()) {
                ri1.setUseIngredient(ing1);
                ri1.setMakeRecipe(r);
                ri1.setVol(Integer.parseInt(ing1_vol));
            }
            RecipeIngredient ri2 = new RecipeIngredient();
            if(ing2 != null && !ing2_vol.isEmpty()) {
                ri2.setUseIngredient(ing2);
                ri2.setMakeRecipe(r);
                ri2.setVol(Integer.parseInt(ing2_vol));
            }
            RecipeIngredient ri3 = new RecipeIngredient();
            if(ing3 != null && !ing3_vol.isEmpty()) {
                ri3.setUseIngredient(ing3);
                ri3.setMakeRecipe(r);
                ri3.setVol(Integer.parseInt(ing3_vol));
            }
            RecipeIngredient ri4 = new RecipeIngredient();
            if(ing4 != null && !ing4_vol.isEmpty()) {
                ri4.setUseIngredient(ing4);
                ri4.setMakeRecipe(r);
                ri4.setVol(Integer.parseInt(ing4_vol));
            }
            RecipeIngredient ri5 = new RecipeIngredient();
            if(ing5 != null && !ing5_vol.isEmpty()) {
                ri5.setUseIngredient(ing5);
                ri5.setMakeRecipe(r);
                ri5.setVol(Integer.parseInt(ing5_vol));
            }
            RecipeIngredient ri6 = new RecipeIngredient();
            if(ing6 != null && !ing6_vol.isEmpty()) {
                ri6.setUseIngredient(ing6);
                ri6.setMakeRecipe(r);
                ri6.setVol(Integer.parseInt(ing6_vol));
            }
            RecipeIngredient ri7 = new RecipeIngredient();
            if(ing7 != null && !ing7_vol.isEmpty()) {
                ri7.setUseIngredient(ing7);
                ri7.setMakeRecipe(r);
                ri7.setVol(Integer.parseInt(ing7_vol));
            }
            RecipeIngredient ri8 = new RecipeIngredient();
            if(ing8 != null && !ing8_vol.isEmpty()) {
                ri8.setUseIngredient(ing8);
                ri8.setMakeRecipe(r);
                ri8.setVol(Integer.parseInt(ing8_vol));
            }
            RecipeIngredient ri9 = new RecipeIngredient();
            if(ing9 != null && !ing9_vol.isEmpty()) {
                ri9.setUseIngredient(ing9);
                ri9.setMakeRecipe(r);
                ri9.setVol(Integer.parseInt(ing9_vol));
            }
            RecipeIngredient ri10 = new RecipeIngredient();
            if(ing10 != null && !ing10_vol.isEmpty()) {
                ri10.setUseIngredient(ing10);
                ri10.setMakeRecipe(r);
                ri10.setVol(Integer.parseInt(ing10_vol));
            }

            //RecipeIngredientのエラーチェック
            List<String> errors_ri = RecipeIngredientValidator.validate(ing1, ing1_vol, ing2, ing2_vol, ing3, ing3_vol, ing4, ing4_vol, ing5, ing5_vol, ing6, ing6_vol, ing7, ing7_vol, ing8, ing8_vol, ing9, ing9_vol, ing10, ing10_vol);
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
                if(ri3.getVol() != null) {
                    em.persist(ri3);
                }
                if(ri4.getVol() != null) {
                    em.persist(ri4);
                }
                if(ri5.getVol() != null) {
                    em.persist(ri5);
                }
                if(ri6.getVol() != null) {
                    em.persist(ri6);
                }
                if(ri7.getVol() != null) {
                    em.persist(ri7);
                }
                if(ri8.getVol() != null) {
                    em.persist(ri8);
                }
                if(ri9.getVol() != null) {
                    em.persist(ri9);
                }
                if(ri10.getVol() != null) {
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

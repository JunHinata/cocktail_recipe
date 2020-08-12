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

            String ing1_type = request.getParameter("ing1_type");
            String ing2_type = request.getParameter("ing2_type");
            String ing3_type = request.getParameter("ing3_type");
            String ing4_type = request.getParameter("ing4_type");
            String ing5_type = request.getParameter("ing5_type");
            String ing6_type = request.getParameter("ing6_type");
            String ing7_type = request.getParameter("ing7_type");
            String ing8_type = request.getParameter("ing8_type");
            String ing9_type = request.getParameter("ing9_type");
            String ing10_type = request.getParameter("ing10_type");

            RecipeIngredient ri1 = new RecipeIngredient();
            if(ing1 != null && !ing1_type.isEmpty() && (!ing1_vol.isEmpty() || ing1_type.equals("適量"))) {
                ri1.setUseIngredient(ing1);
                ri1.setMakeRecipe(r);
                ri1.setType(ing1_type);
                if(!ing1_type.equals("適量")) {
                    ri1.setVol(Integer.parseInt(ing1_vol));
                }
            }
            RecipeIngredient ri2 = new RecipeIngredient();
            if(ing2 != null && !ing2_type.isEmpty() && (!ing2_vol.isEmpty() || ing2_type.equals("適量"))) {
                ri2.setUseIngredient(ing2);
                ri2.setMakeRecipe(r);
                ri2.setType(ing2_type);
                if(!ing2_type.equals("適量")) {
                    ri2.setVol(Integer.parseInt(ing2_vol));
                }
            }
            RecipeIngredient ri3 = new RecipeIngredient();
            if(ing3 != null && !ing3_type.isEmpty() && (!ing3_vol.isEmpty() || ing3_type.equals("適量"))) {
                ri3.setUseIngredient(ing3);
                ri3.setMakeRecipe(r);
                ri3.setType(ing3_type);
                if(!ing3_type.equals("適量")) {
                    ri3.setVol(Integer.parseInt(ing3_vol));
                }
            }
            RecipeIngredient ri4 = new RecipeIngredient();
            if(ing4 != null && !ing4_type.isEmpty() && (!ing4_vol.isEmpty() || ing4_type.equals("適量"))) {
                ri4.setUseIngredient(ing4);
                ri4.setMakeRecipe(r);
                ri4.setType(ing4_type);
                if(!ing4_type.equals("適量")) {
                    ri4.setVol(Integer.parseInt(ing4_vol));
                }
            }
            RecipeIngredient ri5 = new RecipeIngredient();
            if(ing5 != null && !ing5_type.isEmpty() && (!ing5_vol.isEmpty() || ing5_type.equals("適量"))) {
                ri5.setUseIngredient(ing5);
                ri5.setMakeRecipe(r);
                ri5.setType(ing5_type);
                if(!ing5_type.equals("適量")) {
                    ri5.setVol(Integer.parseInt(ing5_vol));
                }
            }
            RecipeIngredient ri6 = new RecipeIngredient();
            if(ing6 != null && !ing6_type.isEmpty() && (!ing6_vol.isEmpty() || ing6_type.equals("適量"))) {
                ri6.setUseIngredient(ing6);
                ri6.setMakeRecipe(r);
                ri6.setType(ing6_type);
                if(!ing6_type.equals("適量")) {
                    ri6.setVol(Integer.parseInt(ing6_vol));
                }
            }
            RecipeIngredient ri7 = new RecipeIngredient();
            if(ing7 != null && !ing7_type.isEmpty() && (!ing7_vol.isEmpty() || ing7_type.equals("適量"))) {
                ri7.setUseIngredient(ing7);
                ri7.setMakeRecipe(r);
                ri7.setType(ing7_type);
                if(!ing7_type.equals("適量")) {
                    ri7.setVol(Integer.parseInt(ing7_vol));
                }
            }
            RecipeIngredient ri8 = new RecipeIngredient();
            if(ing8 != null && !ing8_type.isEmpty() && (!ing8_vol.isEmpty() || ing8_type.equals("適量"))) {
                ri8.setUseIngredient(ing8);
                ri8.setMakeRecipe(r);
                ri8.setType(ing8_type);
                if(!ing8_type.equals("適量")) {
                    ri8.setVol(Integer.parseInt(ing8_vol));
                }
            }
            RecipeIngredient ri9 = new RecipeIngredient();
            if(ing9 != null && !ing9_type.isEmpty() && (!ing9_vol.isEmpty() || ing9_type.equals("適量"))) {
                ri9.setUseIngredient(ing9);
                ri9.setMakeRecipe(r);
                ri9.setType(ing9_type);
                if(!ing9_type.equals("適量")) {
                    ri9.setVol(Integer.parseInt(ing9_vol));
                }
            }
            RecipeIngredient ri10 = new RecipeIngredient();
            if(ing10 != null && !ing10_type.isEmpty() && (!ing10_vol.isEmpty() || ing10_type.equals("適量"))) {
                ri10.setUseIngredient(ing10);
                ri10.setMakeRecipe(r);
                ri10.setType(ing10_type);
                if(!ing10_type.equals("適量")) {
                    ri10.setVol(Integer.parseInt(ing10_vol));
                }
            }

            //RecipeIngredientのエラーチェック
            List<String> errors_ri = RecipeIngredientValidator.validate(ing1, ing1_vol, ing1_type, ing2, ing2_vol, ing2_type, ing3, ing3_vol, ing3_type, ing4, ing4_vol, ing4_type, ing5, ing5_vol, ing5_type, ing6, ing6_vol, ing6_type, ing7, ing7_vol, ing7_type, ing8, ing8_vol, ing8_type, ing9, ing9_vol, ing9_type, ing10, ing10_vol, ing10_type);
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
                request.setAttribute("ing1_type", ing1_type);
                request.setAttribute("ing2_type", ing2_type);
                request.setAttribute("ing3_type", ing3_type);
                request.setAttribute("ing4_type", ing4_type);
                request.setAttribute("ing5_type", ing5_type);
                request.setAttribute("ing6_type", ing6_type);
                request.setAttribute("ing7_type", ing7_type);
                request.setAttribute("ing8_type", ing8_type);
                request.setAttribute("ing9_type", ing9_type);
                request.setAttribute("ing10_type", ing10_type);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/new.jsp");
                rd.forward(request, response);
            }
            else {
                em.getTransaction().begin();
                em.persist(r);
                em.persist(ri1);
                em.persist(ri2);
                if(ri3.getUseIngredient() != null) {
                    em.persist(ri3);
                }
                if(ri4.getUseIngredient() != null) {
                    em.persist(ri4);
                }
                if(ri5.getUseIngredient() != null) {
                    em.persist(ri5);
                }
                if(ri6.getUseIngredient() != null) {
                    em.persist(ri6);
                }
                if(ri7.getUseIngredient() != null) {
                    em.persist(ri7);
                }
                if(ri8.getUseIngredient() != null) {
                    em.persist(ri8);
                }
                if(ri9.getUseIngredient() != null) {
                    em.persist(ri9);
                }
                if(ri10.getUseIngredient() != null) {
                    em.persist(ri10);
                }
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "レシピ投稿が完了しました。");

                request.getSession().removeAttribute("ing1");
                request.getSession().removeAttribute("ing2");
                request.getSession().removeAttribute("ing3");
                request.getSession().removeAttribute("ing4");
                request.getSession().removeAttribute("ing5");
                request.getSession().removeAttribute("ing6");
                request.getSession().removeAttribute("ing7");
                request.getSession().removeAttribute("ing8");
                request.getSession().removeAttribute("ing9");
                request.getSession().removeAttribute("ing10");

                response.sendRedirect(request.getContextPath() + "/recipes/index");
            }
        }
    }

}

package controllers.recipes;

import java.io.IOException;
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
import utils.DBUtil;

/**
 * Servlet implementation class RecipesEditServlet
 */
@WebServlet("/recipes/edit")
public class RecipesEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        Recipe r = em.find(Recipe.class, Integer.parseInt(request.getParameter("id")));

        if(r.getCreateUser().getId() == login_user.getId()) {
            List<RecipeIngredient> ingredients = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                   .setParameter("makeRecipe", r)
                                                   .getResultList();

            if(ingredients.size() >= 1) {
                request.getSession().setAttribute("ing1", ingredients.get(0).getUseIngredient());
                if(!ingredients.get(0).getType().equals("適量")) {
                    request.setAttribute("ing1_vol",ingredients.get(0).getVol());
                }
                request.setAttribute("ing1_type", ingredients.get(0).getType());
            }
            if(ingredients.size() >= 2) {
                request.getSession().setAttribute("ing2", ingredients.get(1).getUseIngredient());
                if(!ingredients.get(1).getType().equals("適量")) {
                    request.setAttribute("ing2_vol",ingredients.get(1).getVol());
                }
                request.setAttribute("ing2_type", ingredients.get(1).getType());
            }
            if(ingredients.size() >= 3) {
                request.getSession().setAttribute("ing3", ingredients.get(2).getUseIngredient());
                if(!ingredients.get(2).getType().equals("適量")) {
                    request.setAttribute("ing3_vol",ingredients.get(2).getVol());
                }
                request.setAttribute("ing3_type", ingredients.get(2).getType());
            }
            if(ingredients.size() >= 4) {
                request.getSession().setAttribute("ing4", ingredients.get(3).getUseIngredient());
                if(!ingredients.get(3).getType().equals("適量")) {
                    request.setAttribute("ing4_vol",ingredients.get(3).getVol());
                }
                request.setAttribute("ing4_type", ingredients.get(3).getType());
            }
            if(ingredients.size() >= 5) {
                request.getSession().setAttribute("ing5", ingredients.get(4).getUseIngredient());
                if(!ingredients.get(4).getType().equals("適量")) {
                    request.setAttribute("ing5_vol",ingredients.get(4).getVol());
                }
                request.setAttribute("ing5_type", ingredients.get(4).getType());
            }
            if(ingredients.size() >= 6) {
                request.getSession().setAttribute("ing6", ingredients.get(5).getUseIngredient());
                if(!ingredients.get(5).getType().equals("適量")) {
                    request.setAttribute("ing6_vol",ingredients.get(5).getVol());
                }
                request.setAttribute("ing6_type", ingredients.get(5).getType());
            }
            if(ingredients.size() >= 7) {
                request.getSession().setAttribute("ing7", ingredients.get(6).getUseIngredient());
                if(!ingredients.get(6).getType().equals("適量")) {
                    request.setAttribute("ing7_vol",ingredients.get(6).getVol());
                }
                request.setAttribute("ing7_type", ingredients.get(6).getType());
            }
            if(ingredients.size() >= 8) {
                request.getSession().setAttribute("ing8", ingredients.get(7).getUseIngredient());
                if(!ingredients.get(7).getType().equals("適量")) {
                    request.setAttribute("ing8_vol",ingredients.get(7).getVol());
                }
                request.setAttribute("ing8_type", ingredients.get(7).getType());
            }
            if(ingredients.size() >= 9) {
                request.getSession().setAttribute("ing9", ingredients.get(8).getUseIngredient());
                if(!ingredients.get(8).getType().equals("適量")) {
                    request.setAttribute("ing9_vol",ingredients.get(8).getVol());
                }
                request.setAttribute("ing9_type", ingredients.get(8).getType());
            }
            if(ingredients.size() == 10) {
                request.getSession().setAttribute("ing10", ingredients.get(9).getUseIngredient());
                if(!ingredients.get(9).getType().equals("適量")) {
                    request.setAttribute("ing10_vol",ingredients.get(9).getVol());
                }
                request.setAttribute("ing10_type", ingredients.get(9).getType());
            }

            em.close();

            request.getSession().setAttribute("recipe", r);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("recipe_id", r.getId());

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/edit.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            if(request.getParameter("chose_ing") != null && !request.getParameter("chose_ing").equals("")) {
                Ingredient chose_ing = em.find(Ingredient.class, Integer.parseInt(request.getParameter("chose_ing")));

                Integer ing_number = Integer.parseInt(request.getParameter("ing_number"));
                if(ing_number == 1) {
                    Ingredient i1 = (Ingredient)request.getSession().getAttribute("ing1");
                    if(i1 == null) {
                        i1 = new Ingredient();
                    }
                    i1 = chose_ing;
                    request.getSession().setAttribute("ing1", i1);
                }
                if(ing_number == 2) {
                    Ingredient i2 = (Ingredient)request.getSession().getAttribute("ing2");
                    if(i2 == null) {
                        i2 = new Ingredient();
                    }
                    i2 = chose_ing;
                    request.getSession().setAttribute("ing2", i2);
                }
                if(ing_number == 3) {
                    Ingredient i3 = (Ingredient)request.getSession().getAttribute("ing3");
                    if(i3 == null) {
                        i3 = new Ingredient();
                    }
                    i3 = chose_ing;
                    request.getSession().setAttribute("ing3", i3);
                }
                if(ing_number == 4) {
                    Ingredient i4 = (Ingredient)request.getSession().getAttribute("ing4");
                    if(i4 == null) {
                        i4 = new Ingredient();
                    }
                    i4 = chose_ing;
                    request.getSession().setAttribute("ing4", i4);
                }
                if(ing_number == 5) {
                    Ingredient i5 = (Ingredient)request.getSession().getAttribute("ing5");
                    if(i5 == null) {
                        i5 = new Ingredient();
                    }
                    i5 = chose_ing;
                    request.getSession().setAttribute("ing5", i5);
                }
                if(ing_number == 6) {
                    Ingredient i6 = (Ingredient)request.getSession().getAttribute("ing6");
                    if(i6 == null) {
                        i6 = new Ingredient();
                    }
                    i6 = chose_ing;
                    request.getSession().setAttribute("ing6", i6);
                }
                if(ing_number == 7) {
                    Ingredient i7 = (Ingredient)request.getSession().getAttribute("ing7");
                    if(i7 == null) {
                        i7 = new Ingredient();
                    }
                    i7 = chose_ing;
                    request.getSession().setAttribute("ing7", i7);
                }
                if(ing_number == 8) {
                    Ingredient i8 = (Ingredient)request.getSession().getAttribute("ing8");
                    if(i8 == null) {
                        i8 = new Ingredient();
                    }
                    i8 = chose_ing;
                    request.getSession().setAttribute("ing8", i8);
                }
                if(ing_number == 9) {
                    Ingredient i9 = (Ingredient)request.getSession().getAttribute("ing9");
                    if(i9 == null) {
                        i9 = new Ingredient();
                    }
                    i9 = chose_ing;
                    request.getSession().setAttribute("ing9", i9);
                }
                if(ing_number == 10) {
                    Ingredient i10 = (Ingredient)request.getSession().getAttribute("ing10");
                    if(i10 == null) {
                        i10 = new Ingredient();
                    }
                    i10 = chose_ing;
                    request.getSession().setAttribute("ing10", i10);
                }
            }

            em.close();

        request.setAttribute("_token", _token);
        request.setAttribute("ing1_vol", request.getParameter("ing1_vol"));
        request.setAttribute("ing2_vol", request.getParameter("ing2_vol"));
        request.setAttribute("ing3_vol", request.getParameter("ing3_vol"));
        request.setAttribute("ing4_vol", request.getParameter("ing4_vol"));
        request.setAttribute("ing5_vol", request.getParameter("ing5_vol"));
        request.setAttribute("ing6_vol", request.getParameter("ing6_vol"));
        request.setAttribute("ing7_vol", request.getParameter("ing7_vol"));
        request.setAttribute("ing8_vol", request.getParameter("ing8_vol"));
        request.setAttribute("ing9_vol", request.getParameter("ing9_vol"));
        request.setAttribute("ing10_vol", request.getParameter("ing10_vol"));
        request.setAttribute("ing1_type", request.getParameter("ing1_type"));
        request.setAttribute("ing2_type", request.getParameter("ing2_type"));
        request.setAttribute("ing3_type", request.getParameter("ing3_type"));
        request.setAttribute("ing4_type", request.getParameter("ing4_type"));
        request.setAttribute("ing5_type", request.getParameter("ing5_type"));
        request.setAttribute("ing6_type", request.getParameter("ing6_type"));
        request.setAttribute("ing7_type", request.getParameter("ing7_type"));
        request.setAttribute("ing8_type", request.getParameter("ing8_type"));
        request.setAttribute("ing9_type", request.getParameter("ing9_type"));
        request.setAttribute("ing10_type", request.getParameter("ing10_type"));

        if(request.getParameter("remove_flag") != null && !request.getParameter("remove_flag").equals("")) {
            if(request.getSession().getAttribute("ing10") != null) {
                request.getSession().removeAttribute("ing10");
                request.removeAttribute("ing10_vol");
                request.removeAttribute("ing10_type");
            }
            else if(request.getSession().getAttribute("ing9") != null) {
                request.getSession().removeAttribute("ing9");
                request.removeAttribute("ing9_vol");
                request.removeAttribute("ing9_type");
            }
            else if(request.getSession().getAttribute("ing8") != null) {
                request.getSession().removeAttribute("ing8");
                request.removeAttribute("ing8_vol");
                request.removeAttribute("ing8_type");
            }
            else if(request.getSession().getAttribute("ing7") != null) {
                request.getSession().removeAttribute("ing7");
                request.removeAttribute("ing7_vol");
                request.removeAttribute("ing7_type");
            }
            else if(request.getSession().getAttribute("ing6") != null) {
                request.getSession().removeAttribute("ing6");
                request.removeAttribute("ing6_vol");
                request.removeAttribute("ing6_type");
            }
            else if(request.getSession().getAttribute("ing5") != null) {
                request.getSession().removeAttribute("ing5");
                request.removeAttribute("ing5_vol");
                request.removeAttribute("ing5_type");
            }
            else if(request.getSession().getAttribute("ing4") != null) {
                request.getSession().removeAttribute("ing4");
                request.removeAttribute("ing4_vol");
                request.removeAttribute("ing4_type");
            }
            else if(request.getSession().getAttribute("ing3") != null) {
                request.getSession().removeAttribute("ing3");
                request.removeAttribute("ing3_vol");
                request.removeAttribute("ing3_type");
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/edit.jsp");
        rd.forward(request, response);
        }
    }

}

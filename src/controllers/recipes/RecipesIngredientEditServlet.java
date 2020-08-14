package controllers.recipes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
import utils.DBUtil;

/**
 * Servlet implementation class RecipesIngredientServlet
 */
@WebServlet("/recipes/ingredient_edit")
public class RecipesIngredientEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesIngredientEditServlet() {
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

            int page = 1;
            try{
                page = Integer.parseInt(request.getParameter("page"));
            }
            catch(NumberFormatException e) {
            }

            String type_search = request.getParameter("type_search");
            String name_search = request.getParameter("name_search");

            List<Ingredient> s_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
                    .setParameter("type", "スピリッツ")
                    .getResultList();

            List<Ingredient> l_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
            .setParameter("type", "リキュール")
            .getResultList();

            List<Ingredient> o_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
            .setParameter("type", "その他酒")
            .getResultList();

            List<Ingredient> sub_ingredients = em.createNamedQuery("getTypeIngredients", Ingredient.class)
            .setParameter("type", "副材料")
            .getResultList();

            List<Ingredient> ingredients = new ArrayList<Ingredient>();
            ingredients.addAll(s_ingredients);
            ingredients.addAll(l_ingredients);
            ingredients.addAll(o_ingredients);
            ingredients.addAll(sub_ingredients);

          //材料分類による絞込
            if(type_search != null && !type_search.isEmpty()) {
                Iterator<Ingredient> ingredientsIterator = ingredients.iterator();
                if(type_search.equals("スピリッツ")) {
                    while(ingredientsIterator.hasNext()) {
                        Ingredient i = ingredientsIterator.next();
                        if(!i.getType().equals("スピリッツ")) {
                            ingredientsIterator.remove();
                        }
                    }
                }
                if(type_search.equals("リキュール")) {
                    while(ingredientsIterator.hasNext()) {
                        Ingredient i = ingredientsIterator.next();
                        if(!i.getType().equals("リキュール")) {
                            ingredientsIterator.remove();
                        }
                    }
                }
                if(type_search.equals("その他酒")) {
                    while(ingredientsIterator.hasNext()) {
                        Ingredient i = ingredientsIterator.next();
                        if(!i.getType().equals("その他酒")) {
                            ingredientsIterator.remove();
                        }
                    }
                }
                if(type_search.equals("副材料")) {
                    while(ingredientsIterator.hasNext()) {
                        Ingredient i = ingredientsIterator.next();
                        if(!i.getType().equals("副材料")) {
                            ingredientsIterator.remove();
                        }
                    }
                }
            }

            //材料名による絞込
            if(name_search != null && !name_search.isEmpty()) {
                Iterator<Ingredient> ingredientsIterator = ingredients.iterator();
                while(ingredientsIterator.hasNext()) {
                    Ingredient i = ingredientsIterator.next();
                    if(!i.getName().contains(name_search)) {
                        ingredientsIterator.remove();
                    }
                }
            }

            //ページ総数計算のために材料数カウント
            long ingredients_count = ingredients.size();

            //絞込条件入力直後にページネーションから遷移された場合の対策
            if(ingredients_count <= 30 * (page - 1)) {
                page = 1;
            }

            //材料リストを表示するものだけに絞って切り取る
            if(ingredients.size() < 30 * page) {
                ingredients = ingredients.subList(30 * (page - 1), ingredients.size());
            }
            else {
                ingredients = ingredients.subList(30 * (page - 1), 30 * page);
            }

            Recipe r = (Recipe)request.getSession().getAttribute("recipe");

            r.setName(request.getParameter("name"));
            r.setType(request.getParameter("type"));
            r.setColor(request.getParameter("color"));
            r.setTaste(request.getParameter("taste"));
            r.setGlass(request.getParameter("glass"));
            r.setTechnique(request.getParameter("technique"));
            r.setIntroduction(request.getParameter("introduction"));

            request.getSession().setAttribute("recipe", r);

            em.close();

            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("ingredients", ingredients);
            request.setAttribute("ingredients_count", ingredients_count);
            request.setAttribute("page", page);
            request.setAttribute("type_search", type_search);
            request.setAttribute("name_search", name_search);
            request.setAttribute("ing_number", request.getParameter("ing_number"));
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

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/ingredient_edit.jsp");
            rd.forward(request, response);
        }
    }

}

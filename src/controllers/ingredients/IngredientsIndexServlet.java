package controllers.ingredients;

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
import utils.DBUtil;

/**
 * Servlet implementation class IngredientsIndexServlet
 */
@WebServlet("/ingredients/index")
public class IngredientsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IngredientsIndexServlet() {
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

        em.close();

        request.setAttribute("ingredients", ingredients);
        request.setAttribute("ingredients_count", ingredients_count);
        request.setAttribute("page", page);
        request.setAttribute("type_search", type_search);
        request.setAttribute("name_search", name_search);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/ingredients/index.jsp");
        rd.forward(request, response);
    }

}

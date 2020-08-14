package controllers.recipes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
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
import models.Stock;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class RecipesIndexServlet
 */
@WebServlet("/recipes/index")
public class RecipesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        }
        catch(NumberFormatException e) {
        }

        String cocktail_search = request.getParameter("cocktail_search");
        String ingredient_search = request.getParameter("ingredient_search");
        String basic = request.getParameter("basic");
        String my_recipe = request.getParameter("my_recipe");
        String others_recipe = request.getParameter("others_recipe");
        String stock = request.getParameter("stock");
        String no_stock = request.getParameter("no_stock");
        String type_short = request.getParameter("type_short");
        String type_long = request.getParameter("type_long");
        String type_hot = request.getParameter("type_hot");
        String sweet = request.getParameter("sweet");
        String dry = request.getParameter("dry");
        String m_dry = request.getParameter("m_dry");
        String medium = request.getParameter("medium");
        String shake = request.getParameter("shake");
        String stir = request.getParameter("stir");
        String build = request.getParameter("build");
        String blend = request.getParameter("blend");
        String clear = request.getParameter("clear");
        String brown = request.getParameter("brown");
        String orange = request.getParameter("orange");
        String pink = request.getParameter("pink");
        String red = request.getParameter("red");
        String yellow = request.getParameter("yellow");
        String white = request.getParameter("white");
        String green = request.getParameter("green");
        String blue = request.getParameter("blue");
        String purple = request.getParameter("purple");
        String black = request.getParameter("black");
        String soda = request.getParameter("soda");
        String no_soda = request.getParameter("no_soda");
        String weak = request.getParameter("weak");
        String moderate = request.getParameter("moderate");
        String strong = request.getParameter("strong");

        User login_user = (User)request.getSession().getAttribute("login_user");

        List<Recipe> recipes = em.createNamedQuery("getAllRecipes", Recipe.class)
                                 .getResultList();

        List<RecipeIngredient> ingredients = em.createNamedQuery("getAllRecipeIngredients", RecipeIngredient.class)
                                               .getResultList();

        List<Stock> stocks = em.createNamedQuery("getAllMyStocks", Stock.class)
                               .setParameter("user", login_user)
                               .getResultList();

        //カクテル名による絞込
        if(cocktail_search != null && !cocktail_search.isEmpty()) {
            Iterator<Recipe> recipesIterator = recipes.iterator();
            while(recipesIterator.hasNext()) {
                Recipe r = recipesIterator.next();
                if(!r.getName().contains(cocktail_search)) {
                    recipesIterator.remove();
                }
            }
        }

        //材料名による絞込
        if(ingredient_search != null && !ingredient_search.isEmpty()) {
            Iterator<RecipeIngredient> ingredientsIterator = ingredients.iterator();
            while(ingredientsIterator.hasNext()) {
                RecipeIngredient ri = ingredientsIterator.next();
                if(!ri.getUseIngredient().getName().contains(ingredient_search)) {
                    ingredientsIterator.remove();
                }
            }
            List<Integer> recipeIdList_dup = new ArrayList<Integer>();
            for(int i = 0; i < ingredients.size(); i++) {
                recipeIdList_dup.add(ingredients.get(i).getMakeRecipe().getId());
            }
            List<Integer> recipeIdList = new ArrayList<Integer>(new LinkedHashSet<>(recipeIdList_dup));
            Iterator<Recipe> recipesIterator = recipes.iterator();
            while(recipesIterator.hasNext()) {
                Recipe r = recipesIterator.next();
                if(!recipeIdList.contains(r.getId())) {
                    recipesIterator.remove();
                }
            }
        }

        //投稿者による絞込
        if((basic == null || basic.isEmpty()) && (my_recipe == null || my_recipe.isEmpty()) && (others_recipe == null || others_recipe.isEmpty())) {
            //投稿者欄がすべて未チェックなら絞込しない
        }
        else{
            if(basic == null || basic.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getCreateUser().getAdmin_flag() == 1) {
                        recipesIterator.remove();
                    }
                }
            }
            if(my_recipe == null || my_recipe.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getCreateUser().getId() == login_user.getId()) {
                        recipesIterator.remove();
                    }
                }
            }
            if(others_recipe == null || others_recipe.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getCreateUser().getAdmin_flag() == 0 && r.getCreateUser().getId() != login_user.getId()) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //材料在庫による絞込
        if((stock == null || stock.isEmpty()) && (no_stock == null || no_stock.isEmpty())) {
            //材料在庫欄がすべて未チェックなら絞込しない
        }
        else{
            if(stock == null || stock.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Integer enough = 0;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        Integer id = useIngredient.get(i).getUseIngredient().getId();
                        Integer vol = useIngredient.get(i).getVol();
                        String ing_type = useIngredient.get(i).getUseIngredient().getType();
                        String vol_type = useIngredient.get(i).getType();
                            for(int j = 0; j < stocks.size(); j++) {
                                if(stocks.get(j).getStockIngredient().getId() == id) {
                                    if(ing_type.equals("副材料")) {
                                        enough += 1;
                                    }
                                    else if(vol_type.equals("tsp") && (stocks.get(j).getVol() >= vol * 5)) {
                                        enough += 1;
                                    }
                                    else if(stocks.get(j).getVol() >= vol) {
                                        enough += 1;
                                    }
                                }
                            }
                    }
                    if(enough == useIngredient.size()) {
                        recipesIterator.remove();
                    }
                }
            }
            if(no_stock == null || no_stock.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Integer enough = 0;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        Integer id = useIngredient.get(i).getUseIngredient().getId();
                        Integer vol = useIngredient.get(i).getVol();
                        String ing_type = useIngredient.get(i).getUseIngredient().getType();
                        String vol_type = useIngredient.get(i).getType();
                            for(int j = 0; j < stocks.size(); j++) {
                                if(stocks.get(j).getStockIngredient().getId() == id) {
                                    if(ing_type.equals("副材料")) {
                                        enough += 1;
                                    }
                                    else if(vol_type.equals("tsp") && (stocks.get(j).getVol() >= vol * 5)) {
                                        enough += 1;
                                    }
                                    else if(stocks.get(j).getVol() >= vol) {
                                        enough += 1;
                                    }
                                }
                            }
                    }
                    if(enough != useIngredient.size()) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //タイプによる絞込
        if((type_short == null || type_short.isEmpty()) && (type_long == null || type_long.isEmpty()) && (type_hot == null || type_hot.isEmpty())) {
            //タイプ欄がすべて未チェックなら絞込しない
        }
        else{
            if(type_short == null || type_short.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getType().equals("ショート")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(type_long == null || type_long.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getType().equals("ロング")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(type_hot == null || type_hot.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getType().equals("ホット")) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //テイストによる絞込
        if((sweet == null || sweet.isEmpty()) && (dry == null || dry.isEmpty()) && (m_dry == null || m_dry.isEmpty()) && (medium == null || medium.isEmpty())) {
            //テイスト欄がすべて未チェックなら絞込しない
        }
        else{
            if(sweet == null || sweet.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTaste().equals("甘口")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(dry == null || dry.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTaste().equals("辛口")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(m_dry == null || m_dry.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTaste().equals("中辛")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(medium == null || medium.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTaste().equals("中甘辛口")) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //技法による絞込
        if((shake == null || shake.isEmpty()) && (stir == null || stir.isEmpty()) && (build == null || build.isEmpty()) && (blend == null || blend.isEmpty())) {
            //技法欄がすべて未チェックなら絞込しない
        }
        else{
            if(shake == null || shake.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTechnique().equals("シェーク")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(stir == null || stir.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTechnique().equals("ステア")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(build == null || build.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTechnique().equals("ビルド")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(blend == null || blend.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getTechnique().equals("ブレンド")) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //色による絞込
        if((clear == null || clear.isEmpty()) && (brown == null || brown.isEmpty()) && (orange == null || orange.isEmpty()) && (red == null || red.isEmpty()) && (yellow == null || yellow.isEmpty()) && (white == null || white.isEmpty()) && (green == null || green.isEmpty()) && (blue == null || blue.isEmpty()) && (purple == null || purple.isEmpty()) && (black == null || black.isEmpty())) {
            //色欄がすべて未チェックなら絞込しない
        }
        else{
            if(clear == null || clear.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("透明")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(brown == null || brown.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("ブラウン")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(orange == null || orange.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("オレンジ")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(pink == null || pink.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("ピンク")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(red == null || red.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("赤")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(yellow == null || yellow.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("黄")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(white == null || white.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("白")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(green == null || green.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("緑")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(blue == null || blue.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("青")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(purple == null || purple.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("紫")) {
                        recipesIterator.remove();
                    }
                }
            }
            if(black == null || black.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    if(r.getColor().equals("黒")) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //炭酸による絞込
        if((soda == null || soda.isEmpty()) && (no_soda == null || no_soda.isEmpty())) {
            //炭酸欄がすべて未チェックなら絞込しない
        }
        else{
            if(soda == null || soda.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Integer soda_flag = 0;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        if(useIngredient.get(i).getUseIngredient().getSoda_flag() == 1) {
                            soda_flag = 1;
                            break;
                        }
                    }
                    if(soda_flag == 1) {
                        recipesIterator.remove();
                    }
                }
            }
            if(no_soda == null || no_soda.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Integer soda_flag = 0;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        if(useIngredient.get(i).getUseIngredient().getSoda_flag() == 1) {
                            soda_flag = 1;
                            break;
                        }
                    }
                    if(soda_flag == 0) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //アルコール度数による絞込
        if((weak == null || weak.isEmpty()) && (moderate == null || moderate.isEmpty()) && (strong == null || strong.isEmpty())) {
            //アルコール度数欄がすべて未チェックなら絞込しない
        }
        else{
            if(weak == null || weak.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Boolean abv_cal_flag = true;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        if(useIngredient.get(i).getType().equals("適量")) {
                            abv_cal_flag = false;
                            break;
                        }
                    }
                    long recipe_abv = 0;
                    Integer total_vol = 0;
                    Double total_alc = 0.0;
                    if(abv_cal_flag) {
                        for(int i = 0; i < useIngredient.size(); i++) {
                            total_vol += useIngredient.get(i).getVol();
                            total_alc += useIngredient.get(i).getVol() * (useIngredient.get(i).getUseIngredient().getAbv() * 0.01);
                        }
                        recipe_abv = Math.round(total_alc / total_vol * 100);
                    }
                    if(recipe_abv <= 8 || !abv_cal_flag) {
                        recipesIterator.remove();
                    }
                }
            }
            if(moderate == null || moderate.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Boolean abv_cal_flag = true;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        if(useIngredient.get(i).getType().equals("適量")) {
                            abv_cal_flag = false;
                            break;
                        }
                    }
                    long recipe_abv = 0;
                    Integer total_vol = 0;
                    Double total_alc = 0.0;
                    if(abv_cal_flag) {
                        for(int i = 0; i < useIngredient.size(); i++) {
                            total_vol += useIngredient.get(i).getVol();
                            total_alc += useIngredient.get(i).getVol() * (useIngredient.get(i).getUseIngredient().getAbv() * 0.01);
                        }
                        recipe_abv = Math.round(total_alc / total_vol * 100);
                    }
                    if((recipe_abv > 8 && recipe_abv <= 24) || !abv_cal_flag) {
                        recipesIterator.remove();
                    }
                }
            }
            if(strong == null || strong.isEmpty()) {
                Iterator<Recipe> recipesIterator = recipes.iterator();
                while(recipesIterator.hasNext()) {
                    Recipe r = recipesIterator.next();
                    List<RecipeIngredient> useIngredient = em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                                             .setParameter("makeRecipe", r)
                                                             .getResultList();
                    Boolean abv_cal_flag = true;
                    for(int i = 0; i < useIngredient.size(); i++) {
                        if(useIngredient.get(i).getType().equals("適量")) {
                            abv_cal_flag = false;
                            break;
                        }
                    }
                    long recipe_abv = 0;
                    Integer total_vol = 0;
                    Double total_alc = 0.0;
                    if(abv_cal_flag) {
                        for(int i = 0; i < useIngredient.size(); i++) {
                            total_vol += useIngredient.get(i).getVol();
                            total_alc += useIngredient.get(i).getVol() * (useIngredient.get(i).getUseIngredient().getAbv() * 0.01);
                        }
                        recipe_abv = Math.round(total_alc / total_vol * 100);
                    }
                    if(recipe_abv > 24 || !abv_cal_flag) {
                        recipesIterator.remove();
                    }
                }
            }
        }

        //ページ総数計算のためにレシピ数カウント
        long recipes_count = recipes.size();

        //絞込条件入力直後にページネーションから遷移された場合の対策
        if(recipes_count <= 12 * (page - 1)) {
            page = 1;
        }

        //レシピリストを表示するものだけに絞って切り取る
        if(recipes.size() < 12 * page) {
            recipes = recipes.subList(12 * (page - 1), recipes.size());
        }
        else {
            recipes = recipes.subList(12 * (page - 1), 12 * page);
        }

        //材料リストを表示するものだけに絞って再作成
        ingredients.clear();
        for(int i = 0; i < recipes.size(); i++) {
            ingredients.addAll(em.createNamedQuery("getIngredients", RecipeIngredient.class)
                                 .setParameter("makeRecipe", recipes.get(i))
                                 .getResultList());
        }

        em.close();

        request.setAttribute("recipes", recipes);
        request.setAttribute("recipes_count", recipes_count);
        request.setAttribute("ingredients", ingredients);
        request.setAttribute("page", page);
        request.setAttribute("cocktail_search", cocktail_search);
        request.setAttribute("ingredient_search", ingredient_search);
        request.setAttribute("basic", basic);
        request.setAttribute("my_recipe", my_recipe);
        request.setAttribute("others_recipe", others_recipe);
        request.setAttribute("stock", stock);
        request.setAttribute("no_stock", no_stock);
        request.setAttribute("type_short", type_short);
        request.setAttribute("type_long", type_long);
        request.setAttribute("type_hot", type_hot);
        request.setAttribute("sweet", sweet);
        request.setAttribute("dry", dry);
        request.setAttribute("m_dry", m_dry);
        request.setAttribute("medium", medium);
        request.setAttribute("shake", shake);
        request.setAttribute("stir", stir);
        request.setAttribute("build", build);
        request.setAttribute("blend", blend);
        request.setAttribute("clear", clear);
        request.setAttribute("brown", brown);
        request.setAttribute("orange", orange);
        request.setAttribute("pink", pink);
        request.setAttribute("red", red);
        request.setAttribute("yellow", yellow);
        request.setAttribute("white", white);
        request.setAttribute("green", green);
        request.setAttribute("blue", blue);
        request.setAttribute("purple", purple);
        request.setAttribute("black", black);
        request.setAttribute("soda", soda);
        request.setAttribute("no_soda", no_soda);
        request.setAttribute("weak", weak);
        request.setAttribute("moderate", moderate);
        request.setAttribute("strong", strong);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/recipes/index.jsp");
        rd.forward(request, response);
    }

}

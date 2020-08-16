<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}" />
            </div>
        </c:if>
        <c:if test="${login_user.admin_flag == 1}">
            <div id="admin_menu">
                管理者メニュー&nbsp;
                <a href="<c:url value='/users/index' />">＞ユーザー一覧へ</a>&nbsp;
                <a href="<c:url value='/ingredients/index' />">＞材料一覧へ</a>
            </div>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン">
        <h1>マイシェルフ</h1>&nbsp;
        <a href="<c:url value='/stocks/index' />">＞在庫管理へ</a>
        <div class="window">
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${((stocks_count - 1) / 5) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div class="wrapper">
                <c:forEach var="stock" items="${stocks}" varStatus="status">
                    <div class="stock">
                        <c:if test="${stock.stockIngredient.type == 'スピリッツ'}">
                            <c:choose>
                                <c:when test="${stock.vol >= '750'}"><img id="stock" src="/cocktail_recipe/images/s_vol10.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '675'}"><img id="stock" src="/cocktail_recipe/images/s_vol9.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '600'}"><img id="stock" src="/cocktail_recipe/images/s_vol8.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '525'}"><img id="stock" src="/cocktail_recipe/images/s_vol7.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '450'}"><img id="stock" src="/cocktail_recipe/images/s_vol6.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '375'}"><img id="stock" src="/cocktail_recipe/images/s_vol5.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '300'}"><img id="stock" src="/cocktail_recipe/images/s_vol4.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '225'}"><img id="stock" src="/cocktail_recipe/images/s_vol3.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '150'}"><img id="stock" src="/cocktail_recipe/images/s_vol2.png" alt="在庫アイコン"></c:when>
                                <c:otherwise><img id="stock" src="/cocktail_recipe/images/s_vol1.png" alt="在庫アイコン"></c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${stock.stockIngredient.type == 'リキュール'}">
                            <c:choose>
                                <c:when test="${stock.vol >= '700'}"><img id="stock" src="/cocktail_recipe/images/l_vol10.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '630'}"><img id="stock" src="/cocktail_recipe/images/l_vol9.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '560'}"><img id="stock" src="/cocktail_recipe/images/l_vol8.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '490'}"><img id="stock" src="/cocktail_recipe/images/l_vol7.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '420'}"><img id="stock" src="/cocktail_recipe/images/l_vol6.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '350'}"><img id="stock" src="/cocktail_recipe/images/l_vol5.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '280'}"><img id="stock" src="/cocktail_recipe/images/l_vol4.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '210'}"><img id="stock" src="/cocktail_recipe/images/l_vol3.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '140'}"><img id="stock" src="/cocktail_recipe/images/l_vol2.png" alt="在庫アイコン"></c:when>
                                <c:otherwise><img id="stock" src="/cocktail_recipe/images/l_vol1.png" alt="在庫アイコン"></c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${stock.stockIngredient.type == 'その他酒'}">
                            <c:choose>
                                <c:when test="${stock.vol >= '700'}"><img id="stock" src="/cocktail_recipe/images/o_vol10.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '630'}"><img id="stock" src="/cocktail_recipe/images/o_vol9.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '560'}"><img id="stock" src="/cocktail_recipe/images/o_vol8.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '490'}"><img id="stock" src="/cocktail_recipe/images/o_vol7.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '420'}"><img id="stock" src="/cocktail_recipe/images/o_vol6.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '350'}"><img id="stock" src="/cocktail_recipe/images/o_vol5.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '280'}"><img id="stock" src="/cocktail_recipe/images/o_vol4.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '210'}"><img id="stock" src="/cocktail_recipe/images/o_vol3.png" alt="在庫アイコン"></c:when>
                                <c:when test="${stock.vol >= '140'}"><img id="stock" src="/cocktail_recipe/images/o_vol2.png" alt="在庫アイコン"></c:when>
                                <c:otherwise><img id="stock" src="/cocktail_recipe/images/o_vol1.png" alt="在庫アイコン"></c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${stock.stockIngredient.type == '副材料'}">
                            <img id="stock" src="/cocktail_recipe/images/sub_vol.png" alt="在庫アイコン">
                        </c:if>
                        <h2 class="cocktail_name"><c:out value="${stock.stockIngredient.name}" /></h2>
                        <c:choose>
                            <c:when test="${stock.stockIngredient.type != '副材料'}">
                                約 <c:out value="${stock.vol}" /> ml
                            </c:when>
                            <c:otherwise>
                                在庫あり
                            </c:otherwise>
                        </c:choose>
                        <br>
                        <fmt:formatDate value="${stock.updated_at}" pattern="yyyy/MM/dd" /> 更新
                        <div class="stock_button">
                            <a class="small_orange_button" href="<c:url value='/stocks/show?id=${stock.id}' />">詳細を見る</a>
                        </div>
                        <div class="stock_button">
                            <a class="small_orange_button" href="<c:url value='/recipes/index?ingredient_search=${stock.stockIngredient.name}' />">レシピ検索</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <img class="icon" src="/cocktail_recipe/images/recipe_w.png" alt="レシピアイコン">
        <h1>おすすめレシピ</h1>&nbsp;
        <a href="<c:url value='/recipes/index' />">＞レシピ検索へ</a>&nbsp;
        <a href="<c:url value='/recipes/index?my_recipe=1' />">＞マイレシピへ</a>
        <div class="recipe_wrapper">
            <c:forEach var="recipe" items="${recipes}" varStatus="status">
                <div class="small_window">
                    <div class="wrapper">
                        <div class="recipe_list1">
                            <c:if test="${recipe.glass == 'ロックグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/rock_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'タンブラー'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/tumbler_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'カクテルグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/cocktail_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'リキュールグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/liqueur_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ワイングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/wine_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'シャンパングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/champagne_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'サワーグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/sour_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ゴブレット'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/goblet_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ショットグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/shot_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'その他'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="/cocktail_recipe/images/others_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <table class="info">
                                <tbody>
                                    <tr>
                                        <td><c:out value="${recipe.type}" /></td>
                                    </tr>
                                    <tr>
                                        <td><c:out value="${recipe.taste}" /></td>
                                    </tr>
                                    <tr>
                                        <td><c:out value="${recipe.technique}" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="recipe_list2">
                            <h2 class="cocktail_name"><c:out value="${recipe.name}" /></h2>
                            <table class="ingredients">
                                <tbody>
                                    <c:forEach var="ingredient" items="${ingredients}" varStatus="status">
                                        <c:if test="${recipe.id == ingredient.makeRecipe.id}">
                                            <tr>
                                                <th><c:out value="${ingredient.useIngredient.name}" /></th>
                                                <td>
                                                    <c:if test="${ingredient.type == 'ml'}"><c:out value="${ingredient.vol}" /> ml</c:if>
                                                    <c:if test="${ingredient.type == 'tsp'}"><c:out value="${ingredient.vol}" /> tsp</c:if>
                                                    <c:if test="${ingredient.type == 'dash'}"><c:out value="${ingredient.vol}" /> dash</c:if>
                                                    <c:if test="${ingredient.type == '個'}"><c:out value="${ingredient.vol}" /> 個</c:if>
                                                    <c:if test="${ingredient.type == '適量'}"> 適量</c:if>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="action_button">
                        <a class="small_orange_button" href="<c:url value='/recipes/show?id=${recipe.id}' />">詳細を見る</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:param>
</c:import>

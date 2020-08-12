<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/recipe_w.png" alt="レシピアイコン" />
        <h1>レシピ検索</h1>
            <div class="pagination_w">
                <c:forEach var="i" begin="1" end="${((recipes_count - 1) / 12) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/recipes/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
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
                                        <tr>
                                            <c:if test="${recipe.id == ingredient.makeRecipe.id}">
                                                <th><c:out value="${ingredient.useIngredient.name}" /></th>
                                                <td>
                                                    <c:if test="${ingredient.type == 'ml'}"><c:out value="${ingredient.vol}" /> ml</c:if>
                                                    <c:if test="${ingredient.type == 'tsp'}"><c:out value="${ingredient.vol}" /> tsp</c:if>
                                                    <c:if test="${ingredient.type == 'dash'}"><c:out value="${ingredient.vol}" /> dash</c:if>
                                                    <c:if test="${ingredient.type == '個'}"><c:out value="${ingredient.vol}" /> 個</c:if>
                                                    <c:if test="${ingredient.type == '適量'}"> 適量</c:if>
                                                </td>
                                            </c:if>
                                        </tr>
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
            <div class="pagination_w">
                <c:forEach var="i" begin="1" end="${((recipes_count - 1) / 12) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/recipes/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
    </c:param>
</c:import>

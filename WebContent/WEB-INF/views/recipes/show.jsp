<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${consumptions != null}">
            <div id="flush_success">
                カクテルに使用した以下の材料について在庫数量を調整しました。<br>
                <c:forEach var="consumption" items="${consumptions}">
                    ・<c:out value="${consumption}" /><br>
                </c:forEach>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${recipe != null}">
                <img class="icon" src="/cocktail_recipe/images/myrecipe_w.png" alt="マイレシピアイコン" />
                <h1>レシピ詳細</h1>
                <div class="window">
                    <div class="wrapper">
                        <div id="image">
                            <c:if test="${recipe.glass == 'ロックグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/rock_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'タンブラー'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/tumbler_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'カクテルグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/cocktail_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'リキュールグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/liqueur_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ワイングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/wine_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'シャンパングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/champagne_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'サワーグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/sour_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ゴブレットグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/goblet_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ショットグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/shot_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'その他グラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_clear.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_brown.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_orange.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_pink.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_red.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_yellow.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_white.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_green.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_blue.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_purple.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="recipe_image" src="/cocktail_recipe/images/others_glass_black.png" alt="レシピアイコン"></c:if>
                            </c:if>
                        </div>
                        <div id="data">
                            <table id="show">
                                <tbody>
                                    <tr>
                                        <th>カクテル名</th>
                                        <td class="row0">
                                            <c:out value="${recipe.name}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>タイプ</th>
                                        <td class="row1">
                                            <c:out value="${recipe.type}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>色</th>
                                        <td class="row0">
                                            <c:out value="${recipe.color}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>テイスト</th>
                                        <td class="row1">
                                            <c:out value="${recipe.taste}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>グラス</th>
                                        <td class="row0">
                                            <c:out value="${recipe.glass}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>技法</th>
                                        <td class="row1">
                                            <c:out value="${recipe.technique}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>アルコール度数</th>
                                        <td class="row0">
                                            <c:out value="${recipe_abv}" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div id="ingredient">
                            <h2 class="ingredient">材料</h2>
                            <table class="ingredients">
                                <tbody>
                                    <c:forEach var="ingredient" items="${ingredients}" varStatus="status">
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
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="introduction">
                            <h2 class="introduction">作り方・紹介コメント</h2>
                            <c:out value="${recipe.introduction}" />
                        </div>
                    </div>
                    <div id="date_user">
                        登録日：<fmt:formatDate value="${recipe.created_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                        更新日：<fmt:formatDate value="${recipe.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                        投稿者：
                        <c:choose>
                            <c:when test="${recipe.createUser.admin_flag == '1'}">
                                管理者
                            </c:when>
                            <c:otherwise>
                                <c:out value="${recipe.createUser.name}" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="action_button">
                        <a class="gray_button" href="<c:url value='/recipes/index' />">レシピ検索に戻る</a>
                        <c:if test="${login_user.id == recipe.createUser.id}">
                            <a class="orange_button" href="<c:url value='/recipes/edit?id=${recipe.id}' />">このレシピを編集</a>
                        </c:if>
                        <button class="orange_button" type="submit" form="consume">このレシピでカクテル作成</button>
                        <form id="consume" method="POST" action="<c:url value='/recipes/consume' />">
                            <input type="hidden" name="_token" value="${_token}">
                            <input type="hidden" name="recipe_id" value="${recipe.id}">
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/recipes/index' />">レシピ検索に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>

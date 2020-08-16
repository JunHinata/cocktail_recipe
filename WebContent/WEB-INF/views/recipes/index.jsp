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
            <div class="window">
                <form id="search_recipe" method="GET" action="<c:url value='/recipes/index' />">
                    <table class="word_search">
                        <tbody>
                            <tr>
                                <th>カクテル名検索：</th>
                                <td><input type="text" name="cocktail_search" value="${cocktail_search}" /></td>
                                <th>材料名検索：</th>
                                <td><input type="text" name="ingredient_search" value="${ingredient_search}" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="check_search">
                        <tbody>
                            <tr>
                                <th>投稿者：</th>
                                <td><input type="checkbox" name="basic" value="1" <c:if test="${basic == '1'}">checked</c:if>>&nbsp;ベーシック</td>
                                <td><input type="checkbox" name="my_recipe" value="1" <c:if test="${my_recipe == '1'}">checked</c:if>>&nbsp;マイレシピ</td>
                                <td><input type="checkbox" name="others_recipe" value="1" <c:if test="${others_recipe == '1'}">checked</c:if>>&nbsp;他ユーザーレシピ</td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>材料在庫：</th>
                                <td><input type="checkbox" name="stock" value="1" <c:if test="${stock == '1'}">checked</c:if>>&nbsp;あり</td>
                                <td><input type="checkbox" name="no_stock" value="1" <c:if test="${no_stock == '1'}">checked</c:if>>&nbsp;なし</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>タイプ：</th>
                                <td><input type="checkbox" name="type_short" value="1" <c:if test="${type_short == '1'}">checked</c:if>>&nbsp;ショート</td>
                                <td><input type="checkbox" name="type_long" value="1" <c:if test="${type_long == '1'}">checked</c:if>>&nbsp;ロング</td>
                                <td><input type="checkbox" name="type_hot" value="1" <c:if test="${type_hot == '1'}">checked</c:if>>&nbsp;ホット</td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>テイスト：</th>
                                <td><input type="checkbox" name="sweet" value="1" <c:if test="${sweet == '1'}">checked</c:if>>&nbsp;甘口</td>
                                <td><input type="checkbox" name="dry" value="1" <c:if test="${dry == '1'}">checked</c:if>>&nbsp;辛口</td>
                                <td><input type="checkbox" name="m_dry" value="1" <c:if test="${m_dry == '1'}">checked</c:if>>&nbsp;中辛</td>
                                <td><input type="checkbox" name="medium" value="1" <c:if test="${medium == '1'}">checked</c:if>>&nbsp;中甘辛口</td>
                            </tr>
                            <tr>
                                <th>技法：</th>
                                <td><input type="checkbox" name="shake" value="1" <c:if test="${shake == '1'}">checked</c:if>>&nbsp;シェイク</td>
                                <td><input type="checkbox" name="stir" value="1" <c:if test="${stir == '1'}">checked</c:if>>&nbsp;ステア</td>
                                <td><input type="checkbox" name="build" value="1" <c:if test="${build == '1'}">checked</c:if>>&nbsp;ビルド</td>
                                <td><input type="checkbox" name="blend" value="1" <c:if test="${blend == '1'}">checked</c:if>>&nbsp;ブレンド</td>
                            </tr>
                            <tr>
                                <th>色：</th>
                                <td><input type="checkbox" name="clear" value="1" <c:if test="${clear == '1'}">checked</c:if>>&nbsp;透明</td>
                                <td><input type="checkbox" name="brown" value="1" <c:if test="${brown == '1'}">checked</c:if>>&nbsp;ブラウン</td>
                                <td><input type="checkbox" name="orange" value="1" <c:if test="${orange == '1'}">checked</c:if>>&nbsp;オレンジ</td>
                                <td><input type="checkbox" name="pink" value="1" <c:if test="${pink == '1'}">checked</c:if>>&nbsp;ピンク</td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input type="checkbox" name="red" value="1" <c:if test="${red == '1'}">checked</c:if>>&nbsp;赤</td>
                                <td><input type="checkbox" name="yellow" value="1" <c:if test="${yellow == '1'}">checked</c:if>>&nbsp;黄</td>
                                <td><input type="checkbox" name="white" value="1" <c:if test="${white == '1'}">checked</c:if>>&nbsp;白</td>
                                <td><input type="checkbox" name="green" value="1" <c:if test="${green == '1'}">checked</c:if>>&nbsp;緑</td>
                            <tr>
                                <th></th>
                                <td><input type="checkbox" name="blue" value="1" <c:if test="${blue == '1'}">checked</c:if>>&nbsp;青</td>
                                <td><input type="checkbox" name="purple" value="1" <c:if test="${purple == '1'}">checked</c:if>>&nbsp;紫</td>
                                <td><input type="checkbox" name="black" value="1" <c:if test="${black == '1'}">checked</c:if>>&nbsp;黒</td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>炭酸：</th>
                                <td><input type="checkbox" name="soda" value="1" <c:if test="${soda == '1'}">checked</c:if>>&nbsp;あり</td>
                                <td><input type="checkbox" name="no_soda" value="1" <c:if test="${no_soda == '1'}">checked</c:if>>&nbsp;なし</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>アルコール度数：</th>
                                <td><input type="checkbox" name="weak" value="1" <c:if test="${weak == '1'}">checked</c:if>>&nbsp;～８度</td>
                                <td><input type="checkbox" name="moderate" value="1" <c:if test="${moderate == '1'}">checked</c:if>>&nbsp;９～２４度</td>
                                <td><input type="checkbox" name="strong" value="1" <c:if test="${strong == '1'}">checked</c:if>>&nbsp;２５度～</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="search_button">
                        <button class="search_button" type="submit">検索</button>
                    </div>
                </form>
            </div>
            <div class="pagination_w">
                <c:forEach var="i" begin="1" end="${((recipes_count - 1) / 12) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <button class="recipe_page_anchor" form="search_recipe" type="submit" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
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
            <div class="pagination_w">
                <c:forEach var="i" begin="1" end="${((recipes_count - 1) / 12) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <button class="recipe_page_anchor" form="search_recipe" type="submit" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
    </c:param>
</c:import>

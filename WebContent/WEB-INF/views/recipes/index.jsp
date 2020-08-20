<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <img class="icon" src="https://i.gyazo.com/38296125cdc05165151b987be873fac7.png" alt="レシピアイコン" />
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
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/158ee4e383771c2869e9b31acb4af450.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/6f18170b0864441395390214cb0fb98d.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/d1d4f0579acd59a57915cdaeab856804.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/884865b8d5c6a65a8bf94dde1041d450.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/33c1b3d5ef15d73f0c07884b4363978d.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/098edc5ff0d55f2a23a614ae7a988e61.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/70505cebb491e3d6c00eced13b357936.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/9efa4b20c8f4e4528bdfce8852235f5d.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/76b1162355f8ff7aa9c16756c2682cc1.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/1cd7df09a735501ecfb2f611dc4116cb.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/fec28ae6cba4e441c59dd654033e0084.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'タンブラー'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/136d9a6feb3969d3dac04d0afd725a9e.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/db02f4523fd59f2f55bd1b25e567ab1f.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/565d866d13fa427c6d7190aacfe14a33.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/94094025f0cb076535c0e87a4da95755.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/a2709b63fade59e63c5e269445793096.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/26252e84a8e5fb25584791b0cefd8e57.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/3ab4c387e1b87be8811ca10b7be91c40.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/88722e0cf8a7cfbf89637c0b0b331624.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/ba1033016c5228eb15ba3fe6bf9422c6.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/008e7adc7ad1114b7637b2034a725fc1.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/eb4a5c09eed852484823b8301f43d3a6.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'カクテルグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/010858a25c8f467da2fb60b6ab0f22ed.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/10579801b54fd6c97cbe403576d60e32.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/f819bb48544d62f4f57ea0b15a581229.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/8cf57a8eba3ccb3d37ac44140727c959.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/b04bbbff46d32fcae09769e7f14f41b5.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/cebd6f1dc69e2a435ca7b51e283dffdf.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/73709937c3afc553511cab1e87c2faf6.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/b76e2ee29fad7fa77e153e53f5c71b2a.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/3b216f5ee73c75c61add3e67ff0e8f2e.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/0540482c104f5d464c1a7c8a56a748d0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ba6ada23b8660e8b6608044935acb58f.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'リキュールグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/a7b1b6e2c5ab636506730acf982b7009.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/e3641eab610f88454d584edfab06501a.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/4eb0356796c46b6ae8cd5a0079a40812.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/61829771d143755e7735559538b75d45.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/33c8a5638e211617cc23e467e2936c76.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/7a587aa4006694c783b10a3c97c85231.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/3a17826b7284466db172f8bfbedc0394.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/e0f54077a4cdaef434785e16fc64b7b8.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/94c97db284e947dba4b97ea0da7bfa83.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/d34b0fafa2d67848f0d6ca151aee285b.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/4409c33dc1fdd03185efb879726139cb.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ワイングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/ee81def45a30bf86c61cdf1cd6895973.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/de58e43f23579aafee60690fd564e5de.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/f426945b5393ed66c8ee5ff348f87685.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/80b5746973c7b2e7c720362e9dfe5570.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/6cf0739e90cddca19b95928b4564a480.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/ebe822abec23d44c9cf991325f7f03e3.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/15e0ae2d40f2e9ee81fd81da6d5dc285.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/c90174d3df815fe57d5479fed4c273f0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/0745f18e0f8b4cc013f870b07be71e4b.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/3b8587362e7c89f991ad574d56b0911e.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ce66766dd89668224e0e4f038dd11c77.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'シャンパングラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5572418ed5657519b55c192e7e419cdd.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/29ab7b2d3b1c751c93d654f9ff0a96ac.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/450708a99154f07903bdac42cc7011d2.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/08c37ddd7e1f800a37839b4be53760d5.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/85fad482b39d0f11b6ae731740da059a.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/b57a69755777d66a2827160bd1fb395e.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/28d830b8b1a2e3e42353bff682ee27ec.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/7a418d1eb4ced8f0754fe61196d29464.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/6946b4523242837e6628ee69abb683ec.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/9919e3d8f743c4feae2c53a6fdaed6e7.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/bf7a71edcebec1e66be496cbc8535785.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'サワーグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5b40e18ded8794dc2f250ce29048bb22.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/94aeaf9d918e4b174df6888b5fa35a01.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/1b6c0517855a3657ff3ac1119c8fb1e7.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/1b20eb5f3ddbaeff99b7049455d703de.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/0f0dff7d813522027abe521689c98191.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/6bdc2d42d3ee9f530daded1c43a50196.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/e4274dd3555bea7024de5bd4a8b7fc38.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/ebd19c0c96afc0e7a89dc4c26924eafc.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/580daac8aaee35c54425df109f5c96eb.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/f1f2b47ad36b411a8f0de7b3b494fdad.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/7553111923074ad11e81ffa993f49fa2.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ゴブレット'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5778fea1a7feaf2e216edc50dec27dc1.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/66e69bedbd9cdf66c469d4c0dd54a2e7.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/3e3876026933f022596882138c2a4815.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/628853fb87b9167a456f915ad2dad791.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/096e5a67a42877183f9fb87e972b55c8.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/8e32d0240a97d0a3e86f610e32d7e0fe.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/80fe9445f00c72175266c2e2eeecd4a1.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/8279bb5f482671cd622b03dccf9eb662.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/89b7fcf29e7af5b27dbe2869983df808.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/d9476aeeb7c64ba0daa40194c2487c4b.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/21121fec5b080401fa7babab1087ab35.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'ショットグラス'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/377d806a0e404849ae387c7e13e5b3f0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/6bdeeb3e2e2e13c144106557e4c5a350.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/570963717b25e9e3ae0371080976655a.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/feeb213426984bf4d0267af3b6f311e0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/9279c6d717c72fb1a98293b3b3893206.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/2bf3b1e756f1d7182b2eea61920b0198.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/f9e290203d08e431ab7fe85571722495.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/8c254f9736f144e0eba4dda0d17b8e68.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/5a312aa97720d9007bffe6bdcb751a1a.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/9e19a4b74a9bac1badfdd2171190cb52.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ab560919e76bcbe16ab1b99cda9c165d.png" alt="レシピアイコン"></c:if>
                            </c:if>
                            <c:if test="${recipe.glass == 'その他'}">
                                <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/9080d2ab523442bff6173ac42869c1e0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/845ff4691c5f458179cf418444926794.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/73e9564a0b3ea4cd9735b8a6021a513f.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/8e8b191866df2db7db48f39d60c8ff04.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/953c5fbff4e0c1aa7a666ca607716b28.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/051bb3f843b4c802c3c6d4558ae3e3a0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/f8b6ffe614508e124e1e8e737f4f6016.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/52013a22a1fcbb1095d44f11f8419db0.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/aaa7603719faf056fb09f02c166f5677.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/a742ca2d1846bdd8bf5134be57500496.png" alt="レシピアイコン"></c:if>
                                <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/f6af496582b26eae6c59c4968a11da44.png" alt="レシピアイコン"></c:if>
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

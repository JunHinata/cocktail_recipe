<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br>
                <c:forEach var="error" items="${errors}">
                    ・<c:out value="${error}" /><br>
                </c:forEach>
            </div>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/myrecipe_w.png" alt="マイレシピアイコン" />
        <h1>マイレシピ投稿</h1>
        <div class="window">

            <form id="new" method="POST" action="?">
                <div class="wrapper">
                    <div id="image">
                    </div>
                    <div id="data">
                        <table id="show">
                            <tbody>
                                <tr>
                                    <th>カクテル名</th>
                                    <td class="row0">
                                        <input type="text" name="name" value="${recipe.name}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>タイプ</th>
                                    <td class="row1">
                                        <select name="type">
                                            <option value="ショート"<c:if test="${recipe.type == 'ショート'}">selected</c:if>>ショート</option>
                                            <option value="ロング"<c:if test="${recipe.type == 'ロング'}">selected</c:if>>ロング</option>
                                            <option value="ホット"<c:if test="${recipe.type == 'ホット'}">selected</c:if>>ホット</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>色</th>
                                    <td class="row0">
                                        <select name="color">
                                            <option value="透明"<c:if test="${recipe.color == '透明'}">selected</c:if>>透明</option>
                                            <option value="ブラウン"<c:if test="${recipe.color == 'ブラウン'}">selected</c:if>>ブラウン</option>
                                            <option value="オレンジ"<c:if test="${recipe.color == 'オレンジ'}">selected</c:if>>オレンジ</option>
                                            <option value="ピンク"<c:if test="${recipe.color == 'ピンク'}">selected</c:if>>ピンク</option>
                                            <option value="赤"<c:if test="${recipe.color == '赤'}">selected</c:if>>赤</option>
                                            <option value="黄"<c:if test="${recipe.color == '黄'}">selected</c:if>>黄</option>
                                            <option value="白"<c:if test="${recipe.color == '白'}">selected</c:if>>白</option>
                                            <option value="緑"<c:if test="${recipe.color == '緑'}">selected</c:if>>緑</option>
                                            <option value="青"<c:if test="${recipe.color == '青'}">selected</c:if>>青</option>
                                            <option value="紫"<c:if test="${recipe.color == '紫'}">selected</c:if>>紫</option>
                                            <option value="黒"<c:if test="${recipe.color == '黒'}">selected</c:if>>黒</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>テイスト</th>
                                    <td class="row1">
                                        <select name="taste">
                                            <option value="甘口"<c:if test="${recipe.taste == '甘口'}">selected</c:if>>甘口</option>
                                            <option value="辛口"<c:if test="${recipe.taste == '辛口'}">selected</c:if>>辛口</option>
                                            <option value="中辛"<c:if test="${recipe.taste == '中辛'}">selected</c:if>>中辛</option>
                                            <option value="中甘辛口"<c:if test="${recipe.taste == '中甘辛口'}">selected</c:if>>中甘辛口</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>グラス</th>
                                    <td class="row0">
                                        <select name="glass">
                                            <option value="ロックグラス"<c:if test="${recipe.glass == 'ロックグラス'}">selected</c:if>>ロックグラス</option>
                                            <option value="タンブラー"<c:if test="${recipe.glass == 'タンブラー'}">selected</c:if>>タンブラー</option>
                                            <option value="カクテルグラス"<c:if test="${recipe.glass == 'カクテルグラス'}">selected</c:if>>カクテルグラス</option>
                                            <option value="リキュールグラス"<c:if test="${recipe.glass == 'リキュールグラス'}">selected</c:if>>リキュールグラス</option>
                                            <option value="ワイングラス"<c:if test="${recipe.glass == 'ワイングラス'}">selected</c:if>>ワイングラス</option>
                                            <option value="シャンパングラス"<c:if test="${recipe.glass == 'シャンパングラス'}">selected</c:if>>シャンパングラス</option>
                                            <option value="サワーグラス"<c:if test="${recipe.glass == 'サワーグラス'}">selected</c:if>>サワーグラス</option>
                                            <option value="ゴブレット"<c:if test="${recipe.glass == 'ゴブレット'}">selected</c:if>>ゴブレット</option>
                                            <option value="ショットグラス"<c:if test="${recipe.glass == 'ショットグラス'}">selected</c:if>>ショットグラス</option>
                                            <option value="その他"<c:if test="${recipe.glass == 'その他'}">selected</c:if>>その他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>技法</th>
                                    <td class="row1">
                                        <select name="technique">
                                            <option value="ビルド"<c:if test="${recipe.technique == 'ビルド'}">selected</c:if>>ビルド</option>
                                            <option value="ステア"<c:if test="${recipe.technique == 'ステア'}">selected</c:if>>ステア</option>
                                            <option value="シェーク"<c:if test="${recipe.technique == 'シェーク'}">selected</c:if>>シェーク</option>
                                            <option value="ブレンド"<c:if test="${recipe.technique == 'ブレンド'}">selected</c:if>>ブレンド</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="wrapper">
                    <div id="ingredient">
                        <h2 class="ingredient">材料</h2>
                        <table class="chose_ingredients">
                            <tbody>
                                <tr>
                                    <th>
                                        <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="1">
                                            <c:choose>
                                                <c:when test="${ing1.name != null}">
                                                    <c:out value="${ing1.name}" />
                                                </c:when>
                                                <c:otherwise>
                                                    材料1を選択
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </th>
                                    <c:if test="${ing1.name != null}">
                                        <td>
                                            <input id="number1" type="number" min="0" max="500" name="ing1_vol" value="${ing1_vol}" />
                                        </td>
                                        <td>
                                            <select id="type1" name="ing1_type" onchange="formSwitch1()">
                                                <option value="ml"<c:if test="${ing1_type == 'ml'}">selected</c:if>>ml</option>
                                                <option value="tsp"<c:if test="${ing1_type == 'tsp'}">selected</c:if>>tsp</option>
                                                <option value="dash"<c:if test="${ing1_type == 'dash'}">selected</c:if>>dash</option>
                                                <c:if test="${ing1.type == '副材料'}">
                                                    <option value="個"<c:if test="${ing1_type == '個'}">selected</c:if>>個</option>
                                                    <option value="適量"<c:if test="${ing1_type == '適量'}">selected</c:if>>適量</option>
                                                </c:if>
                                            </select>
                                        </td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th>
                                        <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="2">
                                            <c:choose>
                                                <c:when test="${ing2.name != null}">
                                                    <c:out value="${ing2.name}" />
                                                </c:when>
                                                <c:otherwise>
                                                    材料2を選択
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </th>
                                    <c:if test="${ing2.name != null}">
                                        <td>
                                            <input id="number2" type="number" min="0" max="500" name="ing2_vol" value="${ing2_vol}" />
                                        </td>
                                        <td>
                                            <select id="type2" name="ing2_type" onchange="formSwitch2()">
                                                <option value="ml"<c:if test="${ing2_type == 'ml'}">selected</c:if>>ml</option>
                                                <option value="tsp"<c:if test="${ing2_type == 'tsp'}">selected</c:if>>tsp</option>
                                                <option value="dash"<c:if test="${ing2_type == 'dash'}">selected</c:if>>dash</option>
                                                <c:if test="${ing2.type == '副材料'}">
                                                    <option value="個"<c:if test="${ing2_type == '個'}">selected</c:if>>個</option>
                                                    <option value="適量"<c:if test="${ing2_type == '適量'}">selected</c:if>>適量</option>
                                                </c:if>
                                            </select>
                                        </td>
                                    </c:if>
                                </tr>
                                <c:if test="${ing1.name != null && ing2.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="3">
                                                <c:choose>
                                                    <c:when test="${ing3.name != null}">
                                                        <c:out value="${ing3.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料3を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing3.name != null}">
                                            <td>
                                                <input id="number3" type="number" min="0" max="500" name="ing3_vol" value="${ing3_vol}" />
                                            </td>
                                            <td>
                                                <select id="type3" name="ing3_type" onchange="formSwitch3()">
                                                    <option value="ml"<c:if test="${ing3_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing3_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing3_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing3.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing3_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing3_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing3.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="4">
                                                <c:choose>
                                                    <c:when test="${ing4.name != null}">
                                                        <c:out value="${ing4.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料4を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing4.name != null}">
                                            <td>
                                                <input id="number4" type="number" min="0" max="500" name="ing4_vol" value="${ing4_vol}" />
                                            </td>
                                            <td>
                                                <select id="type4" name="ing4_type" onchange="formSwitch4()">
                                                    <option value="ml"<c:if test="${ing4_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing4_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing4_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing4.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing4_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing4_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing4.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="5">
                                                <c:choose>
                                                    <c:when test="${ing5.name != null}">
                                                        <c:out value="${ing5.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料5を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing5.name != null}">
                                            <td>
                                                <input id="number5" type="number" min="0" max="500" name="ing5_vol" value="${ing5_vol}" />
                                            </td>
                                            <td>
                                                <select id="type5" name="ing5_type" onchange="formSwitch5()">
                                                    <option value="ml"<c:if test="${ing5_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing5_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing5_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing5.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing5_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing5_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing5.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="6">
                                                <c:choose>
                                                    <c:when test="${ing6.name != null}">
                                                        <c:out value="${ing6.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料6を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing6.name != null}">
                                            <td>
                                                <input id="number6" type="number" min="0" max="500" name="ing6_vol" value="${ing6_vol}" />
                                            </td>
                                            <td>
                                                <select id="type6" name="ing6_type" onchange="formSwitch6()">
                                                    <option value="ml"<c:if test="${ing6_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing6_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing6_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing6.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing6_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing6_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing6.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="7">
                                                <c:choose>
                                                    <c:when test="${ing7.name != null}">
                                                        <c:out value="${ing7.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料7を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing7.name != null}">
                                            <td>
                                                <input id="number7" type="number" min="0" max="500" name="ing7_vol" value="${ing7_vol}" />
                                            </td>
                                            <td>
                                                <select id="type7" name="ing7_type" onchange="formSwitch7()">
                                                    <option value="ml"<c:if test="${ing7_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing7_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing7_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing7.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing7_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing7_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing7.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="8">
                                                <c:choose>
                                                    <c:when test="${ing8.name != null}">
                                                        <c:out value="${ing8.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料8を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing8.name != null}">
                                            <td>
                                                <input id="number8" type="number" min="0" max="500" name="ing8_vol" value="${ing8_vol}" />
                                            </td>
                                            <td>
                                                <select id="type8" name="ing8_type" onchange="formSwitch8()">
                                                    <option value="ml"<c:if test="${ing8_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing8_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing8_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing8.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing8_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing8_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing8.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="9">
                                                <c:choose>
                                                    <c:when test="${ing9.name != null}">
                                                        <c:out value="${ing9.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料9を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing9.name != null}">
                                            <td>
                                                <input id="number9" type="number" min="0" max="500" name="ing9_vol" value="${ing9_vol}" />
                                            </td>
                                            <td>
                                                <select id="type9" name="ing9_type" onchange="formSwitch9()">
                                                    <option value="ml"<c:if test="${ing9_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing9_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing9_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing9.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing9_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing9_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing9.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="10">
                                                <c:choose>
                                                    <c:when test="${ing10.name != null}">
                                                        <c:out value="${ing10.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料10を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing10.name != null}">
                                            <td>
                                                <input id="number10" type="number" min="0" max="500" name="ing10_vol" value="${ing10_vol}" />
                                            </td>
                                            <td>
                                                <select id="type10" name="ing10_type" onchange="formSwitch10()">
                                                    <option value="ml"<c:if test="${ing10_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing10_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing10_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing10.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing10_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing10_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>
                                        <c:if test="${ing3.name != null}">
                                            <button class="as_red_anchor" type="submit" form="new" formaction="<c:url value='/recipes/new' />" name="remove_flag" value="1">材料を1つ取消</button>
                                        </c:if>
                                    </th>
                                    <td></td><td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="introduction">
                        <h2 class="introduction">作り方・紹介コメント</h2>
                        <textarea name="introduction" rows="10" cols="50">${recipe.introduction}</textarea>
                    </div>
                </div>
                <div class="action_button">
                    <input type="hidden" name="_token" value="${_token}" />
                    <a class="gray_button" href="<c:url value='/' />">キャンセル</a>
                    <button class="orange_button" type="submit" formaction="<c:url value='/recipes/create' />">このレシピを投稿</button>
                </div>
            </form>

            <script>
                //"適量"が既に選択されている場合は数値入力フォームを非表示
                if(${ing1_type == "適量"}) {
                    document.getElementById("number1").style.display = "none";
                }
                if(${ing2_type == "適量"}) {
                    document.getElementById("number2").style.display = "none";
                }
                if(${ing3_type == "適量"}) {
                    document.getElementById("number3").style.display = "none";
                }
                if(${ing4_type == "適量"}) {
                    document.getElementById("number4").style.display = "none";
                }
                if(${ing5_type == "適量"}) {
                    document.getElementById("number5").style.display = "none";
                }
                if(${ing6_type == "適量"}) {
                    document.getElementById("number6").style.display = "none";
                }
                if(${ing7_type == "適量"}) {
                    document.getElementById("number7").style.display = "none";
                }
                if(${ing8_type == "適量"}) {
                    document.getElementById("number8").style.display = "none";
                }
                if(${ing9_type == "適量"}) {
                    document.getElementById("number9").style.display = "none";
                }
                if(${ing10_type == "適量"}) {
                    document.getElementById("number10").style.display = "none";
                }

                function formSwitch1() {
                    if(document.getElementById("type1")) {
                        select = document.getElementById("type1").value;
                        if(select == "適量") {
                            //"適量"が選択された場合数値入力フォームを非表示
                            document.getElementById("number1").style.display = "none";
                        }
                        else if(select != "適量") {
                            //"適量"以外が選択された場合数値入力フォームを表示
                            document.getElementById("number1").style.display = "";
                        }
                    }
                }
                function formSwitch2() {
                    if(document.getElementById("type2")) {
                        select = document.getElementById("type2").value;
                        if(select == "適量") {
                            document.getElementById("number2").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number2").style.display = "";
                        }
                    }
                }
                function formSwitch3() {
                    if(document.getElementById("type3")) {
                        select = document.getElementById("type3").value;
                        if(select == "適量") {
                            document.getElementById("number3").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number3").style.display = "";
                        }
                    }
                }
                function formSwitch4() {
                    if(document.getElementById("type4")) {
                        select = document.getElementById("type4").value;
                        if(select == "適量") {
                            document.getElementById("number4").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number4").style.display = "";
                        }
                    }
                }
                function formSwitch5() {
                    if(document.getElementById("type5")) {
                        select = document.getElementById("type5").value;
                        if(select == "適量") {
                            document.getElementById("number5").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number5").style.display = "";
                        }
                    }
                }
                function formSwitch6() {
                    if(document.getElementById("type6")) {
                        select = document.getElementById("type6").value;
                        if(select == "適量") {
                            document.getElementById("number6").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number6").style.display = "";
                        }
                    }
                }
                function formSwitch7() {
                    if(document.getElementById("type7")) {
                        select = document.getElementById("type7").value;
                        if(select == "適量") {
                            document.getElementById("number7").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number7").style.display = "";
                        }
                    }
                }
                function formSwitch8() {
                    if(document.getElementById("type8")) {
                        select = document.getElementById("type8").value;
                        if(select == "適量") {
                            document.getElementById("number8").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number8").style.display = "";
                        }
                    }
                }
                function formSwitch9() {
                    if(document.getElementById("type9")) {
                        select = document.getElementById("type9").value;
                        if(select == "適量") {
                            document.getElementById("number9").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number9").style.display = "";
                        }
                    }
                }
                function formSwitch10() {
                    if(document.getElementById("type10")) {
                        select = document.getElementById("type10").value;
                        if(select == "適量") {
                            document.getElementById("number10").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number10").style.display = "";
                        }
                    }
                }
            </script>
        </div>
    </c:param>
</c:import>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h1>マイレシピ編集</h1>

        <form id="edit" method="POST" action="?">
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
            <div class="ingredient">
                <h2 class="ingredient">材料</h2>
                <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="1">
                    <c:choose>
                        <c:when test="${ing1.name != null}">
                            <c:out value="${ing1.name}" />
                        </c:when>
                        <c:otherwise>
                            材料1を選択
                        </c:otherwise>
                    </c:choose>
                </button>
                <c:if test="${ing1.name != null}">
                    <input type="number" min="0" max="500" name="ing1_vol" value="${ing1_vol}" />
                    <select name="ing1_type">
                        <option value="ml"<c:if test="${ing1_type == 'ml'}">selected</c:if>>ml</option>
                        <option value="tsp"<c:if test="${ing1_type == 'tsp'}">selected</c:if>>tsp</option>
                        <option value="dash"<c:if test="${ing1_type == 'dash'}">selected</c:if>>dash</option>
                        <c:if test="${ing1.type == '副材料'}">
                            <option value="個"<c:if test="${ing1_type == '個'}">selected</c:if>>個</option>
                            <option value="適量"<c:if test="${ing1_type == '適量'}">selected</c:if>>適量</option>
                        </c:if>
                    </select>
                </c:if>
                <br>
                <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="2">
                    <c:choose>
                        <c:when test="${ing2.name != null}">
                            <c:out value="${ing2.name}" />
                        </c:when>
                        <c:otherwise>
                            材料2を選択
                        </c:otherwise>
                    </c:choose>
                </button>
                <c:if test="${ing2.name != null}">
                    <input type="number" min="0" max="500" name="ing2_vol" value="${ing2_vol}" />
                    <select name="ing2_type">
                        <option value="ml"<c:if test="${ing2_type == 'ml'}">selected</c:if>>ml</option>
                        <option value="tsp"<c:if test="${ing2_type == 'tsp'}">selected</c:if>>tsp</option>
                        <option value="dash"<c:if test="${ing2_type == 'dash'}">selected</c:if>>dash</option>
                        <c:if test="${ing2.type == '副材料'}">
                            <option value="個"<c:if test="${ing2_type == '個'}">selected</c:if>>個</option>
                            <option value="適量"<c:if test="${ing2_type == '適量'}">selected</c:if>>適量</option>
                        </c:if>
                    </select>
                </c:if>
                <br>
                <c:if test="${ing1.name != null && ing2.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="3">
                        <c:choose>
                            <c:when test="${ing3.name != null}">
                                <c:out value="${ing3.name}" />
                            </c:when>
                            <c:otherwise>
                                材料3を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing3.name != null}">
                        <input type="number" min="0" max="500" name="ing3_vol" value="${ing3_vol}" />
                        <select name="ing3_type">
                            <option value="ml"<c:if test="${ing3_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing3_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing3_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing3.type == '副材料'}">
                                <option value="個"<c:if test="${ing3_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing3_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing3.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="4">
                        <c:choose>
                            <c:when test="${ing4.name != null}">
                                <c:out value="${ing4.name}" />
                            </c:when>
                            <c:otherwise>
                                材料4を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing4.name != null}">
                        <input type="number" min="0" max="500" name="ing4_vol" value="${ing4_vol}" />
                        <select name="ing4_type">
                            <option value="ml"<c:if test="${ing4_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing4_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing4_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing4.type == '副材料'}">
                                <option value="個"<c:if test="${ing4_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing4_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing4.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="5">
                        <c:choose>
                            <c:when test="${ing5.name != null}">
                                <c:out value="${ing5.name}" />
                            </c:when>
                            <c:otherwise>
                                材料5を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing5.name != null}">
                        <input type="number" min="0" max="500" name="ing5_vol" value="${ing5_vol}" />
                        <select name="ing5_type">
                            <option value="ml"<c:if test="${ing5_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing5_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing5_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing5.type == '副材料'}">
                                <option value="個"<c:if test="${ing5_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing5_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing5.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="6">
                        <c:choose>
                            <c:when test="${ing6.name != null}">
                                <c:out value="${ing6.name}" />
                            </c:when>
                            <c:otherwise>
                                材料6を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing6.name != null}">
                        <input type="number" min="0" max="500" name="ing6_vol" value="${ing6_vol}" />
                        <select name="ing6_type">
                            <option value="ml"<c:if test="${ing6_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing6_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing6_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing6.type == '副材料'}">
                                <option value="個"<c:if test="${ing6_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing6_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing6.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="7">
                        <c:choose>
                            <c:when test="${ing7.name != null}">
                                <c:out value="${ing7.name}" />
                            </c:when>
                            <c:otherwise>
                                材料7を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing7.name != null}">
                        <input type="number" min="0" max="500" name="ing7_vol" value="${ing7_vol}" />
                        <select name="ing7_type">
                            <option value="ml"<c:if test="${ing7_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing7_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing7_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing7.type == '副材料'}">
                                <option value="個"<c:if test="${ing7_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing7_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing7.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="8">
                        <c:choose>
                            <c:when test="${ing8.name != null}">
                                <c:out value="${ing8.name}" />
                            </c:when>
                            <c:otherwise>
                                材料8を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing8.name != null}">
                        <input type="number" min="0" max="500" name="ing8_vol" value="${ing8_vol}" />
                        <select name="ing8_type">
                            <option value="ml"<c:if test="${ing8_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing8_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing8_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing8.type == '副材料'}">
                                <option value="個"<c:if test="${ing8_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing8_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing8.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="9">
                        <c:choose>
                            <c:when test="${ing9.name != null}">
                                <c:out value="${ing9.name}" />
                            </c:when>
                            <c:otherwise>
                                材料9を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing9.name != null}">
                        <input type="number" min="0" max="500" name="ing9_vol" value="${ing9_vol}" />
                        <select name="ing9_type">
                            <option value="ml"<c:if test="${ing9_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing9_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing9_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing9.type == '副材料'}">
                                <option value="個"<c:if test="${ing9_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing9_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing9.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/ingredient_edit' />" name="ing_number" value="10">
                        <c:choose>
                            <c:when test="${ing10.name != null}">
                                <c:out value="${ing10.name}" />
                            </c:when>
                            <c:otherwise>
                                材料10を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${ing10.name != null}">
                        <input type="number" min="0" max="500" name="ing10_vol" value="${ing10_vol}" />
                        <select name="ing10_type">
                            <option value="ml"<c:if test="${ing10_type == 'ml'}">selected</c:if>>ml</option>
                            <option value="tsp"<c:if test="${ing10_type == 'tsp'}">selected</c:if>>tsp</option>
                            <option value="dash"<c:if test="${ing10_type == 'dash'}">selected</c:if>>dash</option>
                            <c:if test="${ing10.type == '副材料'}">
                                <option value="個"<c:if test="${ing10_type == '個'}">selected</c:if>>個</option>
                                <option value="適量"<c:if test="${ing10_type == '適量'}">selected</c:if>>適量</option>
                            </c:if>
                        </select>
                    </c:if>
                    <br>
                </c:if>
                <c:if test="${ing3.name != null}">
                    <button type="submit" form="edit" formaction="<c:url value='/recipes/edit' />" name="remove_flag" value="1">材料を1つ取消</button>
                </c:if>
            </div>
            <div class="introduction">
                <h2 class="introduction">作り方・紹介コメント</h2>
                <textarea name="introduction" rows="10" cols="50">${recipe.introduction}</textarea>
            </div>
            <div class="date_user">
                登録日：<fmt:formatDate value="${recipe.created_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                更新日：<fmt:formatDate value="${recipe.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                投稿者：<c:out value="${recipe.createUser.name}" />
            </div>
            <input type="hidden" name="_token" value="${_token}" />
        </form>

        <a href="<c:url value='/recipes/show?id=${recipe_id}' />">レシピ詳細に戻る</a>
        <a href="#" onclick="confirmDestroy();">このレシピを削除</a>
        <form method="POST" action="<c:url value='/recipes/destroy' />">
            <input type="hidden" name="_token" value="${_token}" />
        </form>
        <script>
            function confirmDestroy() {
                if(confirm("本当に削除してよろしいですか？")) {
                    document.forms[1].submit();
                }
            }
        </script>
        <button type="submit" form="edit" formaction="<c:url value='/recipes/update' />">このレシピを更新</button>


    </c:param>
</c:import>

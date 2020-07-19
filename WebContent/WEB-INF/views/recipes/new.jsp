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

        <form method="POST" action="?">
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
                                <option value="透明"<c:if test="${recipe.type == '透明'}">selected</c:if>>透明</option>
                                <option value="ブラウン"<c:if test="${recipe.type == 'ブラウン'}">selected</c:if>>ブラウン</option>
                                <option value="オレンジ"<c:if test="${recipe.type == 'オレンジ'}">selected</c:if>>オレンジ</option>
                                <option value="ピンク"<c:if test="${recipe.type == 'ピンク'}">selected</c:if>>ピンク</option>
                                <option value="赤"<c:if test="${recipe.type == '赤'}">selected</c:if>>赤</option>
                                <option value="黄"<c:if test="${recipe.type == '黄'}">selected</c:if>>黄</option>
                                <option value="白"<c:if test="${recipe.type == '白'}">selected</c:if>>白</option>
                                <option value="緑"<c:if test="${recipe.type == '緑'}">selected</c:if>>緑</option>
                                <option value="青"<c:if test="${recipe.type == '青'}">selected</c:if>>青</option>
                                <option value="紫"<c:if test="${recipe.type == '紫'}">selected</c:if>>紫</option>
                                <option value="黒"<c:if test="${recipe.type == '黒'}">selected</c:if>>黒</option>
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
                <button type="submit" formaction="<c:url value='/recipes/ingredient' />">
                    <c:choose>
                        <c:when test="${ing1 != null}">
                            <c:out value="${ing1.name}" />
                        </c:when>
                        <c:otherwise>
                            材料1を選択
                        </c:otherwise>
                    </c:choose>
                </button>
                <input type="hidden" name="ing1" value="${ing1}" />
                <input type="number" min="0" max="500" name="ing1_vol" value="${ing1_vol}" /> ml
                <br>
                <button type="submit" formaction="<c:url value='/recipes/ingredient' />">
                    <c:choose>
                        <c:when test="${ing2 != null}">
                            <c:out value="${ing2.name}" />
                        </c:when>
                        <c:otherwise>
                            材料2を選択
                        </c:otherwise>
                    </c:choose>
                </button>
                <c:if test="${ing1 != null && ing2 != null}">
                    <button type="submit" formaction="<c:url value='/recipes/ingredient' />">
                        <c:choose>
                            <c:when test="${ing3 != null}">
                                <c:out value="${ing3.name}" />
                            </c:when>
                            <c:otherwise>
                                材料3を選択
                            </c:otherwise>
                        </c:choose>
                    </button>
                </c:if>
                <input type="hidden" name="ing3" value="${ing3}" />
                <input type="number" min="0" max="500" name="ing3_vol" value="${ing3_vol}" /> ml
                <br>
            </div>
            <div class="introduction">
                <h2 class="introduction">作り方・紹介コメント</h2>
                <textarea name="introduction" rows="10" cols="50">${recipe.introduction}</textarea>
            </div>
            <input type="hidden" name="_token" value="${_token}" />
            <a href="<c:url value='/' />">キャンセル</a>
            <button type="submit" formaction="<c:url value='/recipes/create' />">このレシピを投稿</button>
        </form>

    </c:param>
</c:import>

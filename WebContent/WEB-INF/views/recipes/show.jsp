<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${recipe != null}">
                <img class="icon" src="/cocktail_recipe/images/myrecipe_w.png" alt="マイレシピアイコン" />
                <h1>レシピ詳細</h1>
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
                                約 <c:out value="${recipe_abv}" /> ％
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="ingredient">
                    <h2 class="ingredient">材料</h2>
                    <c:forEach var="ingredient" items="${ingredients}" varStatus="status">
                        <c:out value="${ingredient.useIngredient.name}" />
                        <c:out value="${ingredient.vol}" /> ml
                        <br>
                    </c:forEach>
                </div>
                <div class="introduction">
                    <h2 class="introduction">作り方・紹介コメント</h2>
                    <c:out value="${recipe.introduction}" />
                </div>
                <div class="date_user">
                    登録日：<fmt:formatDate value="${recipe.created_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                    更新日：<fmt:formatDate value="${recipe.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />&nbsp;
                    投稿者：<c:out value="${recipe.createUser.name}" />
                </div>
                <a href="<c:url value='/recipes/index' />">レシピ検索に戻る</a>
                <a href="<c:url value='/recipes/edit?id=${recipe.id}' />">このレシピを編集</a>
                <form method="POST" action="<c:url value='/recipes/make' />">
                    <input type="hidden" name="_token" value="${_token}">
                    <input type="hidden" name="recipe_id" value="${recipe.id}">
                    <button type="submit">このレシピを作成する</button>
                </form>
            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/recipes/index' />">レシピ検索に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
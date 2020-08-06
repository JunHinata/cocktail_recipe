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
                        <button class="orange_button" type="submit" form="consume">このレシピで作成</button>
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

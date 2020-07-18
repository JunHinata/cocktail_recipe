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
        <h1>レシピ検索</h1><br>
        <div class="pagination">
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
            <div>
                <div class="recipe_list1">
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
                            <c:forEach var="recipe_ingredient" items="${recipe_ingredients}" varStatus="status">
                                <tr>
                                    <th><c:out value="${recipe_ingredient.name}" /></th>
                                    <td><c:out value="${recipe_ingredient.vol}" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="<c:url value='/recipes/show?id=${recipe.id}' />">詳細を見る</a>
                </div>
            </div>
        </c:forEach>
        <div class="pagination">
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

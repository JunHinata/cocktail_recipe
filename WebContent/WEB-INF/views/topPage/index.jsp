<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}" />
            </div>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン">
        <h1>マイシェルフ</h1><br>
        <img class="icon" src="/cocktail_recipe/images/recipe_w.png" alt="レシピアイコン">
        <h1>おすすめレシピ</h1><br>
    </c:param>
</c:import>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}" />
            </div>
        </c:if>
        <c:if test="${login_user.admin_flag == 1}">
            管理者メニュー&nbsp;
            <a href="<c:url value='/users/index' />">＞ユーザー一覧へ</a>&nbsp;
            <a href="<c:url value='/ingredients/index' />">＞材料一覧へ</a>
            <br>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン">
        <h1>マイシェルフ</h1>&nbsp;
        <a href="<c:url value='/stocks/index' />">＞在庫管理へ</a>
        <br>
        <img class="icon" src="/cocktail_recipe/images/recipe_w.png" alt="レシピアイコン">
        <h1>おすすめレシピ</h1>&nbsp;
        <a href="<c:url value='/recipes/index' />">＞レシピ検索へ</a>
        <br>
    </c:param>
</c:import>

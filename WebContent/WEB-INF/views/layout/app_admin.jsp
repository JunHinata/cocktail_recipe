<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>カクテリア</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body id="admin">
        <div id="header">
            <div id="header_menu">
                <a href="<c:url value='/' />"><img id="logo" src="/cocktail_recipe/images/Cockteria.png" alt="Cockteriaのロゴ"></a>
                <c:if test="${sessionScope.login_user != null}">
                    <a href="<c:url value='/stocks/index' />"><img class="menu_icon" src="/cocktail_recipe/images/shelf_o.png" alt="在庫管理アイコン">在庫管理　</a>&nbsp;
                    <a href="<c:url value='/recipes/index' />"><img class="menu_icon" src="/cocktail_recipe/images/recipe_o.png" alt="レシピ検索アイコン">レシピ検索</a>&nbsp;
                    <a href="<c:url value='/recipes/new' />"><img class="menu_icon" src="/cocktail_recipe/images/myrecipe_o.png" alt="レシピ投稿アイコン">レシピ投稿</a>&nbsp;
                </c:if>
            </div>
            <div id="user_name">
                <c:if test="${sessionScope.login_user != null}">
                    <img id="small_user_image" src="/cocktail_recipe/images/user.png" alt="ユーザーアイコン">
                    <c:out value="${sessionScope.login_user.name}" />&nbsp;
                    <a href="<c:url value='/logout' />">ログアウト</a>
                </c:if>
            </div>
        </div>
        <div id="content">
            ${param.content}
        </div>
        <div id="footer">
            ©2020 Jun Hinata
        </div>
    </body>
</html>

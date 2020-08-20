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
    <body>
        <div id="header">
            <div id="header_menu">
                <a href="<c:url value='/' />"><img id="logo" src="https://i.gyazo.com/42cc54422b2fc16c081d103912121895.png" alt="Cockteriaのロゴ"></a>
                <c:if test="${sessionScope.login_user != null}">
                    <a href="<c:url value='/stocks/index' />"><img class="menu_icon" src="https://i.gyazo.com/5153154b42c6ea7f26ffb304d938decc.png" alt="在庫管理アイコン">在庫管理　</a>&nbsp;
                    <a href="<c:url value='/recipes/index' />"><img class="menu_icon" src="https://i.gyazo.com/eda5a2c637dd30a0041b8f9da4b34142.png" alt="レシピ検索アイコン">レシピ検索</a>&nbsp;
                    <a href="<c:url value='/recipes/new' />"><img class="menu_icon" src="https://i.gyazo.com/fcc0a62695632e441d22bee5b993e57e.png" alt="レシピ投稿アイコン">レシピ投稿</a>&nbsp;
                </c:if>
            </div>
            <div id="user_name">
                <c:if test="${sessionScope.login_user != null}">
                    <img id="small_user_image" src="https://i.gyazo.com/9c8f70a433980f3f85f4bcf3895b6a3c.png" alt="ユーザーアイコン">
                    <c:out value="${sessionScope.login_user.name}" />&nbsp;
                    <a href="<c:url value='/logout' />">ログアウト</a>
               </c:if>
            </div>
        </div>
        <div id="content">
            ${param.content}
        </div>
        <div id="footer">
            ©2020　<img id="copyright" src="https://i.gyazo.com/0483502f18eaa563b5ad52f2ba83c247.png" alt="Jun Hinta">
        </div>
    </body>
</html>

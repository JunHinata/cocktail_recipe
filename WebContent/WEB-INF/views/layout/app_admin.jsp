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
        <div id="wrapper">
            <div id="header">
                <img id="logo" src="${pageContext.request.contextPath}/images/Cockteria.png" alt="Cockteriaのロゴ">
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                ©2020 Jun Hinata
            </div>
        </div>
    </body>
</html>

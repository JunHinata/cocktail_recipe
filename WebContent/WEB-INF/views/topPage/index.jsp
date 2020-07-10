<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <img id="icon" src="${pageContext.request.contextPath}/images/シェルフ2.png" alt="シェルフアイコン">
        <h1>マイシェルフ</h1><br>
        <img id="icon" src="${pageContext.request.contextPath}/images/レシピ2.png" alt="レシピアイコン">
        <h1>おすすめレシピ</h1><br>
    </c:param>
</c:import>

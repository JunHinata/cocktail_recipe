<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                メールアドレスかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}" />
            </div>
        </c:if>
        <div id="login">
            <img id="symbol" src="${pageContext.request.contextPath}/images/symbol.png" alt="Cockteriaのシンボル" /><br>

            <form method="POST" action="<c:url value='/login' />">
                <label for="email">ログインID(メールアドレス):</label>
                <input type="text" name="email" value="${email}" />
                <br><br>

                <label for="password">パスワード:</label>
                <input type="password" name="password" />
                <br><br>

                <input type="hidden" name="_token" value="${_token}" />
                <button type="submit">ログイン</button>
            </form>

            <a href="<c:url value='/login/new' />">新規ユーザー登録</a>
        </div>
    </c:param>
</c:import>
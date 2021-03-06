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
            <img id="symbol" src="https://i.gyazo.com/ffdf81a1d2cfe290f44fd37cac6ea5e4.png" alt="Cockteriaのシンボル" /><br>

            <form method="POST" action="<c:url value='/login' />">
                <input type="text" name="email" value="${email}" placeholder="ログインID（メールアドレス）" />
                <br><br>

                <input type="password" name="password" placeholder="パスワード" />
                <br><br>

                <input type="hidden" name="_token" value="${_token}" />
                <button type="submit">ログイン</button>
            </form>

            <a href="<c:url value='/login/new' />">新規ユーザー登録</a>
        </div>
    </c:param>
</c:import>

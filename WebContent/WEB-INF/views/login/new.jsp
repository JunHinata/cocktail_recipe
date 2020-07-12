<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br>
                <c:forEach var="error" items="${errors}">
                    ・<c:out value="${error}" /><br>
                </c:forEach>
            </div>
        </c:if>
        <h1>新規ユーザー登録</h1>

        <form method="POST" action="<c:url value='/login/create' />">
            <table id="show">
                <tbody>
                    <tr>
                        <th>ユーザー名</th>
                        <td class="row0">
                            <input type="text" name="name" value="${user.name}" />
                        </td>
                    </tr>
                    <tr>
                        <th>ログインID<br>（メールアドレス）</th>
                        <td class="row1">
                            <input type="text" name="email" value="${user.email}" />
                        </td>
                    </tr>
                    <tr>
                        <th>パスワード</th>
                        <td class="row0">
                            <input type="password" name="password1" />
                        </td>
                    </tr>
                    <tr>
                        <th>パスワード再入力</th>
                        <td class="row1">
                            <input type="password" name="password2" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="_token" value="${_token}" />
            <a href="<c:url value='/login' />">キャンセル</a>
            <button type="submit">登録</button>
        </form>

    </c:param>
</c:import>

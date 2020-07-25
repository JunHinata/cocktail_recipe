<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app_admin.jsp">
    <c:param name="content">
        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br>
                <c:forEach var="error" items="${errors}">
                    ・<c:out value="${error}" /><br>
                </c:forEach>
            </div>
        </c:if>
        <h1>新規ユーザー登録　管理者専用</h1>

        <form method="POST" action="<c:url value='/users/create' />">
            <table id="show">
                <tbody>
                    <tr>
                        <th>ユーザー名</th>
                        <td class="row0">
                            <input type="text" name="name" value="${user.name}" />
                        </td>
                    </tr>
                    <tr>
                        <th>メールアドレス</th>
                        <td class="row1">
                            <input type="text" name="email" value="${user.email}" />
                        </td>
                    </tr>
                    <tr>
                        <th>パスワード</th>
                        <td class="row0">
                            <input type="text" name="password" autocomplete="off" />
                        </td>
                    </tr>
                    <tr>
                        <th>権限</th>
                        <td class="row1">
                            <select name="admin_flag">
                                <option value="0"<c:if test="${user.admin_flag == 0}">selected</c:if>>一般</option>
                                <option value="1"<c:if test="${user.admin_flag == 1}">selected</c:if>>管理者</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="_token" value="${_token}" />
            <a href="<c:url value='/users/index' />">一覧に戻る</a>
            <button type="submit">ユーザーを登録</button>
        </form>

    </c:param>
</c:import>

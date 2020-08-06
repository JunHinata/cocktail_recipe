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
        <div class="window">

            <form method="POST" enctype="multipart/form-data" action="<c:url value='/login/create' />">
                <div class="wrapper">
                    <div id="image">
                       <input type="file" name="image" accept=".png, .jpg, .jpeg">
                    </div>
                    <div id="data">
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
                    </div>
                </div>
                <div class="action_button">
                    <input type="hidden" name="_token" value="${_token}" />
                    <a class="gray_button" href="<c:url value='/login' />">キャンセル</a>
                    <button class="orange_button" type="submit">登録</button>
                </div>
            </form>

        </div>
    </c:param>
</c:import>

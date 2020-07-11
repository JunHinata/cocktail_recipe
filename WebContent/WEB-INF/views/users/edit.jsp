<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app_admin.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h1>ユーザー詳細　管理者専用</h1>

                <form method="POST" action="<c:url value='/users/update' />">
                    <table id="show">
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <td class="row0">
                                    <c:out value="${user.id}" />
                                </td>
                            </tr>
                            <tr>
                                <th>ユーザー名</th>
                                <td class="row1">
                                    <input type="text" name="name" value="${user.name}" />
                                </td>
                            </tr>
                            <tr>
                                <th>メールアドレス</th>
                                <td class="row0">
                                    <input type="text" name="email" value="${user.email}" />
                                </td>
                            </tr>
                            <tr>
                                <th>パスワード</th>
                                <td class="row1">
                                    <input type="password" name="password" />
                                </td>
                            </tr>
                            <tr>
                                <th>権限</th>
                                <td class="row0">
                                    <select name="admin_flag">
                                        <option value="0"<c:if test="${user.admin_flag == 0}">selected</c:if>>一般</option>
                                        <option value="1"<c:if test="${user.admin_flag == 1}">selected</c:if>>管理者</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>削除</th>
                                <td class="row1">
                                    <select name="delete_flag">
                                        <option value="0"<c:if test="${user.delete_flag == 0}">selected</c:if>>非削除</option>
                                        <option value="1"<c:if test="${user.delete_flag == 1}">selected</c:if>>削除済み</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>登録日時</th>
                                <td class="row0">
                                    <fmt:formatDate value="${user.created_at}" pattern="yyyy/MM/dd HH:mm;ss" />
                                </td>
                            </tr>
                            <tr>
                                <th>更新日時</th>
                                <td class="row1">
                                    <fmt:formatDate value="${user.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="_token" value="${_token}" />
                    <a href="<c:url value='/users/index' />">一覧に戻る</a>
                    <button type="submit">ユーザーを更新</button>
                </form>

            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/users/index' />">一覧に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
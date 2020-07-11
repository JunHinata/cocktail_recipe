<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app_admin.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h1>ユーザー詳細　管理者専用</h1>
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
                                <c:out value="${user.name}" />
                            </td>
                        </tr>
                        <tr>
                            <th>メールアドレス</th>
                            <td class="row0">
                                <c:out value="${user.email}" />
                            </td>
                        </tr>
                        <tr>
                            <th>権限</th>
                            <td class="row1">
                                <c:choose>
                                    <c:when test="${user.admin_flag == 1}">
                                        管理者
                                    </c:when>
                                    <c:otherwise>
                                        一般
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>削除</th>
                            <td class="row0">
                                <c:choose>
                                    <c:when test="${user.delete_flag == 1}">
                                        削除済み
                                    </c:when>
                                    <c:otherwise>
                                        非削除
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td class="row1">
                                <fmt:formatDate value="${user.created_at}" pattern="yyyy/MM/dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td class="row0">
                                <fmt:formatDate value="${user.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <a href="<c:url value='/users/index' />">一覧に戻る</a>
                <a href="<c:url value='/users/edit?id=${user.id}' />">ユーザーを編集</a>
            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/users/indes' />">一覧に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
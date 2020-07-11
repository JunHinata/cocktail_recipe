<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app_admin.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h1>ユーザー一覧　管理者専用</h1><br>
        <a href="<c:url value='/users/new' />">新規ユーザー登録</a>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 30) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <table id="user_list">
            <tbody>
                <tr class="label">
                    <th class="id">ID</th>
                    <th class="name">ユーザー名</th>
                    <th class="admin">権限</th>
                    <th class="date">登録日時</th>
                    <th class="date">更新日時</th>
                    <th class="action">操作</th>
                </tr>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="id"><c:out value="${user.id}" /></td>
                        <td class="name"><c:out value="${user.name}" /></td>
                        <td class="admin">
                            <c:choose>
                                <c:when test="${user.admin_flag == 1}">
                                    管理者
                                </c:when>
                                <c:otherwise>
                                    一般
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="date"><fmt:formatDate value="${user.created_at}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                        <td class="date"><fmt:formatDate value="${user.updated_at}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                        <td class="action">
                            <c:choose>
                                <c:when test="${user.delete_flag == 1}">
                                    <a href="<c:url value='/users/show?id=${user.id}' />">削除済み</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/users/show?id=${user.id}' />">詳細を見る</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 30) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>

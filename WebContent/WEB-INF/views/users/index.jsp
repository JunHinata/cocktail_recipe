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
        <h1>ユーザー一覧　管理者専用</h1>
        <div class="window">
            <div id="search">
                <form id="search_form" method="GET" action="<c:url value='/users/index' />">
                    <select name="user_search">
                        <option value="ID降順" <c:if test="${user_search == 'ID降順'}">selected</c:if>>ID降順</option>
                        <option value="ID昇順" <c:if test="${user_search == 'ID昇順'}">selected</c:if>>ID昇順</option>
                        <option value="ユーザー名順" <c:if test="${user_search == 'ユーザー名順'}">selected</c:if>>ユーザー名順</option>
                        <option value="更新日時順" <c:if test="${user_search == '更新日時順'}">selected</c:if>>更新日時順</option>
                    </select>&nbsp;
                    <button class="small_orange_button" type="submit">並べ替え</button>&emsp;
                    <a class="small_blue_button" href="<c:url value='/users/new' />">新規ユーザー登録</a>
                </form>
            </div>
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${((users_count - 1) / 30) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <button class="page_anchor" form="search_form" type="submit" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
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
                                        <a class="deleted" href="<c:url value='/users/show?id=${user.id}' />">&ensp;削除済み&ensp;</a>
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
                            <button class="page_anchor" form="search_form" type="submit" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>

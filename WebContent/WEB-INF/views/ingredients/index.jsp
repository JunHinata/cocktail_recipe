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
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン" />
        <h1>材料一覧　管理者専用</h1><br>
        <a href="<c:url value='/ingredients/new' />">材料新規登録</a>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${((ingredients_count - 1) / 30) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/ingredients/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <table id="ingredient_list">
            <tbody>
                <tr class="label">
                    <th class="name">材料名</th>
                    <th class="type">分類</th>
                    <th class="abv">度数</th>
                    <th class="soda_flag">炭酸</th>
                    <th class="date">更新日時</th>
                    <th class="action">操作</th>
                </tr>
                <c:forEach var="ingredient" items="${ingredients}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="name"><c:out value="${ingredient.name}" /></td>
                        <td class="type"><c:out value="${ingredient.type}" /></td>
                        <td class="abv">約 <c:out value="${ingredient.abv}" /> ％</td>
                        <td class="soda_flag">
                            <c:choose>
                                <c:when test="${ingredient.soda_flag == 0}">
                                    なし
                                </c:when>
                                <c:otherwise>
                                    あり
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="date"><fmt:formatDate value="${ingredient.updated_at}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                        <td class="action"><a href="<c:url value='/ingredients/show?id=${ingredient.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${((ingredients_count - 1) / 30) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/ingredients/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>

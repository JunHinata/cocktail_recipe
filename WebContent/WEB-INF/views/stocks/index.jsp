<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン" />
        <h1>在庫管理</h1><br>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${((ingredients_count - 1) / 30) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/stocks/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <table id="stock_list">
            <tbody>
                <tr class="label">
                    <th class="name">材料名</th>
                    <th class="type">分類</th>
                    <th class="vol">容量/個数</th>
                    <th class="date">更新日</th>
                    <th class="comment">コメント</th>
                    <th class="action">操作</th>
                </tr>
                <c:forEach var="stock" items="${stocks}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="name"><c:out value="${stock.stockIngredient.name}" /></td>
                        <td class="type"><c:out value="${stock.stockIngredient.type}" /></td>
                        <td class="vol">約 <c:out value="${stock.vol}" /> ml</td>
                        <td class="date"><fmt:formatDate value="${stock.updated_at}" pattern="yyyy/MM/dd"/></td>
                        <td class="comment"><c:out value="${stock.comment}" /></td>
                        <td class="action"><a href="<c:url value='/stocks/show?id=${stock.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
                <c:forEach var="no_stock" items="${no_stocks}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="name"><c:out value="${no_stock.name}" /></td>
                        <td class="type"><c:out value="${no_stock.type}" /></td>
                        <td class="vol">在庫なし</td>
                        <td class="date"></td>
                        <td class="comment"></td>
                        <td class="action"><a href="<c:url value='/stocks/new?id=${no_stock.id}' />">在庫を登録</a></td>
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
                        <a href="<c:url value='/stocks/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>

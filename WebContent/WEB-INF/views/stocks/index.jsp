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
        <img class="icon" src="https://i.gyazo.com/35990234ef6818e036880daab876f135.png" alt="シェルフアイコン" />
        <h1>在庫管理</h1>
        <div class="window">
            <div id="search">
                <form id="search_form" method="GET" action="<c:url value='/stocks/index' />">
                    <select name="stock_search">
                        <option value="">在庫有無</option>
                        <option value="在庫あり" <c:if test="${stock_search == '在庫あり'}">selected</c:if>>在庫あり</option>
                        <option value="在庫なし" <c:if test="${stock_search == '在庫なし'}">selected</c:if>>在庫なし</option>
                    </select>&nbsp;
                    <select name="type_search">
                        <option value="">材料分類</option>
                        <option value="スピリッツ" <c:if test="${type_search == 'スピリッツ'}">selected</c:if>>スピリッツ</option>
                        <option value="リキュール" <c:if test="${type_search == 'リキュール'}">selected</c:if>>リキュール</option>
                        <option value="その他酒" <c:if test="${type_search == 'その他酒'}">selected</c:if>>その他酒</option>
                        <option value="副材料" <c:if test="${type_search == '副材料'}">selected</c:if>>副材料</option>
                    </select>&nbsp;
                    <input type="text" name="name_search" value="${name_search}" placeholder="材料名検索" />&nbsp;
                    <button class="small_orange_button" type="submit">絞込・検索</button>
                </form>
            </div>
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${((ingredients_count - 1) / 30) + 1}" step="1">
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
            <table id="stock_list">
                <tbody>
                    <tr class="label">
                        <th class="name">材料名</th>
                        <th class="type">分類</th>
                        <th class="vol">容量/有無</th>
                        <th class="date">更新日</th>
                        <th class="comment">コメント</th>
                        <th class="action">操作</th>
                    </tr>
                    <c:forEach var="stock" items="${stocks}" varStatus="status">
                        <tr class="row${status.count % 2}">
                            <td class="name"><c:out value="${stock.stockIngredient.name}" /></td>
                            <td class="type"><c:out value="${stock.stockIngredient.type}" /></td>
                            <td class="vol">
                                <c:choose>
                                    <c:when test="${stock.stockIngredient.type != '副材料'}">
                                        約 <c:out value="${stock.vol}" /> ml
                                    </c:when>
                                    <c:otherwise>
                                        在庫あり
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="date"><fmt:formatDate value="${stock.updated_at}" pattern="yyyy/MM/dd"/></td>
                            <td class="comment"><c:out value="${stock.comment}" /></td>
                            <td class="action"><a href="<c:url value='/stocks/show?id=${stock.id}' />">詳細を見る</a></td>
                        </tr>
                    </c:forEach>
                    <c:forEach var="no_stock" items="${no_stocks}" varStatus="status">
                        <tr class="gray_row${status.count % 2}">
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
                            <button class="page_anchor" form="search_form" type="submit" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>

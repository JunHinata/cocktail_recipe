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
        <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン" />
        <h1>在庫登録</h1>

        <form method="POST" action="<c:url value='/stocks/create' />">
            <table id="show">
                <tbody>
                    <tr>
                        <th>材料名</th>
                        <td class="row0">
                            <c:out value="${ingredient.name}" />
                        </td>
                    </tr>
                    <tr>
                        <th>分類</th>
                        <td class="row1">
                            <c:out value="${ingredient.type}" />
                        </td>
                    </tr>
                    <tr>
                        <th>アルコール度数</th>
                        <td class="row0">
                            約 <c:out value="${ingredient.abv}" /> ％
                        </td>
                    </tr>
                    <tr>
                        <th>炭酸</th>
                        <td class="row1">
                            <c:choose>
                                    <c:when test="${ingredient.soda_flag == 1}">
                                        あり
                                    </c:when>
                                    <c:otherwise>
                                        なし
                                    </c:otherwise>
                                </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>在庫容量/個数</th>
                        <td class="row0">
                            数量自由入力： <input type="number" min="1" name="vol" value="${stock.vol}" /> ml
                        </td>
                    </tr>
                    <tr>
                        <th>コメント</th>
                        <td class="row1">
                            任意入力：<br>
                            <textarea name="comment" rows="10" cols="50">${stock.comment}</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="_token" value="${_token}" />
            <a href="<c:url value='/stocks/index' />">在庫管理に戻る</a>
            <button type="submit">この在庫を登録</button>
        </form>

    </c:param>
</c:import>

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
        <img class="icon" src="/cocktail_recipe/images/myrecipe_w.png" alt="マイレシピアイコン" />
        <h1>マイレシピ材料選択</h1>
        <div class="window">
            <div id="search">
                <form id="search_form" method="POST" action="<c:url value='/recipes/ingredient_edit' />">
                    <select name="type_search">
                        <option value="">材料分類</option>
                        <option value="スピリッツ" <c:if test="${type_search == 'スピリッツ'}">selected</c:if>>スピリッツ</option>
                        <option value="リキュール" <c:if test="${type_search == 'リキュール'}">selected</c:if>>リキュール</option>
                        <option value="その他酒" <c:if test="${type_search == 'その他酒'}">selected</c:if>>その他酒</option>
                        <option value="副材料" <c:if test="${type_search == '副材料'}">selected</c:if>>副材料</option>
                    </select>&nbsp;
                    <input type="text" name="name_search" value="${name_search}" placeholder="材料名検索" />&nbsp;
                    <input type="hidden" name="_token" value="${_token}" />
                    <input type="hidden" name="ing_number" value="${ing_number}" />
                    <input type="hidden" name="ing1_vol" value="${ing1_vol}" />
                    <input type="hidden" name="ing2_vol" value="${ing2_vol}" />
                    <input type="hidden" name="ing3_vol" value="${ing3_vol}" />
                    <input type="hidden" name="ing4_vol" value="${ing4_vol}" />
                    <input type="hidden" name="ing5_vol" value="${ing5_vol}" />
                    <input type="hidden" name="ing6_vol" value="${ing6_vol}" />
                    <input type="hidden" name="ing7_vol" value="${ing7_vol}" />
                    <input type="hidden" name="ing8_vol" value="${ing8_vol}" />
                    <input type="hidden" name="ing9_vol" value="${ing9_vol}" />
                    <input type="hidden" name="ing10_vol" value="${ing10_vol}" />
                    <input type="hidden" name="ing1_type" value="${ing1_type}" />
                    <input type="hidden" name="ing2_type" value="${ing2_type}" />
                    <input type="hidden" name="ing3_type" value="${ing3_type}" />
                    <input type="hidden" name="ing4_type" value="${ing4_type}" />
                    <input type="hidden" name="ing5_type" value="${ing5_type}" />
                    <input type="hidden" name="ing6_type" value="${ing6_type}" />
                    <input type="hidden" name="ing7_type" value="${ing7_type}" />
                    <input type="hidden" name="ing8_type" value="${ing8_type}" />
                    <input type="hidden" name="ing9_type" value="${ing9_type}" />
                    <input type="hidden" name="ing10_type" value="${ing10_type}" />
                    <input type="hidden" name="name" value="${recipe.name}" />
                    <input type="hidden" name="type" value="${recipe.type}" />
                    <input type="hidden" name="color" value="${recipe.color}" />
                    <input type="hidden" name="taste" value="${recipe.taste}" />
                    <input type="hidden" name="glass" value="${recipe.glass}" />
                    <input type="hidden" name="technique" value="${recipe.technique}" />
                    <input type="hidden" name="introduction" value="${recipe.introduction}" />
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
                            <button class="page_anchor" type="submit" form="search_form" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <form method="POST" action="<c:url value='/recipes/edit' />">
                <table id="ingredient_list">
                    <tbody>
                        <tr class="label">
                            <th class="name">材料名</th>
                            <th class="type">分類</th>
                            <th class="abv">度数</th>
                            <th class="soda_flag">炭酸</th>
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
                                <td class="action">
                                    <button type="submit" name="chose_ing" value="${ingredient.id}">選択</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" name="_token" value="${_token}" />
                <input type="hidden" name="ing_number" value="${ing_number}" />
                <input type="hidden" name="ing1_vol" value="${ing1_vol}" />
                <input type="hidden" name="ing2_vol" value="${ing2_vol}" />
                <input type="hidden" name="ing3_vol" value="${ing3_vol}" />
                <input type="hidden" name="ing4_vol" value="${ing4_vol}" />
                <input type="hidden" name="ing5_vol" value="${ing5_vol}" />
                <input type="hidden" name="ing6_vol" value="${ing6_vol}" />
                <input type="hidden" name="ing7_vol" value="${ing7_vol}" />
                <input type="hidden" name="ing8_vol" value="${ing8_vol}" />
                <input type="hidden" name="ing9_vol" value="${ing9_vol}" />
                <input type="hidden" name="ing10_vol" value="${ing10_vol}" />
                <input type="hidden" name="ing1_type" value="${ing1_type}" />
                <input type="hidden" name="ing2_type" value="${ing2_type}" />
                <input type="hidden" name="ing3_type" value="${ing3_type}" />
                <input type="hidden" name="ing4_type" value="${ing4_type}" />
                <input type="hidden" name="ing5_type" value="${ing5_type}" />
                <input type="hidden" name="ing6_type" value="${ing6_type}" />
                <input type="hidden" name="ing7_type" value="${ing7_type}" />
                <input type="hidden" name="ing8_type" value="${ing8_type}" />
                <input type="hidden" name="ing9_type" value="${ing9_type}" />
                <input type="hidden" name="ing10_type" value="${ing10_type}" />
            </form>

            <div class="pagination">
                <c:forEach var="i" begin="1" end="${((ingredients_count - 1) / 30) + 1}" step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <button class="page_anchor" type="submit" form="search_form" name="page" value="${i}"><c:out value="${i}" /></button>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app_admin.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${ingredient != null}">
            <img class="icon" src="https://i.gyazo.com/35990234ef6818e036880daab876f135.png" alt="シェルフアイコン" />
                <h1>材料詳細　管理者専用</h1>
                <div class="window">
                    <div class="wrapper">
                        <div id="image">
                            <c:if test="${ingredient.type == 'スピリッツ'}">
                                <img id="ing_image" src="https://i.gyazo.com/838632ff50d7006d800410e52b0f9d65.png" alt="材料アイコン">
                            </c:if>
                            <c:if test="${ingredient.type == 'リキュール'}">
                                <img id="ing_image" src="https://i.gyazo.com/994e42d95f430afabddba0bdffc81d58.png" alt="材料アイコン">
                            </c:if>
                            <c:if test="${ingredient.type == 'その他酒'}">
                                <img id="ing_image" src="https://i.gyazo.com/7a10ea4506d419085f157fdb4af9d70d.png" alt="材料アイコン">
                            </c:if>
                            <c:if test="${ingredient.type == '副材料'}">
                                <img id="ing_image" src="https://i.gyazo.com/a8e9ed23b27b0995ad7d1b6e525793a5.png" alt="材料アイコン">
                            </c:if>
                        </div>
                        <div id="data">
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
                                        <th>登録日時</th>
                                        <td class="row0">
                                            <fmt:formatDate value="${ingredient.created_at}" pattern="yyyy/MM/dd HH:mm:ss" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>更新日時</th>
                                        <td class="row1">
                                            <fmt:formatDate value="${ingredient.updated_at}" pattern="yyyy/MM/dd HH:mm:ss" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="action_button">
                        <a class="gray_button" href="<c:url value='/ingredients/index' />">一覧に戻る</a>
                        <a class="blue_button" href="<c:url value='/ingredients/edit?id=${ingredient.id}' />">この材料を編集</a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/ingredients/index' />">一覧に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>

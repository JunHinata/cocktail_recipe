<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app_admin.jsp">
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
        <h1>材料新規登録　管理者専用</h1>
        <div class="window">

            <form method="POST" action="<c:url value='/ingredients/create' />">
                <div class="wrapper">
                    <div id="image">
                        <c:if test="${ingredient.type == 'スピリッツ'}">
                            <img id="ing_image" src="/cocktail_recipe/images/spirits.png" alt="材料アイコン">
                        </c:if>
                        <c:if test="${ingredient.type == 'リキュール'}">
                            <img id="ing_image" src="/cocktail_recipe/images/liqueur.png" alt="材料アイコン">
                        </c:if>
                        <c:if test="${ingredient.type == 'その他酒'}">
                            <img id="ing_image" src="/cocktail_recipe/images/other.png" alt="材料アイコン">
                        </c:if>
                        <c:if test="${ingredient.type == '副材料'}">
                            <img id="ing_image" src="/cocktail_recipe/images/sub.png" alt="材料アイコン">
                        </c:if>
                    </div>
                    <div id="data">
                        <table id="show">
                            <tbody>
                                <tr>
                                    <th>材料名</th>
                                    <td class="row0">
                                        <input type="text" name="name" value="${ingredient.name}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>分類</th>
                                    <td class="row1">
                                        <select name="type">
                                            <option value="スピリッツ"<c:if test="${ingredient.type == 'スピリッツ'}">selected</c:if>>スピリッツ</option>
                                            <option value="リキュール"<c:if test="${ingredient.type == 'リキュール'}">selected</c:if>>リキュール</option>
                                            <option value="その他酒"<c:if test="${ingredient.type == 'その他酒'}">selected</c:if>>その他酒</option>
                                            <option value="副材料"<c:if test="${ingredient.type == '副材料'}">selected</c:if>>副材料</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>アルコール度数</th>
                                    <td class="row0">
                                        約 <input type="number" min="0" max="100" name="abv" value="${ingredient.abv}" /> ％
                                    </td>
                                </tr>
                                <tr>
                                    <th>炭酸</th>
                                    <td class="row1">
                                        <select name="soda_flag">
                                            <option value="0"<c:if test="${ingredient.soda_flag == 0}">selected</c:if>>なし</option>
                                            <option value="1"<c:if test="${ingredient.soda_flag == 1}">selected</c:if>>あり</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="action_button">
                    <input type="hidden" name="_token" value="${_token}" />
                    <a class="gray_button" href="<c:url value='/ingredients/index' />">一覧に戻る</a>
                    <button class="blue_button" type="submit">この材料を登録</button>
                </div>
            </form>

        </div>
    </c:param>
</c:import>

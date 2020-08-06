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
        <div class="window">

            <form method="POST" action="<c:url value='/stocks/create' />">
                <div class="wrapper">
                    <div id="image">
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
                                    <th>在庫容量/有無</th>
                                    <td class="row0">
                                        <c:choose>
                                            <c:when test="${ingredient.type != '副材料'}">
                                                <div class="wrapper">
                                                    <div id="form_type">
                                                        <input type="radio" name="form_type" value="free" onclick="formSwitch()" checked /> 数量自由入力：
                                                        <br>
                                                        <input type="radio" name="form_type" value="option" onclick="formSwitch()" /> 数量選択入力：
                                                        <br>
                                                    </div>
                                                    <div id="form">
                                                        <div id="free_form">
                                                            <input type="number" min="1" name="vol_f" value="${stock.vol}" /> ml
                                                            <br>
                                                        </div>
                                                        <div id="option_form">
                                                            <br>
                                                            <input type="radio" name="vol_o" value="200" /> 200 ml&emsp;
                                                            <input type="radio" name="vol_o" value="350" /> 350 ml&emsp;
                                                            <input type="radio" name="vol_o" value="375" /> 375 ml
                                                            <br>
                                                            <input type="radio" name="vol_o" value="500" /> 500 ml&emsp;
                                                            <input type="radio" name="vol_o" value="700" /> 700 ml&emsp;
                                                            <input type="radio" name="vol_o" value="720" /> 720 ml
                                                            <br>
                                                            <input type="radio" name="vol_o" value="750" /> 750 ml&emsp;
                                                            <input type="radio" name="vol_o" value="1000" /> 1000 ml&ensp;
                                                            <input type="radio" name="vol_o" value="1800" /> 1800 ml
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>
                                                    //初期表示では選択入力は非表示
                                                    document.getElementById("option_form").style.display = "none";

                                                    function formSwitch() {
                                                        radio = document.getElementsByName("form_type");
                                                        if(radio[0].checked) {
                                                            //自由入力が選択された場合
                                                            document.getElementById("free_form").style.display = "";
                                                            document.getElementById("option_form").style.display = "none";
                                                            var inputItem = document.getElementById("option_form").getElementsByTagName("input");
                                                            for(var i = 0; i < inputItem.length; i++) {
                                                                inputItem[i].checked = "";
                                                            }
                                                        }
                                                        else if(radio[1].checked) {
                                                            //選択入力が選択された場合
                                                            document.getElementById("free_form").style.display = "none";
                                                            var inputItem = document.getElementById("free_form").getElementsByTagName("input");
                                                            for(var i = 0; i < inputItem.length; i++) {
                                                                inputItem[i].value = "";
                                                            }
                                                            document.getElementById("option_form").style.display = "";
                                                        }
                                                    }
                                                </script>
                                            </c:when>
                                            <c:otherwise>
                                                在庫あり<input type="hidden" name="vol" value="1" />
                                            </c:otherwise>
                                        </c:choose>
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
                    </div>
                </div>
                <div class="action_button">
                    <input type="hidden" name="_token" value="${_token}" />
                    <input type="hidden" name="ingredient_id" value="${ingredient.id}" />
                    <a class="gray_button" href="<c:url value='/stocks/index' />">在庫管理に戻る</a>
                    <button class="orange_button" type="submit">この在庫を登録</button>
                </div>
            </form>

        </div>
    </c:param>
</c:import>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${stock != null}">
            <img class="icon" src="/cocktail_recipe/images/shelf_w.png" alt="シェルフアイコン" />
                <h1>在庫編集</h1>

                <form id="edit" method="POST" action="<c:url value='/stocks/update' />">
                    <table id="show">
                        <tbody>
                            <tr>
                                <th>材料名</th>
                                <td class="row0">
                                    <c:out value="${stock.stockIngredient.name}" />
                                </td>
                            </tr>
                            <tr>
                                <th>分類</th>
                                <td class="row1">
                                    <c:out value="${stock.stockIngredient.type}" />
                                </td>
                            </tr>
                            <tr>
                                <th>アルコール度数</th>
                                <td class="row0">
                                    約 <c:out value="${stock.stockIngredient.abv}" /> ％
                                </td>
                            </tr>
                            <tr>
                                <th>炭酸</th>
                                <td class="row1">
                                    <c:choose>
                                            <c:when test="${stock.stockIngredient.soda_flag == 1}">
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
                                        <c:when test="${stock.stockIngredient.type != '副材料'}">
                                            <span id="form_type">
                                                <input type="radio" name="form_type" value="free" onclick="formSwitch()" checked /> 数量自由入力：
                                                <br>
                                                <input type="radio" name="form_type" value="option" onclick="formSwitch()" /> 数量選択入力：
                                                <br>
                                            </span>
                                            <span id="free_form">
                                                <input type="number" min="1" name="vol_f" value="${stock.vol}" /> ml
                                                <br>
                                            </span>
                                            <span id="option_form">
                                                <input type="radio" name="vol_o" value="200" />  200 ml
                                                <input type="radio" name="vol_o" value="350" />  350 ml
                                                <input type="radio" name="vol_o" value="375" />  375 ml
                                                <br>
                                                <input type="radio" name="vol_o" value="500" />  500 ml
                                                <input type="radio" name="vol_o" value="700" />  700 ml
                                                <input type="radio" name="vol_o" value="720" />  720 ml
                                                <br>
                                                <input type="radio" name="vol_o" value="750" />  750 ml
                                                <input type="radio" name="vol_o" value="1000" /> 1000 ml
                                                <input type="radio" name="vol_o" value="1800" /> 1800 ml
                                            </span>
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
                    <input type="hidden" name="_token" value="${_token}" />
                </form>

                <a href="<c:url value='/stocks/index' />">在庫管理に戻る</a>
                <a href="#" onclick="confirmDestroy();">この在庫を破棄</a>
                <form method="POST" action="<c:url value='/stocks/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("本当に破棄してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
                <button type="submit" form="edit">この在庫を更新</button>

            </c:when>
            <c:otherwise>
                <h1>お探しのデータは見つかりませんでした。</h1>
                <a href="<c:url value='/stocks/index' />">在庫管理に戻る</a>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>

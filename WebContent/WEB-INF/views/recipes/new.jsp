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
        <img class="icon" src="https://i.gyazo.com/ad1e9f436fb68e5d46b1d49dec4d9361.png" alt="マイレシピアイコン" />
        <h1>マイレシピ投稿</h1>
        <div class="window">

            <form id="new" method="POST" action="?">
                <div class="wrapper">
                    <div id="image">
                        <c:if test="${recipe.glass == 'ロックグラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/158ee4e383771c2869e9b31acb4af450.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/6f18170b0864441395390214cb0fb98d.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/d1d4f0579acd59a57915cdaeab856804.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/884865b8d5c6a65a8bf94dde1041d450.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/33c1b3d5ef15d73f0c07884b4363978d.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/098edc5ff0d55f2a23a614ae7a988e61.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/70505cebb491e3d6c00eced13b357936.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/9efa4b20c8f4e4528bdfce8852235f5d.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/76b1162355f8ff7aa9c16756c2682cc1.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/1cd7df09a735501ecfb2f611dc4116cb.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/fec28ae6cba4e441c59dd654033e0084.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'タンブラー'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/136d9a6feb3969d3dac04d0afd725a9e.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/db02f4523fd59f2f55bd1b25e567ab1f.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/565d866d13fa427c6d7190aacfe14a33.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/94094025f0cb076535c0e87a4da95755.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/a2709b63fade59e63c5e269445793096.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/26252e84a8e5fb25584791b0cefd8e57.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/3ab4c387e1b87be8811ca10b7be91c40.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/88722e0cf8a7cfbf89637c0b0b331624.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/ba1033016c5228eb15ba3fe6bf9422c6.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/008e7adc7ad1114b7637b2034a725fc1.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/eb4a5c09eed852484823b8301f43d3a6.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'カクテルグラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/010858a25c8f467da2fb60b6ab0f22ed.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/10579801b54fd6c97cbe403576d60e32.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/f819bb48544d62f4f57ea0b15a581229.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/8cf57a8eba3ccb3d37ac44140727c959.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/b04bbbff46d32fcae09769e7f14f41b5.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/cebd6f1dc69e2a435ca7b51e283dffdf.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/73709937c3afc553511cab1e87c2faf6.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/b76e2ee29fad7fa77e153e53f5c71b2a.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/3b216f5ee73c75c61add3e67ff0e8f2e.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/0540482c104f5d464c1a7c8a56a748d0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ba6ada23b8660e8b6608044935acb58f.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'リキュールグラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/a7b1b6e2c5ab636506730acf982b7009.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/e3641eab610f88454d584edfab06501a.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/4eb0356796c46b6ae8cd5a0079a40812.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/61829771d143755e7735559538b75d45.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/33c8a5638e211617cc23e467e2936c76.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/7a587aa4006694c783b10a3c97c85231.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/3a17826b7284466db172f8bfbedc0394.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/e0f54077a4cdaef434785e16fc64b7b8.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/94c97db284e947dba4b97ea0da7bfa83.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/d34b0fafa2d67848f0d6ca151aee285b.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/4409c33dc1fdd03185efb879726139cb.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'ワイングラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/ee81def45a30bf86c61cdf1cd6895973.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/de58e43f23579aafee60690fd564e5de.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/f426945b5393ed66c8ee5ff348f87685.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/80b5746973c7b2e7c720362e9dfe5570.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/6cf0739e90cddca19b95928b4564a480.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/ebe822abec23d44c9cf991325f7f03e3.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/15e0ae2d40f2e9ee81fd81da6d5dc285.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/c90174d3df815fe57d5479fed4c273f0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/0745f18e0f8b4cc013f870b07be71e4b.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/3b8587362e7c89f991ad574d56b0911e.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ce66766dd89668224e0e4f038dd11c77.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'シャンパングラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5572418ed5657519b55c192e7e419cdd.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/29ab7b2d3b1c751c93d654f9ff0a96ac.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/450708a99154f07903bdac42cc7011d2.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/08c37ddd7e1f800a37839b4be53760d5.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/85fad482b39d0f11b6ae731740da059a.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/b57a69755777d66a2827160bd1fb395e.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/28d830b8b1a2e3e42353bff682ee27ec.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/7a418d1eb4ced8f0754fe61196d29464.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/6946b4523242837e6628ee69abb683ec.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/9919e3d8f743c4feae2c53a6fdaed6e7.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/bf7a71edcebec1e66be496cbc8535785.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'サワーグラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5b40e18ded8794dc2f250ce29048bb22.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/94aeaf9d918e4b174df6888b5fa35a01.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/1b6c0517855a3657ff3ac1119c8fb1e7.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/1b20eb5f3ddbaeff99b7049455d703de.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/0f0dff7d813522027abe521689c98191.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/6bdc2d42d3ee9f530daded1c43a50196.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/e4274dd3555bea7024de5bd4a8b7fc38.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/ebd19c0c96afc0e7a89dc4c26924eafc.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/580daac8aaee35c54425df109f5c96eb.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/f1f2b47ad36b411a8f0de7b3b494fdad.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/7553111923074ad11e81ffa993f49fa2.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'ゴブレット'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/5778fea1a7feaf2e216edc50dec27dc1.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/66e69bedbd9cdf66c469d4c0dd54a2e7.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/3e3876026933f022596882138c2a4815.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/628853fb87b9167a456f915ad2dad791.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/096e5a67a42877183f9fb87e972b55c8.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/8e32d0240a97d0a3e86f610e32d7e0fe.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/80fe9445f00c72175266c2e2eeecd4a1.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/8279bb5f482671cd622b03dccf9eb662.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/89b7fcf29e7af5b27dbe2869983df808.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/d9476aeeb7c64ba0daa40194c2487c4b.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/21121fec5b080401fa7babab1087ab35.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'ショットグラス'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/377d806a0e404849ae387c7e13e5b3f0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/6bdeeb3e2e2e13c144106557e4c5a350.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/570963717b25e9e3ae0371080976655a.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/feeb213426984bf4d0267af3b6f311e0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/9279c6d717c72fb1a98293b3b3893206.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/2bf3b1e756f1d7182b2eea61920b0198.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/f9e290203d08e431ab7fe85571722495.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/8c254f9736f144e0eba4dda0d17b8e68.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/5a312aa97720d9007bffe6bdcb751a1a.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/9e19a4b74a9bac1badfdd2171190cb52.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/ab560919e76bcbe16ab1b99cda9c165d.png" alt="レシピアイコン"></c:if>
                        </c:if>
                        <c:if test="${recipe.glass == 'その他'}">
                            <c:if test="${recipe.color == '透明'}"><img id="small_recipe_image" src="https://i.gyazo.com/9080d2ab523442bff6173ac42869c1e0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ブラウン'}"><img id="small_recipe_image" src="https://i.gyazo.com/845ff4691c5f458179cf418444926794.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'オレンジ'}"><img id="small_recipe_image" src="https://i.gyazo.com/73e9564a0b3ea4cd9735b8a6021a513f.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == 'ピンク'}"><img id="small_recipe_image" src="https://i.gyazo.com/8e8b191866df2db7db48f39d60c8ff04.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '赤'}"><img id="small_recipe_image" src="https://i.gyazo.com/953c5fbff4e0c1aa7a666ca607716b28.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黄'}"><img id="small_recipe_image" src="https://i.gyazo.com/051bb3f843b4c802c3c6d4558ae3e3a0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '白'}"><img id="small_recipe_image" src="https://i.gyazo.com/f8b6ffe614508e124e1e8e737f4f6016.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '緑'}"><img id="small_recipe_image" src="https://i.gyazo.com/52013a22a1fcbb1095d44f11f8419db0.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '青'}"><img id="small_recipe_image" src="https://i.gyazo.com/aaa7603719faf056fb09f02c166f5677.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '紫'}"><img id="small_recipe_image" src="https://i.gyazo.com/a742ca2d1846bdd8bf5134be57500496.png" alt="レシピアイコン"></c:if>
                            <c:if test="${recipe.color == '黒'}"><img id="small_recipe_image" src="https://i.gyazo.com/f6af496582b26eae6c59c4968a11da44.png" alt="レシピアイコン"></c:if>
                        </c:if>
                    </div>
                    <div id="data">
                        <table id="show">
                            <tbody>
                                <tr>
                                    <th>カクテル名</th>
                                    <td class="row0">
                                        <input type="text" name="name" value="${recipe.name}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>タイプ</th>
                                    <td class="row1">
                                        <select name="type">
                                            <option value="ショート"<c:if test="${recipe.type == 'ショート'}">selected</c:if>>ショート</option>
                                            <option value="ロング"<c:if test="${recipe.type == 'ロング'}">selected</c:if>>ロング</option>
                                            <option value="ホット"<c:if test="${recipe.type == 'ホット'}">selected</c:if>>ホット</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>色</th>
                                    <td class="row0">
                                        <select name="color">
                                            <option value="透明"<c:if test="${recipe.color == '透明'}">selected</c:if>>透明</option>
                                            <option value="ブラウン"<c:if test="${recipe.color == 'ブラウン'}">selected</c:if>>ブラウン</option>
                                            <option value="オレンジ"<c:if test="${recipe.color == 'オレンジ'}">selected</c:if>>オレンジ</option>
                                            <option value="ピンク"<c:if test="${recipe.color == 'ピンク'}">selected</c:if>>ピンク</option>
                                            <option value="赤"<c:if test="${recipe.color == '赤'}">selected</c:if>>赤</option>
                                            <option value="黄"<c:if test="${recipe.color == '黄'}">selected</c:if>>黄</option>
                                            <option value="白"<c:if test="${recipe.color == '白'}">selected</c:if>>白</option>
                                            <option value="緑"<c:if test="${recipe.color == '緑'}">selected</c:if>>緑</option>
                                            <option value="青"<c:if test="${recipe.color == '青'}">selected</c:if>>青</option>
                                            <option value="紫"<c:if test="${recipe.color == '紫'}">selected</c:if>>紫</option>
                                            <option value="黒"<c:if test="${recipe.color == '黒'}">selected</c:if>>黒</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>テイスト</th>
                                    <td class="row1">
                                        <select name="taste">
                                            <option value="甘口"<c:if test="${recipe.taste == '甘口'}">selected</c:if>>甘口</option>
                                            <option value="辛口"<c:if test="${recipe.taste == '辛口'}">selected</c:if>>辛口</option>
                                            <option value="中辛"<c:if test="${recipe.taste == '中辛'}">selected</c:if>>中辛</option>
                                            <option value="中甘辛口"<c:if test="${recipe.taste == '中甘辛口'}">selected</c:if>>中甘辛口</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>グラス</th>
                                    <td class="row0">
                                        <select name="glass">
                                            <option value="ロックグラス"<c:if test="${recipe.glass == 'ロックグラス'}">selected</c:if>>ロックグラス</option>
                                            <option value="タンブラー"<c:if test="${recipe.glass == 'タンブラー'}">selected</c:if>>タンブラー</option>
                                            <option value="カクテルグラス"<c:if test="${recipe.glass == 'カクテルグラス'}">selected</c:if>>カクテルグラス</option>
                                            <option value="リキュールグラス"<c:if test="${recipe.glass == 'リキュールグラス'}">selected</c:if>>リキュールグラス</option>
                                            <option value="ワイングラス"<c:if test="${recipe.glass == 'ワイングラス'}">selected</c:if>>ワイングラス</option>
                                            <option value="シャンパングラス"<c:if test="${recipe.glass == 'シャンパングラス'}">selected</c:if>>シャンパングラス</option>
                                            <option value="サワーグラス"<c:if test="${recipe.glass == 'サワーグラス'}">selected</c:if>>サワーグラス</option>
                                            <option value="ゴブレット"<c:if test="${recipe.glass == 'ゴブレット'}">selected</c:if>>ゴブレット</option>
                                            <option value="ショットグラス"<c:if test="${recipe.glass == 'ショットグラス'}">selected</c:if>>ショットグラス</option>
                                            <option value="その他"<c:if test="${recipe.glass == 'その他'}">selected</c:if>>その他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>技法</th>
                                    <td class="row1">
                                        <select name="technique">
                                            <option value="ビルド"<c:if test="${recipe.technique == 'ビルド'}">selected</c:if>>ビルド</option>
                                            <option value="ステア"<c:if test="${recipe.technique == 'ステア'}">selected</c:if>>ステア</option>
                                            <option value="シェーク"<c:if test="${recipe.technique == 'シェーク'}">selected</c:if>>シェーク</option>
                                            <option value="ブレンド"<c:if test="${recipe.technique == 'ブレンド'}">selected</c:if>>ブレンド</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="wrapper">
                    <div id="ingredient">
                        <h2 class="ingredient">材料</h2>
                        <table class="chose_ingredients">
                            <tbody>
                                <tr>
                                    <th>
                                        <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="1">
                                            <c:choose>
                                                <c:when test="${ing1.name != null}">
                                                    <c:out value="${ing1.name}" />
                                                </c:when>
                                                <c:otherwise>
                                                    材料1を選択
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </th>
                                    <c:if test="${ing1.name != null}">
                                        <td>
                                            <input id="number1" type="number" min="0" max="500" name="ing1_vol" value="${ing1_vol}" />
                                        </td>
                                        <td>
                                            <select id="type1" name="ing1_type" onchange="formSwitch1()">
                                                <option value="ml"<c:if test="${ing1_type == 'ml'}">selected</c:if>>ml</option>
                                                <option value="tsp"<c:if test="${ing1_type == 'tsp'}">selected</c:if>>tsp</option>
                                                <option value="dash"<c:if test="${ing1_type == 'dash'}">selected</c:if>>dash</option>
                                                <c:if test="${ing1.type == '副材料'}">
                                                    <option value="個"<c:if test="${ing1_type == '個'}">selected</c:if>>個</option>
                                                    <option value="適量"<c:if test="${ing1_type == '適量'}">selected</c:if>>適量</option>
                                                </c:if>
                                            </select>
                                        </td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th>
                                        <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="2">
                                            <c:choose>
                                                <c:when test="${ing2.name != null}">
                                                    <c:out value="${ing2.name}" />
                                                </c:when>
                                                <c:otherwise>
                                                    材料2を選択
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </th>
                                    <c:if test="${ing2.name != null}">
                                        <td>
                                            <input id="number2" type="number" min="0" max="500" name="ing2_vol" value="${ing2_vol}" />
                                        </td>
                                        <td>
                                            <select id="type2" name="ing2_type" onchange="formSwitch2()">
                                                <option value="ml"<c:if test="${ing2_type == 'ml'}">selected</c:if>>ml</option>
                                                <option value="tsp"<c:if test="${ing2_type == 'tsp'}">selected</c:if>>tsp</option>
                                                <option value="dash"<c:if test="${ing2_type == 'dash'}">selected</c:if>>dash</option>
                                                <c:if test="${ing2.type == '副材料'}">
                                                    <option value="個"<c:if test="${ing2_type == '個'}">selected</c:if>>個</option>
                                                    <option value="適量"<c:if test="${ing2_type == '適量'}">selected</c:if>>適量</option>
                                                </c:if>
                                            </select>
                                        </td>
                                    </c:if>
                                </tr>
                                <c:if test="${ing1.name != null && ing2.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="3">
                                                <c:choose>
                                                    <c:when test="${ing3.name != null}">
                                                        <c:out value="${ing3.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料3を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing3.name != null}">
                                            <td>
                                                <input id="number3" type="number" min="0" max="500" name="ing3_vol" value="${ing3_vol}" />
                                            </td>
                                            <td>
                                                <select id="type3" name="ing3_type" onchange="formSwitch3()">
                                                    <option value="ml"<c:if test="${ing3_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing3_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing3_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing3.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing3_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing3_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing3.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="4">
                                                <c:choose>
                                                    <c:when test="${ing4.name != null}">
                                                        <c:out value="${ing4.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料4を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing4.name != null}">
                                            <td>
                                                <input id="number4" type="number" min="0" max="500" name="ing4_vol" value="${ing4_vol}" />
                                            </td>
                                            <td>
                                                <select id="type4" name="ing4_type" onchange="formSwitch4()">
                                                    <option value="ml"<c:if test="${ing4_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing4_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing4_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing4.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing4_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing4_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing4.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="5">
                                                <c:choose>
                                                    <c:when test="${ing5.name != null}">
                                                        <c:out value="${ing5.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料5を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing5.name != null}">
                                            <td>
                                                <input id="number5" type="number" min="0" max="500" name="ing5_vol" value="${ing5_vol}" />
                                            </td>
                                            <td>
                                                <select id="type5" name="ing5_type" onchange="formSwitch5()">
                                                    <option value="ml"<c:if test="${ing5_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing5_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing5_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing5.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing5_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing5_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing5.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="6">
                                                <c:choose>
                                                    <c:when test="${ing6.name != null}">
                                                        <c:out value="${ing6.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料6を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing6.name != null}">
                                            <td>
                                                <input id="number6" type="number" min="0" max="500" name="ing6_vol" value="${ing6_vol}" />
                                            </td>
                                            <td>
                                                <select id="type6" name="ing6_type" onchange="formSwitch6()">
                                                    <option value="ml"<c:if test="${ing6_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing6_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing6_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing6.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing6_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing6_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing6.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="7">
                                                <c:choose>
                                                    <c:when test="${ing7.name != null}">
                                                        <c:out value="${ing7.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料7を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing7.name != null}">
                                            <td>
                                                <input id="number7" type="number" min="0" max="500" name="ing7_vol" value="${ing7_vol}" />
                                            </td>
                                            <td>
                                                <select id="type7" name="ing7_type" onchange="formSwitch7()">
                                                    <option value="ml"<c:if test="${ing7_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing7_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing7_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing7.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing7_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing7_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing7.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="8">
                                                <c:choose>
                                                    <c:when test="${ing8.name != null}">
                                                        <c:out value="${ing8.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料8を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing8.name != null}">
                                            <td>
                                                <input id="number8" type="number" min="0" max="500" name="ing8_vol" value="${ing8_vol}" />
                                            </td>
                                            <td>
                                                <select id="type8" name="ing8_type" onchange="formSwitch8()">
                                                    <option value="ml"<c:if test="${ing8_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing8_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing8_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing8.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing8_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing8_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing8.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="9">
                                                <c:choose>
                                                    <c:when test="${ing9.name != null}">
                                                        <c:out value="${ing9.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料9を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing9.name != null}">
                                            <td>
                                                <input id="number9" type="number" min="0" max="500" name="ing9_vol" value="${ing9_vol}" />
                                            </td>
                                            <td>
                                                <select id="type9" name="ing9_type" onchange="formSwitch9()">
                                                    <option value="ml"<c:if test="${ing9_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing9_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing9_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing9.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing9_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing9_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <c:if test="${ing9.name != null}">
                                    <tr>
                                        <th>
                                            <button class="as_anchor" type="submit" form="new" formaction="<c:url value='/recipes/ingredient_new' />" name="ing_number" value="10">
                                                <c:choose>
                                                    <c:when test="${ing10.name != null}">
                                                        <c:out value="${ing10.name}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        材料10を選択
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </th>
                                        <c:if test="${ing10.name != null}">
                                            <td>
                                                <input id="number10" type="number" min="0" max="500" name="ing10_vol" value="${ing10_vol}" />
                                            </td>
                                            <td>
                                                <select id="type10" name="ing10_type" onchange="formSwitch10()">
                                                    <option value="ml"<c:if test="${ing10_type == 'ml'}">selected</c:if>>ml</option>
                                                    <option value="tsp"<c:if test="${ing10_type == 'tsp'}">selected</c:if>>tsp</option>
                                                    <option value="dash"<c:if test="${ing10_type == 'dash'}">selected</c:if>>dash</option>
                                                    <c:if test="${ing10.type == '副材料'}">
                                                        <option value="個"<c:if test="${ing10_type == '個'}">selected</c:if>>個</option>
                                                        <option value="適量"<c:if test="${ing10_type == '適量'}">selected</c:if>>適量</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th>
                                        <c:if test="${ing3.name != null}">
                                            <button class="as_red_anchor" type="submit" form="new" formaction="<c:url value='/recipes/new' />" name="remove_flag" value="1">材料を1つ取消</button>
                                        </c:if>
                                    </th>
                                    <td></td><td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="introduction">
                        <h2 class="introduction">作り方・紹介コメント</h2>
                        <textarea name="introduction" rows="10" cols="50">${recipe.introduction}</textarea>
                    </div>
                </div>
                <div class="action_button">
                    <input type="hidden" name="_token" value="${_token}" />
                    <a class="gray_button" href="<c:url value='/' />">キャンセル</a>
                    <button class="orange_button" type="submit" formaction="<c:url value='/recipes/create' />">このレシピを投稿</button>
                </div>
            </form>

            <script>
                //"適量"が既に選択されている場合は数値入力フォームを非表示
                if(${ing1_type == "適量"}) {
                    document.getElementById("number1").style.display = "none";
                }
                if(${ing2_type == "適量"}) {
                    document.getElementById("number2").style.display = "none";
                }
                if(${ing3_type == "適量"}) {
                    document.getElementById("number3").style.display = "none";
                }
                if(${ing4_type == "適量"}) {
                    document.getElementById("number4").style.display = "none";
                }
                if(${ing5_type == "適量"}) {
                    document.getElementById("number5").style.display = "none";
                }
                if(${ing6_type == "適量"}) {
                    document.getElementById("number6").style.display = "none";
                }
                if(${ing7_type == "適量"}) {
                    document.getElementById("number7").style.display = "none";
                }
                if(${ing8_type == "適量"}) {
                    document.getElementById("number8").style.display = "none";
                }
                if(${ing9_type == "適量"}) {
                    document.getElementById("number9").style.display = "none";
                }
                if(${ing10_type == "適量"}) {
                    document.getElementById("number10").style.display = "none";
                }

                function formSwitch1() {
                    if(document.getElementById("type1")) {
                        select = document.getElementById("type1").value;
                        if(select == "適量") {
                            //"適量"が選択された場合数値入力フォームを非表示
                            document.getElementById("number1").style.display = "none";
                        }
                        else if(select != "適量") {
                            //"適量"以外が選択された場合数値入力フォームを表示
                            document.getElementById("number1").style.display = "";
                        }
                    }
                }
                function formSwitch2() {
                    if(document.getElementById("type2")) {
                        select = document.getElementById("type2").value;
                        if(select == "適量") {
                            document.getElementById("number2").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number2").style.display = "";
                        }
                    }
                }
                function formSwitch3() {
                    if(document.getElementById("type3")) {
                        select = document.getElementById("type3").value;
                        if(select == "適量") {
                            document.getElementById("number3").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number3").style.display = "";
                        }
                    }
                }
                function formSwitch4() {
                    if(document.getElementById("type4")) {
                        select = document.getElementById("type4").value;
                        if(select == "適量") {
                            document.getElementById("number4").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number4").style.display = "";
                        }
                    }
                }
                function formSwitch5() {
                    if(document.getElementById("type5")) {
                        select = document.getElementById("type5").value;
                        if(select == "適量") {
                            document.getElementById("number5").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number5").style.display = "";
                        }
                    }
                }
                function formSwitch6() {
                    if(document.getElementById("type6")) {
                        select = document.getElementById("type6").value;
                        if(select == "適量") {
                            document.getElementById("number6").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number6").style.display = "";
                        }
                    }
                }
                function formSwitch7() {
                    if(document.getElementById("type7")) {
                        select = document.getElementById("type7").value;
                        if(select == "適量") {
                            document.getElementById("number7").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number7").style.display = "";
                        }
                    }
                }
                function formSwitch8() {
                    if(document.getElementById("type8")) {
                        select = document.getElementById("type8").value;
                        if(select == "適量") {
                            document.getElementById("number8").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number8").style.display = "";
                        }
                    }
                }
                function formSwitch9() {
                    if(document.getElementById("type9")) {
                        select = document.getElementById("type9").value;
                        if(select == "適量") {
                            document.getElementById("number9").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number9").style.display = "";
                        }
                    }
                }
                function formSwitch10() {
                    if(document.getElementById("type10")) {
                        select = document.getElementById("type10").value;
                        if(select == "適量") {
                            document.getElementById("number10").style.display = "none";
                        }
                        else if(select != "適量") {
                            document.getElementById("number10").style.display = "";
                        }
                    }
                }
            </script>
        </div>
    </c:param>
</c:import>

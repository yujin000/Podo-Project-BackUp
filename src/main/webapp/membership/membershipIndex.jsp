<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버십 구독</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
@import url(src/css/reset.css);
/* system font */
@import
	url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap")
	;
body {
	color: silver;
	background-color: #222;
}

body::-webkit-scrollbar {
	display: none;
}

* {
	box-sizing: border-box;
}

div {
	border: 1px solid lightblue;
}

.container {
	width: 100vw;
}

@media ( max-width :1500px) {
	.container {
		width: 1500px;
	}
}
/* 헤더 네비 영역 */
#Header {
	height: 60px;
	width: 100%;
	overflow: hidden;
}

#Header>div:first-child, #Header>div:nth-child(2) {
	float: left;
	height: 100%;
	margin: auto;
}

/* 멤버십 구독 영역 */

/* 멤버십 - 이벤트 라벨 */
#eventLabel {
	height: 260px;
	width: 100%;
	background: linear-gradient(to right, #3e065f 0%, #ff00d7 100%);
	position: relative;
}

#labelText {
	position: absolute;
	color: white;
	left: 25%;
	transform: translateX(-25%);
	top: 40%;
	transform: translateY(-40%);
	font-size: 30px;
	font-weight: bold;
	white-space: nowrap;
}

#eventImg {
	height: 100%;
	object-fit: cover;
	position: absolute;
	left: 65%;
	transform: translateX(-65%);
}
/* 멤버십 - 이용권 top3 소개*/

/* My멤버십 영역 */
#myMembershipArea {
	display: none;
	position: relative;
}

#mainGoods {
	text-align: center;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	display: inline-block;
}

#mainGoods .listWrap {
	float: left;
	width: 280px;
	height: 260px;
	margin: 50px 0px 50px 0px;
	border-radius: 5px;
}

#promotion {
	background-image: linear-gradient(#000, #000),
		linear-gradient(to right, #3e065f 0%, #ff00d7 100%);
	border: 1px solid transparent;
	border-radius: 5px;
	background-origin: border-box;
	background-clip: content-box, border-box;
}

#mainGoods>div:nth-child(3), #mainGoods>div:nth-child(4) {
	margin-left: 50px;
	background-color: #000;
	border: 1px solid silver;
}

#mainGoods .listWrap:hover {
	cursor: pointer;
	transform: scale(1.01);
	transition: 0.2s;
	box-shadow: 1px 1px 3px 2px silver;
	border: 1px solid silver;
}

#eventSticker {
	position: absolute;
	border-radius: 30px;
	top: 40px;
	left: 110px;
	background-color: #ff00d7;
	z-index: 999;
	width: 60px;
	text-align: center;
	border:none;
}
/* 상품 설명 */
#goodsInfo {
	margin-top: 50px;
	text-align: center;
	height:500px;
}

/* 결제화면 */
#payment{
	text-aligh:center;
}
</style>
</head>
<body>
	<div class="container" id="wrap1">
		<div id="Header">
			<a id="subscribe">멤버십 구독</a> <a id="myMembership">My멤버십</a>
		</div>
		<!-- 멤버십 구독 -->
		<div id="subscribeArea">
			<div id="eventLabel">
				<div id="labelText" style="font-family: 'NanumSquareNeoExtraBold';">
					<small style="font-weight: normal; font-size: 20px; font-family: 'NanumSquareNeoBold';">최고 음질로
						디바이스 제한없이</small><br> 월 3,850원에 누리는 가장 완벽한<br>오디오 경험
				</div>
				<img src="/membership/eventimg.png" id="eventImg">
			</div>
			<div id="mainGoods">
				<div id="eventSticker">event</div>
				<c:choose>
					<c:when test="${not empty promotionGoods }">
						<c:forEach var="list" items="${promotionGoods }">
							<div class="listWrap" id="promotion">
								<input type="hidden" value="${list.payGoodsSeq }"
									id="promotionSeq" readonly>
								<div class="navi1">
									<input type="text" value="${list.payGoodsName }" readonly>
								</div>
								<div class="navi2">
									<input type="text" value="${list.payGoodsPrice }" class="promotionPrice" readonly>
								</div>
								<div class="navi3">
									<input type="text" value="${list.payGoodsExp }" readonly>
								</div>
								<div class="navi4">
									<input type="text" value="${list.payGoodsType }" readonly>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty eventGoods }">
						<c:forEach var="list" items="${eventGoods }">
							<div class="listWrap eventGoods">
								<input type="hidden" value="${list.payGoodsSeq }" readonly>
								<div class="navi1">
									<input type="text" value="${list.payGoodsName }" readonly>
								</div>
								<div class="navi2">
									<input type="text" value="${list.payGoodsPrice }"
										class="eventPrice" readonly>
								</div>
								<div class="navi3">
									<input type="text" value="${list.payGoodsExp }" readonly>
								</div>
								<div class="navi4">
									<input type="text" value="${list.payGoodsType }" readonly>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<hr>
			<div id="goodsInfo">상품 설명</div>
			<div id="payment">
				<button type=button id="payBtn"style="width:100%" price="">결제하기</button>
			</div>
			<!-- 버튼누르면 (해당하는 상품의 가격)원 결제하기 -->
			<div id="otherproduct">
				다른 상품들
				<c:choose>
					<c:when test="${not empty goodsList }">
						<c:forEach var="list" items="${goodsList }">
							<div class="listWrap">
								<input type="hidden" value="${list.payGoodsSeq }"
									class="inProductsSeq" readonly> <input type="text"
									value="${list.payGoodsName }" class="inProductsName" readonly>
								<input type="text" value="${list.payGoodsPrice }"
									class="inProductsPrice" readonly> <input type="text"
									value="${list.payGoodsExp }" class="inProductsExpire" readonly>
								<input type="text" value="${list.payGoodsType }"
									class="inProductsType" readonly>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!-- My 멤버십 -->
		<div id="myMembershipArea">My멤버십</div>
	</div>
	<script>
		/* 헤더 네비게이션 이벤트(해당 메뉴 선택시 display속성 변동) */
		$("#subscribe").on("click", function() {
			$("#myMembershipArea").css("display", "none");
			$("#subscribeArea").css("display", "block");
		})

		$("#myMembership").on("click", function() {
			$("#myMembershipArea").css("display", "block");
			$("#subscribeArea").css("display", "none");
		})

		/* 이벤트 상품 클릭시 border color 설정 및 상품상세정보(info), 결제하기 버튼에 가격 출력 */
		let price = 0;
			/* 프로모션 상품 */
		$("#promotion").on("click",function(){
			$(this).css({
				"background-image": "linear-gradient(#000, #000),linear-gradient(to right, #3e065f 0%, #ff00d7 100%)",
				"border": "1px solid transparent",
				"border-radius": "5px",
				"background-origin": "border-box",
				"background-clip": "content-box, border-box"
			})
			$(this).nextAll("div").css("border","1px solid silver");
			price = $(this).find(".promotionPrice").val();
			$("#payBtn").text(price + "원 결제하기");
			$("#payBtn").attr("price",price);
			warning.remove();
		})
			/* 이벤트 상품 */
		$(".eventGoods").on("click",function(){
			$(this).css({
				"background-image": "linear-gradient(#000, #000),linear-gradient(to right, #3e065f 0%, #ff00d7 100%)",
				"border": "1px solid transparent",
				"border-radius": "5px",
				"background-origin": "border-box",
				"background-clip": "content-box, border-box"
			})
			$(this).next("div").css("border","1px solid silver");
			$(this).prev("div").css("border","1px solid silver");
			$(this).prev("#promotion").css("border","1px solid silver");
			price = $(this).find(".eventPrice").val();
			$("#payBtn").text(price + "원 결제하기");
			$("#payBtn").attr("price",price);
			warning.remove();
		})
		
		/* 결제하기 버튼 클릭시 결제하기 팝업 및 결제 */
		let warning = $("<div>");
			warning.css({
				"color":"red",
				"text-align":"center"
			})
			warning.text("결제할 상품을 선택해주세요.")
			
		$("#payBtn").on("click",function(){
			if(price == 0){
				$("#goodsInfo").after(warning);
			}else{
				warning.remove();
				/*let target = $(this).attr("price");
				location.href = "/payment.payGoods?price=" + target;*/
			}
		})

	</script>
</body>
</html>
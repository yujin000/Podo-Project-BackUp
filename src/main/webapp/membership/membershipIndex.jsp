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

* {
	box-sizing: border-box;
}

div {
	border: 1px solid silver;
}

.container {
	width: 100vw;
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
	left: 20%;
	transform: translateX(-20%);
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
	left: 60%;
	transform: translateX(-35%);
}
/* 멤버십 - 이용권 top3 소개*/

/* My멤버십 영역 */
#myMembershipArea {
	display: none;
}

.Goods {
	overflow: hidden;
}

.listWrap {
	float: left;
	width: 200px;
}

.listWrap:hover {
	cursor: pointer;
	transform: scale(1.01);
	transition: 0.2s;
	box-shadow: 1px 1px 3px 3px silver;
	border: 1px solid silver;
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
				<div id="labelText">
					<small style="font-weight: normal; font-size: 20px;">최고 음질로
						디바이스 제한없이</small><br> 월 3,850원에 누리는 가장 완벽한<br>오디오 경험
				</div>
				<img src="/membership/eventimg.png" id="eventImg">
			</div>
			<div class="Goods">
				<c:choose>
					<c:when test="${not empty goodsList }">
						<c:forEach var="list" items="${goodsList }">
							<div class="listWrap">
								<input type="hidden" value="${list.payGoodsSeq }"
									class="inProductsSeq" readonly>
								<div class="navi1">
									<input type="text" value="${list.payGoodsName }"
										class="inProductsName" readonly>
								</div>
								<div class="navi2"><input type="text" value="${list.payGoodsPrice }"
										class="inProductsPrice" readonly></div>
								<div class="navi3">
									<input type="text" value="${list.payGoodsExp }"
										class="inProductsExpire" readonly>
								</div>
								<div class="navi4">
									<input type="text" value="${list.payGoodsType }"
										class="inProductsType" readonly>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<div id="goodsInfo">상품 설명</div>
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
	</script>
</body>
</html>
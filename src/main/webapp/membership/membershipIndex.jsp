<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버십 구독</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	/*border: 1px solid lightblue;*/
}

.container {
	width: 100vw;
	margin-bottom:200px;
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
	text-align:center;
}

#Header>div:first-child, #Header>div:nth-child(2) {
	height: 100%;
	margin: auto;
	display: inline-block;
	line-height:50px;
	position:relative;
}

#Header>div:nth-child(2) {
	margin-left:20px;
}

#Header>div:first-child:hover, #Header>div:nth-child(2):hover {
	cursor:pointer;
}

#subscribe::after,#myMembership::after {
    content: "";
    position: absolute;
    bottom: 18px;
    left: 50%;
    transform: translateX(-50%);
    width: 0%;
    height: 3px;
    background: #ff00d7;
    transition: all .1s ease-out;
    border-radius: 5px;
}

#subscribe:hover::after, #myMembership:hover::after {
    width: 100%;
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
	margin: 100px 0px 150px 0px;
	border-radius: 5px;
}

#promotion {
	border: 2px solid #FF0050;
	border-radius: 5px;
	background-origin: border-box;
	background-clip: content-box, border-box;
}
.proText{
	margin-top:40px;
	font-size:25px;
	font-weight:bold;
	color:white;
}
.proPriceText{
	color:#FF0050;
	font-size:20px;
	margin-top:80px;
}
#mainGoods>a:nth-child(3)>div, #mainGoods>a:nth-child(4)>div {
	margin-left: 50px;
	background-color: transparent;
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
	top: 90px;
	left: 110px;
	background-color: #FF0050;
	z-index: 999;
	width: 60px;
	text-align: center;
	border:none;
}
/* 상품 설명 */
#hr{
	width:80%;
	margin:auto;
}
#goodsInfo {
	width:80%;
	margin:auto;
	height:500px;
}
#selectInfo{
	width:100%;
	margin:auto;
	height:200px;
	border:1px solid #FF0050;
	overflow:none;
	border-radius: 5px;
	line-height:200px;
	margin-top:100px;
}
.selectInfo{
	width:80%;
	margin-left:100px;
	resize:none;
	border:none;
	background-color:transparent;
	border-radius:5px;
	color:white;
	font-size:20px;
	font-weight:bold;
	height:100%;
	line-height:35px;
	font-family: 'NanumSquareNeoExtraBold';
	padding-top:50px;
}
.selectInfo::-webkit-scrollbar{
	display:none;
}
/* 결제화면 */
#payment{
	text-align:center;
}
#payBtn{
	border:1px solid silver;
	background-color:#111;
	height:50px;
	color:silver;
	width:80%;
	border-radius: 5px;
	font-size:20px;
}

</style>
</head>
<body>
	<div class="container" id="wrap1">
		<div id="Header">
			<div id="subscribe">멤버쉽 구독</div> <div id="myMembership">My멤버십</div>
		</div>
		<!-- 멤버십 구독 -->
		<div id="subscribeArea">
			<div id="eventLabel">
				<div id="labelText" style="font-family: 'NanumSquareNeoExtraBold';">
					<small style="font-weight: normal; font-size: 20px; font-family: 'NanumSquareNeoBold';">최고 음질로
						디바이스 제한없이</small><br> 월 3,850원에 누리는 가장 완벽한<br>오디오 경험
				</div>
				<img src="/image/web/eventimg.png" id="eventImg">
			</div>
			<div id="mainGoods">
				<div id="eventSticker">event</div>
				<c:choose>
					<c:when test="${not empty promotionGoods }">
						<c:forEach var="list" items="${promotionGoods }">
						<a href="#goodsInfo" class="promotion" info="${list.payGoodsInfo }">
							<div class="listWrap" id="promotion">
							<br>
							<ul>
								<li class="proText">${list.payGoodsName }</li>
								<li class="proPriceText">월 <fmt:formatNumber value="${list.payGoodsPrice }" pattern="#,###"/>원 부터</li>
							</ul>
								<input type="hidden" value="${list.payGoodsPrice }" class="promotionPrice" readonly>
								<input type="hidden" value="${list.payGoodsSeq }" class="promotionSeq" readonly>
								<input type="hidden" value="${list.payGoodsName }" class="promotionName" readonly>
							</div>
						</a>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty eventGoods }">
						<c:forEach var="list" items="${eventGoods }">
						<a href="#goodsInfo" class="eventGoods" info="${list.payGoodsInfo }">
							<div class="listWrap">
							<br>
							<ul>
								<li class="proText">${list.payGoodsName }</li>
								<li class="proPriceText">월 <fmt:formatNumber value="${list.payGoodsPrice }" pattern="#,###"/>원 부터</li>
							</ul>
								<input type="hidden" value="${list.payGoodsPrice }" class="eventPrice" readonly>
								<input type="hidden" value="${list.payGoodsSeq }" class="eventSeq" readonly>
								<input type="hidden" value="${list.payGoodsName }" class="eventName" readonly>
							</div>
							</a>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<hr id="hr">
			<div id="goodsInfo">
				<br><span style="font-size:25px; font-weight:bold;">멤버십 혜택을 확인하세요</span>
				<div id="selectInfo">
					<textarea class="selectInfo" disabled></textarea>
				</div>
				
			</div>
			<div id="payment">
				<button type=button id="payBtn" price="">결제하기</button>
			</div>
		</div>
		<!-- My 멤버십 -->
		<div id="myMembershipArea">
			My멤버십
		</div>
		<input type="hidden" value="${loginEmail }" id="user">
		<input type="hidden" value="${loginMembership }" id="logMemship">
	</div>
	<script>
		/* 헤더 네비게이션 이벤트( 페이지 전환 : 해당 메뉴 선택시 display속성 변동, 아래 바 추가 ) */
		let bar = $("<div>");
			bar.css({
			    "position": "absolute",
			    "bottom": "18px",
			    "left": "50%",
			    "transform": "translateX(-50%)",
			    "width": "100%",
			    "height": "3px",
			    "background": "#ff00d7",
			    "border-radius": "5px"
			});
			
		$(function(){
			$("#subscribe").append(bar);
		})
		
		$("#subscribe").on("click", function() {
			$(this).remove(bar);
			$(this).append(bar);
			$("#myMembershipArea").css("display", "none");
			$("#subscribeArea").css("display", "block");
		})
		
		/*$("#subscribe").on("mouseover",function(){
			$("#myMembershipArea").remove(bar);
		})*/
		
		$("#myMembership").on("click", function() {
			$(this).remove(bar);
			$(this).append(bar);
			$("#myMembershipArea").css("display", "block");
			$("#subscribeArea").css("display", "none");
		})

		/* 결제하기 버튼 호버 이벤트 */
		$("#payBtn").on("mouseover",function(){
			$(this).css("cursor","pointer");
		})
		
		/* 이벤트 상품 클릭시 border color 설정 및 상품상세정보(info), 결제하기 버튼에 가격 출력 */
		let price = 0;
		let userEmail = user.value;
		let nowMembership = logMemship.value;
		let goodsSeq;
		let goodsName;
		
			/* 프로모션 상품 */
		$(".promotion").on("click",function(){
			event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 800);
			$(this).find("#promotion").css({
				"border": "2px solid #FF0050",
				"border-radius": "5px",
				"background-origin": "border-box",
				"background-clip": "content-box, border-box"
			})
			$(this).nextAll("a").find("div").css("border","1px solid silver");
			
			price = $(this).find(".promotionPrice").val();
			goodsSeq = $(this).find(".promotionSeq").val();
			goodsName = $(this).find(".promotionName").val();
			
			$("#payBtn").css({
				"background-color":"#FF0050",
				"color":"white",
				"border":"1px solid #FF0050"
			});
			$("#payBtn").text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원 카카오페이 결제하기");
			$("#payBtn").attr("price",price);
			warning.remove();
			
			$(".selectInfo").text("");
			let info = $(this).attr("info");
			$(".selectInfo").append("👽"+info);
		})

			/* 이벤트 상품 */
		$(".eventGoods").on("click",function(){
			event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 800);
			$(this).find(".listWrap").css({
				"border": "2px solid #FF0050",
				"border-radius": "5px",
				"background-origin": "border-box",
				"background-clip": "content-box, border-box"
			})
			$(this).next("a").find("div").css("border","1px solid silver");
			$(this).prev("a").find("div").css("border","1px solid silver");
			$(this).prev("a").prev("a").find("div").css("border","1px solid silver");
			
			price = $(this).find(".eventPrice").val();
			goodsSeq = $(this).find(".eventSeq").val();
			goodsName = $(this).find(".eventName").val();
			
			$("#payBtn").css({
				"background-color":"#FF0050",
				"color":"white",
				"border":"1px solid #FF0050"
			});
			$("#payBtn").text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원 카카오페이 결제하기");
			$("#payBtn").attr("price",price);
			warning.remove();
			
			$(".selectInfo").text("");
			let info = $(this).attr("info");
			$(".selectInfo").append(info);
		})

		/* 결제하기 버튼 클릭시 결제하기 팝업 및 결제(로그인 여부 확인) */
		let warning = $("<div>");
			warning.css({
				"color":"red",
				"text-align":"center"
			})
			warning.text("결제할 상품을 선택해주세요.");

			/* 결제하기 */
		$("#payBtn").on("click",function(){
			if(userEmail == ""){
				alert("로그인 후 이용할 수 있습니다.");
				window.parent.location.href = "/member/loginForm.jsp";
			}else if(nowMembership == "vip"){
				Swal.fire({
					  icon: 'warning',
					  iconColor:'#FF0050',
					  title: '현재 사용중인 이용권이 있습니다',
					  text: '이용권 기간이 끝난 후 구매해주세요.',
					  footer: '<a href="/mypage.member" style="text-decoration:none;color:#3e065f;">마이페이지에서 남은 기간 확인하기</a>'
					})
			}else if(nowMembership == "admin"){
				Swal.fire({
					  icon: 'warning',
					  iconColor:'#FF0050',
					  title: '관리자는 이용권을 구매할 수 없습니다.',
					})
			}else{
				if(price == 0){
					$("#goodsInfo").after(warning);
				}else{
					warning.remove();
					let price = $(this).attr("price");
					
					var IMP = window.IMP;
		            IMP.init('imp66837815');
		            IMP.request_pay({
		                pg: "kakaopay",
		                pay_method: 'card',
		                merchant_uid: 'merchant_' + new Date().getTime(),
		                name: '결제',
		                amount: price,
		                buyer_email: userEmail,
		                buyer_name: '구매자 이름'
		            }, function (rsp) {
		                if (rsp.success) {
		                    var msg = '결제가 완료되었습니다.';
		                    Swal.fire({
		                    	  position: 'center',
		                    	  icon: 'success',
		                    	  iconColor:'#FF0050',
		                    	  title: '결제가 완료되었습니다.',
		                    	  showConfirmButton: false,
		                    	  timer: 2000
		                    })
		                    setTimeout(function(){
		                    	window.parent.location.href = "/payComplete.paymem?payGoodsSeq="+goodsSeq+"&payMemberEmail="+userEmail;
		                    },2100);
		                } else {
		                    var msg = '결제에 실패하였습니다.';
		                    rsp.error_msg;
		                }
		            });
				}
			}
		})

	</script>
</body>
</html>
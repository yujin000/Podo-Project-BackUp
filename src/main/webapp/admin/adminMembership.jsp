<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>음원관리</title>
    <link rel="stylesheet" href="/src/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        /* ---------- 관리자페이지 세팅 초기값 ---------- */
        ::-webkit-scrollbar {
            display: block;
        }

        @media(max-width:1800px) {
            .html {
                width: 1800px;
            }
        }

        .loginBtn {
            border-top: 0px;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        .html {
            overflow: hidden;
        }

        .wrap {
            width: 230px;
            height: 100vh;
            float: left;
        }

        #Header {
            position: fixed !important;
        }

        .adminContents {
            background: var(- -background-color);
            width: 80%;
            height: 100vh;
            overflow-y: scroll;
            float: left;
            padding-left: 7%;
        }

        .adminMainHeader {
            width: 85vw;
            height: 13vh;
            background-color: silver;
            margin: 0px 10px 0px 10px;
            position: relative;
        }

        .mainText {
            font-size: 36px;
            margin-top: 50px;
        }

        .adminMainHeader span {
            margin-left: 30px;
        }

        .adminMainView {
            color: silver;
            width: 100%;
            margin: auto;
        }

        .tog {
            top: 130px;
        }

        /* ---------↑ 기본값 설정 여기까지 ---------- */

        .onSale {
            width: 100%;
            height: 600px;
            margin: 25px 0px 10px;
        }

        .onSale>div:first-child {
            height: 10%;
        }

        .onSale>div:nth-child(2) {
            height: 90%;
        }

        div[id^=onSale] {
            width: 100%;
        }

        div[id^=products] {
            float: left;
            width: 160px;
            color: silver;
            text-align: center;
            border: 1px solid silver;
            height: 100%;
            line-height: 59px;
        }

        #onSaleContents {
            border: 1px solid silver;
        }

        #onSaleContents>div:first-child {
            height: 10%;
            border: 1px solid silver;
            width: 100%;
        }

        #onSaleContents>div:nth-child(2) {
            height: 90%;
            border: 1px solid silver;
            width: 100%;
            overflow-y: scroll;
        }

        #onSaleContents>div:nth-child(2)::-webkit-scrollbar {
            height: 10px;
        }

        #onSaleContents>div:nth-child(2)::-webkit-scrollbar-thumb {
            background-color: #FF1150;
            border-radius: 10px;
            background-clip: padding-box;
            border: 4px solid transparent;
        }

        #onSaleAddProducts {
            border: 1px solid silver;
            height: 538.9px;
        }

        #onSaleAddProducts>div:first-child {
            height: 10%;
            border: 1px solid silver;
            width: 100%;
        }

        #onSaleAddProducts>div:nth-child(2) {
            height: 90%;
            border: 1px solid silver;
            width: 30%;
            overflow-y: scroll;
            margin:auto;
            text-align: center;
        }
        #onSaleAddProducts>div:nth-child(2) input,#onSaleAddProducts>div:nth-child(2) textarea{
            width:100%;
            display:inline;
        }

        #onSaleAddProducts {
            display: none;
        }

        #navUl {
            list-style: none;
        }

        #navUl>li:first-child,
        .listWrap>div:first-child {
            margin-left: 2%;
        }

        .navLi {
            float: left;
            line-height: 53px;
        }

        hr {
            width: 100%;
        }

        #listHr {
            border: 0.7px dashed;
        }

        .listWrap {
            width: 100%;
            color: silver;
        }

        .listWrap div {
            font-size: 18px;
            height: 100px;
            float: left;
            line-height: 100px;
        }

        /*d여기부터 작성중*/
        #productsUpdate:hover,
        #products:hover {
            cursor: pointer;
        }

        div[class^=navi] {
            width: 200px;
            text-align: center;
        }

        .listWrap>div:nth-child(2) {
            width: 350px;
        }

        li[class^=nav] {
            width: 200px;
            text-align: center;
        }

        #tndNav {
            width: 350px;
        }

        #products {
            background-color: silver;
            color: black;
        }

        #btnBox2 {
            height: 100%;
            margin-left: 10%;
        }

        @media (max-width :1600px) {
            #btnBox2 {
                height: 100%;
                margin-left: 2%;
            }
        }

        .update,
        .delete {
            border: none;
            background-color: transparent;
            color: silver;
            margin-top: 25px;
        }

        .update+.delete {
            margin-left: 10px;
        }

        .update:hover,
        .delete:hover {
            cursor: pointer;
            background-color: silver;
            transition: 0.2s;
            border-radius: 2px 2px 2px 2px;
            color: black
        }

        #addProducts {
            background-image: linear-gradient(#000, #000),
                linear-gradient(to right, #3e065f 0%, #ff00d7 100%);
            border: 1px solid transparent;
            border-radius: 5px;
            background-origin: border-box;
            background-clip: content-box, border-box;
            margin: 10px 0px 5px;
            background-color: #555;
            height: 70px;
            text-align: center;
            line-height: 70px;
            font-size: 20px;
        }

        .inProductsName {
            width: 300px;
            font-size: 18px;
            background-color: transparent;
            border: none;
            text-align: center;
        }
		.inProductsSeq,
        .inProductsPrice,
        .inProductsExpire,
        .inProductsType {
            width: 200px;
            font-size: 18px;
            background-color: transparent;
            border: none;
            text-align: center;
        }
        .inProductsInfo{
            width: 100%;
            font-size: 18px;
            background-color: transparent;
            border: none;
            text-align: center;
        }
        #addProductsText{
            line-height: 50px;
            border:none;
            text-align: center;
        }
		.updConfirmBtn:hover,.updCancelBtn:hover{
			cursor:pointer;
		}
		#onSaleAddProducts input,#onSaleAddProducts textarea{
			color:black;
		}
    </style>
</head>

<body>
<div class="html">
        <div class="wrap">
            <div id="Header">
                <h1 id="logo">
                    <a href="/adminMain.member?nickname=${loginNickname }"><img src="/image/web/logo-f-5.png"
                            alt="" /></a>
                </h1>
                <div id="mypage">
                    <a class="loginBtn">${nickname }</a>
                </div>
                <ul class="tog">
                    <li><a href="/index.jsp">메인페이지로</a></li>
                    <li><a href="#">계정설정</a></li>
                    <li><a href="/logout.member">로그아웃</a></li>
                </ul>
                <div id="GNB">
                    <ul>
                        <li><a id="today">공지사항 작성</a></li>
                        <li><a id="chart" href="/allList.music?nickname=${loginNickname }">음원 관리</a></li>
                        <li><a id="chart">공연 관리</a></li>
                        <li><a href="#">회원 관리</a></li>
                        <li><a href="/goodsList.goods">멤버십 관리</a></li>
                        <li><a href="#">문의내역 확인</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="adminContents">
            <div class="adminMainView">
                <div class="mainText">멤버십 관리</div>
                <br>
                <hr>
                <!-- 현재 판매중인 멤버십 -->
                <div class="onSale">
                    <div id="onSaleNav">
                        <div id="products">현재 판매 중인 멤버십</div>
                        <div id="productsUpdate">상품 추가하기</div>
                    </div>
                    <div id="onSaleContents">
                        <div>
                            <ul id="navUl">
                                <li class="navLi">상품코드</li>
                                <li class="navLi" id="tndNav">상품명</li>
                                <li class="navLi">상품가격</li>
                                <li class="navLi">사용기간</li>
                                <li class="navLi">정기권 유무</li>
                            </ul>
                        </div>
                        <div>
                        	<form id="upForm">
                            <c:choose>
                                <c:when test="${not empty goodsList }">
                                    <c:forEach var="list" items="${goodsList }">
                                        <div class="listWrap">
                                            <div class="navi1"><input type="text" value="${list.payGoodsSeq }" class="inProductsSeq" readonly></div>
                                            <div class="navi2"><input type="text" value="${list.payGoodsName }"
                                                    class="inProductsName" readonly></div>
                                            <div class="navi3"><input type="text" value="${list.payGoodsPrice }" class="inProductsPrice"
                                                    readonly></div>
                                            <div class="navi4"><input type="text" value="${list.payGoodsExp }" class="inProductsExpire"
                                                    readonly></div>
                                            <div class="navi5"><input type="text" value="${list.payGoodsType }" class="inProductsType"
                                                    readonly></div>
                                            <div class="btnBox">
                                                <button type="button" class="update">수정</button>
                                                <button type="button" class="delete" seq="${list.payGoodsSeq }">삭제</button>
                                            </div>
                                            <span><input type="text" value="${list.payGoodsInfo }" class="inProductsInfo" readonly></span>
                                            <hr id="listHr">
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            </form>
                        </div>
                    </div>
                    <!-- 수정/추가/삭제 -->
                    <form id="addForm">
                        <div id="onSaleAddProducts">
                            <div id="addProductsText">
                                <h2>추가하실 상품 정보를 입력해주세요.</h2>
                            </div>
                            <div>
                                상품명
                                <input type="text" id="add1" name="payGoodsName">
                                상품가격
                                <input type="text" id="add2" name="payGoodsPrice">
                                이용기간
                                <input type="text" id="add3" name="payGoodsExp">
                                상품유형
                                <input type="text" id="add4" name="payGoodsType">
                                상품설명
                                <textarea id="add5" name="payGoodsInfo" style="width: 100%; height: 100px; resize: none;"></textarea>
                                <button type="button" id="addProductsBtn">추가하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 관리자 버튼 토글
        let adminBtn = document.getElementById("mypage");
        $(adminBtn).click(function () {
            $(this).next(".tog").fadeToggle();
        });

        // 멤버십, 수정/추가/삭제 버튼 클릭 이벤트
        $("#products").on("click", function () {
            $("#products").css({
                "background-color": "silver",
                "color": "black"
            })
            $("#productsUpdate").css({
                "background-color": "black",
                "color": "silver"
            })
            $("#onSaleContents").css({ "display": "block" })
            $("#onSaleAddProducts").css({ "display": "none" })
        })
        $("#productsUpdate").on("click", function () {
            $("#productsUpdate").css({
                "background-color": "silver",
                "color": "black"
            })
            $("#products").css({
                "background-color": "black",
                "color": "silver"
            })
            $("#onSaleContents").css({ "display": "none" })
            $("#onSaleAddProducts").css({ "display": "block" })
        })

        // 현재 판매중인 이용권 수정버튼 생성
        let updCancelBtn = $("<button>");
        	updCancelBtn.attr("type","button");
        	updCancelBtn.addClass("updCancelBtn");
        	updCancelBtn.css({
        		"border": "none",
            	"background-color": "transparent",
            	"color": "silver",
            	"margin-top": "25px",
            	"margin-left":"10px"
        	})
        	updCancelBtn.text("수정취소");
        	
        let updConfirmBtn = $("<button>");
	        updConfirmBtn.attr("type","button");
	        updConfirmBtn.addClass("updConfirmBtn");
	        updConfirmBtn.css({
	    		"border": "none",
	        	"background-color": "transparent",
	        	"color": "silver",
	        	"margin-top": "25px"
	    	})
	    	updConfirmBtn.text("저장");
        
        // 수정 버튼 클릭 시 readonly > false로 변경
        $(".update").on("click", function () {
        	$(this).parent().find(".delete").css("display","none");
        	$(this).parent().find(".update").css("display","none");
        	$(this).parent().append(updConfirmBtn);
        	$(this).parent().append(updCancelBtn);
        	$(this).parent().parent().find("input").removeAttr("readonly");
        	$(this).parent().parent().find(".inProductsSeq").attr("readonly","true");
        	$(this).parent().parent().find("input").css("color","#ff00d7");
        	$(this).parent().parent().find(".inProductsSeq").css("color","silver");
        	$(this).parent().parent().find(".navi2").focus();
        	$(this).parent().parent().find(".inProductsSeq").attr("name","payGoodsSeq");
        	$(this).parent().parent().find(".inProductsName").attr("name","payGoodsName");
        	$(this).parent().parent().find(".inProductsPrice").attr("name","payGoodsPrice");
        	$(this).parent().parent().find(".inProductsExpire").attr("name","payGoodsExp");
        	$(this).parent().parent().find(".inProductsType").attr("name","payGoodsType");
        	$(this).parent().parent().find(".inProductsInfo").attr("name","payGoodsInfo");
        })
        
        // 저장, 수정취소 버튼 호버이벤트 부여
        updCancelBtn.on("mouseover", function() {
			$(this).css("font-weight", "bold");
		})
		updCancelBtn.on("mouseout", function() {
			$(this).css("font-weight", "normal");
		})
		updConfirmBtn.on("mouseover", function() {
			$(this).css("font-weight", "bold");
		})
		updConfirmBtn.on("mouseout", function() {
			$(this).css("font-weight", "normal");
		})
		
        // 수정사항 저장 버튼
        updConfirmBtn.on("click",function(){
        	$("#upForm").attr("action","/update.goods");
        	$("#upForm").attr("method","post");
        	if(confirm("입력하신 내용으로 수정하시겠습니까?")){
            	$("#upForm").submit();
        	}
        })
        
        // 취소버튼
        updCancelBtn.on("click",function(){
        	if (confirm("수정사항을 취소하시겠습니까?")) {
				location.reload();
			}
        })
        
        // 삭제버튼
		$(".delete").on("click", function() {
			if (confirm("삭제하시겠습니까?")) {
				let target = $(this).attr("seq");
				location.href = "/delete.goods?seq=" + target;
			}
		})
		
		// 상품추가하기
        $("#addProductsBtn").on("click", function () {
            if ($("#add1").val() == ""
                || $("#add2").val() == ""
                || $("#add3").val() == ""
                || $("#add4").val() == ""
               	|| $("#add5").val() == "") {
                alert("입력사항은 모두 입력되어야 합니다.");
            } else {
                if (confirm("추가하시겠습니까?")) {
                    $("#addForm").attr("action", "/addProducts.goods");
                    $("#addForm").attr("method", "post");
                    $("#addForm").submit();
                }
            }
        })
    </script>
</body>

</html>
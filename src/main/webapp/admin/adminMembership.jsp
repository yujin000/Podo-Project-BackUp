<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>멤버십 관리</title>
    <link rel="stylesheet" href="/src/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        /* ---------- 관리자페이지 세팅 초기값 ---------- */
        /* 관리자페이지 세팅 초기값 */
        @media(max-width:1700px) {
            .html {
                width: 1700px;
            }
        }

        * div:not(#Header) {
            color: #515151;
        }

        #list,
        .listLi {
            color: #515151;
            height: 50px;
            line-height: 50px;
        }
        
        #listLi1{
        	background-color:#01B9FF;
        }
        
        .listLi:hover {
            cursor: pointer;
            background-color: #01B9FF;
        }

        .loginBtn {
            border-top: 0px;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        body {
            background: #EEEEEE;
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
            background-color: #515151;
        }

        .adminContents {
            width: 84%;
            height: 100vh;
            overflow-y: scroll;
            float: left;
            padding-left: 2%;
            padding-top: 2%;
        }

        .adminMainHeader {
            width: 85vw;
            height: 13vh;
            background-color: lightgray;
            position: relative;
        }

        .mainText {
            font-size: 30px;
            border: 1px solid silver;
            width: 100%;
            height: 70px;
            background-color: #FFFFFF;
            line-height: 60px;
            padding-left: 20px;
        }

        .adminMainView {
            width: 100%;
            margin: auto;
        }

        .tog {
            top: 130px;
        }

        .mainList {
            margin-top: 30px;
            background-color: #FFFFFF;
            border: 1px solid silver;
            height: 400px;
            width: 20%;
            float: left;
        }

        .mainContents {
            background-color: #FFFFFF;
            border: 1px solid silver;
            float: left;
            position: relative;
            width: 77.4%;
            height: 700px;
            margin-left: 30px;
            margin-top: 30px;
            overflow: hidden;
        }

        div[id^=mainConArea] {
            width: 100%;
            height: 100%;
        }
		#mainConArea1{
			overflow-y: scroll;
		}
        #mainConArea2 {
            display: none;
            overflow-y: scroll;
        }
        
        input,textarea{
            color:black;
        }
        button{
            color:black;
        }
        b{
            color:black;
        }
/* 기본 리스트 css */
.listWrap{
    position:relative;
    height:150px;
}
b{
    color:black;
}
.listWrap input{
    border:none;
}
div[class^=navi]{
    display:inline-block;
    position:absolute;
}
#musicImg{
    width:100px;
    height:100px;
    top:50%;
    transform: translateY(-50%);
    left:25px;
}
.navi1{
    left:30px;
    top:40%;
    transform: translateY(-40%);
    z-index: 99;
}
.navi2{
    top:15px;
    left:150px;
}
.navi3{
    top:15px;
    left:360px;
}
.navi4{
    bottom:20px;
    left:150px;
}
.navi5{
    bottom:20px;
    left:360px;
}
.navi6{
    top:10px;
    left:550px;
    width:300px;
    height:110px;
}
.navi6>textarea{
    resize: none;
    width:100%;
    height:84%;
}
#btnBox2{
    display:inline-block;
    right:50px;
    position: absolute;
    top:50%;
    transform: translateY(-50%);
}
#listHr{
    position:absolute;
    bottom:1px;
    width:100%;
}
/* 기본 리스트 css 끝 */
        /* 추가하기 */
.mainConArea2{
    position:relative;
}
#h1text{
    position:absolute;
    color:#515151;
    left:30px;
    top:10px;
}
div[class^=inInfo],.btnBox{
    display:inline-block;
    position:absolute;
}
.addImg>img{
    width:100%;
    height:100%;
}
.inInfo1{
    left:380px;
    top:90px;
}
.inInfo2{
    left:380px;
    top:140px;
}
.inInfo3{
    left:380px;
    top:190px;
}
.inInfo4{
    left:380px;
    top:240px;
}
.inInfo5{
    left:380px;
    top:290px;
}

.inInfo5 textarea{
    width:380px;
    height:200px;
    resize: none;
}

.btnBox{
    bottom:100px;
    left:380px;
}
.btnBox>button:first-child{
    background-color: #FF0050;
    color:white;
    width:100px;
    height:30px;
    border-radius: 5px;
    border:none;
}
.btnBox>button:nth-child(2){
    width:100px;
    height:30px;
    border-radius: 5px;
    border:1px solid silver;
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
                    <a class="loginBtn">${nickName }</a>
                </div>
			<ul class="tog">
				<li><a href="/start.music">메인페이지로</a></li>
				<li><a href="/logout.member">로그아웃</a></li>
			</ul>
			<div id="GNB">
				<ul>
					<li><a href="/list.notice?cpage=1">공지사항 관리</a></li>
					<li><a href="/allList.music">음원 관리</a></li>
					<li><a href="/adminPerform.perform">공연 관리</a></li>
					<li><a href="/list.member?cpage=1">회원 관리</a></li>
					<li><a href="/goodsList.goods">멤버십 관리</a></li>
					<li><a href="/adminList.board?cpage=1">문의내역 확인</a></li>
				</ul>
			</div>
            </div>
        </div>
        <div class="adminContents">
            <div class="adminMainView">
                <div class="mainText">멤버십 관리</div>
                <div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                            &nbsp 현재 판매중인 멤버십
                        </li>
                        <li class="listLi" id="listLi2">
                            &nbsp 상품 추가하기
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
                        <form id="upForm">
                            <c:choose>
                                <c:when test="${not empty goodsList }">
                                    <c:forEach var="list" items="${goodsList}">
                                        <input type="hidden" class="seq" name="seq"
                                            value="${list.payGoodsSeq }">
                                        <div class="listWrap">
                                            <div class="navi1"><b>· 상품코드</b><br><input type="text" value="${list.payGoodsSeq }" class="inProductsSeq" readonly></div>
                                            <div class="navi2"><b>· 상품이름</b><br><input type="text" value="${list.payGoodsName }" class="inProductsName" readonly></div>
                                            <div class="navi3"><b>· 상품가격</b><br><input type="text" value="${list.payGoodsPrice }" class="inProductsPrice" readonly></div>
                                            <div class="navi4"><b>· 이용기간</b><br><input type="text" value="${list.payGoodsExp }" class="inProductsExpire" readonly></div>
                                            <div class="navi5"><b>· 상품유형</b><br><input type="text" value="${list.payGoodsType }" class="inProductsType" placeholder="프로모션, 이용권 중 하나만 입력하세요" readonly></div>
                                            <div class="navi6"><b>· 상품설명</b><br><textarea class="inProductsInfo" style="color:black;"readonly>${list.payGoodsInfo } </textarea></div>
                                            <div id="btnBox2">
                                                <button type="button" class="update" seq="${list.payGoodsSeq }">수정</button>
                                                <button type="button" class="delete" seq="${list.payGoodsSeq }">삭제</button>
                                            </div>
                                            <input type="hidden" value="${list.payGoodsSeq }"
                                                class="seqHidden">
                                            <input type="hidden" class="addChk">
                                            <hr id="listHr">
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    출력할 내용이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>

                    <div id="mainConArea2">
                        <h1 id="h1text">이용권 추가하기</h1>
                        <form id="addForm">
                            <div class="addPerform" id="addPerform">
                                <div class="container">
                                    <div class="contentsInfo">
                                        <div class="inInfo1">
                                            <b>· 상품명</b><br />
                                            <input type="text" name="payGoodsName" id="payGoodsName" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo2">
                                            <b>· 상품가격</b><br />
                                            <input type="text" name="payGoodsPrice" id="payGoodsPrice" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo3">
                                            <b>· 이용기간</b><br />
                                            <input type="text" name="payGoodsExp" id="payGoodsExp" class="textArea"  maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo4">
                                            <b>· 상품유형</b><br />
                                            <input type="text" name="payGoodsType" id="payGoodsType" class="textArea" maxlength="20"/><br />
                                        </div>
                                        <div class="inInfo5">
                                            <b>· 상품설명</b><br />
                                            <textarea type="text" name="payGoodsInfo" id="payGoodsInfo" style="color: black" maxlength="50"></textarea>
                                        </div>
                                        <div class="btnBox">
                                            <button type="button" id="addProductsBtn">저장하기</button>
                                            <button type="button" id="cancelPerform">취소하기</button>
                                        </div>
    
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
        // 리스트  클릭 이벤트
        $("#listLi1").on("click", function () {
            $(this).css("background-color", "#01B9FF");
            $("#listLi2").css("background-color", "#FFFFFF")
            $("#mainConArea1").css({
                "display": "block"
            })
            $("#mainConArea2").css({
                "display": "none"
            })
        })
        $("#listLi2").on("click", function () {
            $(this).css("background-color", "#01B9FF");
            $("#listLi1").css("background-color", "#FFFFFF")
            $("#mainConArea1").css({
                "display": "none"
            })
            $("#mainConArea2").css({
                "display": "block"
            })
        })


        // 현재 판매중인 이용권 수정버튼 생성
        let updCancelBtn = $("<button>");
        updCancelBtn.attr("type", "button");
        updCancelBtn.addClass("updCancelBtn");
        updCancelBtn.css({
            "margin-top": "25px",
            "margin-left": "10px"
        })
        updCancelBtn.text("취소");

        let updConfirmBtn = $("<button>");
        updConfirmBtn.attr("type", "button");
        updConfirmBtn.addClass("updConfirmBtn");
        updConfirmBtn.css({
            "margin-top": "25px"
        })
        updConfirmBtn.text("저장");

        // 수정 버튼 클릭 시 readonly > false로 변경
        $(".update").on("click", function () {
            $(this).parent().find(".delete").css("display", "none");
            $(this).parent().find(".update").css("display", "none");
            $(this).parent().append(updConfirmBtn);
            $(this).parent().append(updCancelBtn);
            $(this).parent().parent().find("input").removeAttr("readonly");
            $(this).parent().parent().find(".inProductsSeq").attr("readonly", "true");
            $(this).parent().parent().find("textarea").removeAttr("readonly");
            $(this).parent().parent().find("input").css({
            	"color": "#FF0050",
            	"border":"1px solid black"
            });
            $(this).parent().parent().find("textarea").css("color", "#FF0050");
            $(this).parent().parent().find(".inProductsSeq").css("color", "silver");
            $(this).parent().parent().find(".navi2").focus();
            $(this).parent().parent().find(".inProductsSeq").attr("name", "payGoodsSeq");
            $(this).parent().parent().find(".inProductsName").attr("name", "payGoodsName");
            $(this).parent().parent().find(".inProductsPrice").attr("name", "payGoodsPrice");
            $(this).parent().parent().find(".inProductsExpire").attr("name", "payGoodsExp");
            $(this).parent().parent().find(".inProductsType").attr("name", "payGoodsType");
            $(this).parent().parent().find(".inProductsInfo").attr("name", "payGoodsInfo");
        })

        // 수정사항 저장 버튼
        updConfirmBtn.on("click", function () {
            $("#upForm").attr("action", "/update.goods");
            $("#upForm").attr("method", "post");
            if (confirm("입력하신 내용으로 수정하시겠습니까?")) {
                $("#upForm").submit();
            }
        })

        // 취소버튼
        updCancelBtn.on("click", function () {
            if (confirm("수정사항을 취소하시겠습니까?")) {
                location.reload();
            }
        })

        // 삭제버튼
        $(".delete").on("click", function () {
            if (confirm("삭제하시겠습니까?")) {
                let target = $(this).attr("seq");
                location.href = "/delete.goods?seq=" + target;
            }
        })

        let priceChk = false;
        let span = $("<span>");

        //유효성검사(가격)
        $("#payGoodsPrice").on("keyup",function(){
              let regex = /^[0-9]{1,10}$/;
              let result = regex.test($("#payGoodsPrice").val());

              if(!result){
                  $("#payGoodsPrice").after(span);
                  span.text("숫자만 입력할 수 있습니다.");
                  span.css("color","#FF0050");
                  priceChk = false;
              }else{
                priceChk = true;
                span.remove();
              }
        })

        // 상품 최대 갯수 3개 제한
		let chk = document.getElementsByClassName('addChk').length;
        
        // 상품추가하기
        $("#addProductsBtn").on("click", function () {
        	if(chk < 3){
        		if ($("#payGoodsName").val() == ""
                    || $("#payGoodsPrice").val() == ""
                    || $("#payGoodsExp").val() == ""
                    || $("#payGoodsType").val() == ""
                    || $("#payGoodsInfo").val() == "") {
                    alert("입력사항은 모두 입력되어야 합니다.");
                }else if(priceChk == false){
                      alert("양식을 다시 확인해주세요.");
                } else {
                    if (confirm("추가하시겠습니까?")) {
                        $("#addForm").attr("action", "/addProducts.goods");
                        $("#addForm").attr("method", "post");
                        $("#addForm").submit();
                    }
                }
        	}else{
        		alert("상품은 최대 3개까지 등록할 수 있습니다.");
        	}
            
        })

    </script>
</body>

</html>
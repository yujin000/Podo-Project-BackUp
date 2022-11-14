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
       /* 관리자페이지 세팅 초기값 */
       @media(max-width:1500px) {
            .html {
                width: 1500px;
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
            display: hidden;
        }
        
        input{
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
                    <a class="loginBtn">${nickName }</a>
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
                <div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                            &nbsp 현재 판매중인 멤버십
                            <hr>
                        </li>
                        <li class="listLi" id="listLi2">
                            &nbsp 상품 추가하기
                            <hr>
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
                        <form id="upForm">
                            <c:choose>
                                <c:when test="${not empty goodsList }">
                                    <c:forEach var="list" items="${goodsList }">
                                        <div class="listWrap">
                                            <div class="navi1"><input type="text" value="${list.payGoodsSeq }"
                                                    class="inProductsSeq" readonly></div>
                                            <div class="navi2"><input type="text" value="${list.payGoodsName }"
                                                    class="inProductsName" readonly></div>
                                            <div class="navi3"><input type="text" value="${list.payGoodsPrice }"
                                                    class="inProductsPrice" readonly></div>
                                            <div class="navi4"><input type="text" value="${list.payGoodsExp }"
                                                    class="inProductsExpire" readonly></div>
                                            <div class="navi5"><input type="text" value="${list.payGoodsType }"
                                                    class="inProductsType" readonly></div>
                                            <div class="btnBox">
                                                <button type="button" class="update">수정</button>
                                                <button type="button" class="delete"
                                                    seq="${list.payGoodsSeq }">삭제</button>
                                            </div>
                                            <span><input type="text" value="${list.payGoodsInfo }"
                                                    class="inProductsInfo" readonly></span>
                                            <hr id="listHr">
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </form>
                    </div>
                    <div id="mainConArea2">
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
                                    <textarea id="add5" name="payGoodsInfo"
                                        style="width: 100%; height: 100px; resize: none;"></textarea>
                                    <button type="button" id="addProductsBtn">추가하기</button>
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
            "border": "none",
            "background-color": "transparent",
            "color": "silver",
            "margin-top": "25px",
            "margin-left": "10px"
        })
        updCancelBtn.text("수정취소");

        let updConfirmBtn = $("<button>");
        updConfirmBtn.attr("type", "button");
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
            $(this).parent().find(".delete").css("display", "none");
            $(this).parent().find(".update").css("display", "none");
            $(this).parent().append(updConfirmBtn);
            $(this).parent().append(updCancelBtn);
            $(this).parent().parent().find("input").removeAttr("readonly");
            $(this).parent().parent().find(".inProductsSeq").attr("readonly", "true");
            $(this).parent().parent().find("input").css("color", "#ff00d7");
            $(this).parent().parent().find(".inProductsSeq").css("color", "silver");
            $(this).parent().parent().find(".navi2").focus();
            $(this).parent().parent().find(".inProductsSeq").attr("name", "payGoodsSeq");
            $(this).parent().parent().find(".inProductsName").attr("name", "payGoodsName");
            $(this).parent().parent().find(".inProductsPrice").attr("name", "payGoodsPrice");
            $(this).parent().parent().find(".inProductsExpire").attr("name", "payGoodsExp");
            $(this).parent().parent().find(".inProductsType").attr("name", "payGoodsType");
            $(this).parent().parent().find(".inProductsInfo").attr("name", "payGoodsInfo");
        })

        // 저장, 수정취소 버튼 호버이벤트 부여
        updCancelBtn.on("mouseover", function () {
            $(this).css("font-weight", "bold");
        })
        updCancelBtn.on("mouseout", function () {
            $(this).css("font-weight", "normal");
        })
        updConfirmBtn.on("mouseover", function () {
            $(this).css("font-weight", "bold");
        })
        updConfirmBtn.on("mouseout", function () {
            $(this).css("font-weight", "normal");
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
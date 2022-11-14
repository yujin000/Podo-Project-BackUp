<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        
        /*기본*/
        #btnBox2 {
			height: 100%;
			margin-left: 10%;
		}
		hr {
			width: 100%;
		}
		button{
			color:black;
		}
		/* 리스트 */
		#listHr {
			border: 0.7px dashed;
		}
		.listWrap {
			width: 100%;
			color: silver;
		}
		
		.listWrap div {
			font-size: small;
			overflow: hidden;
			height: 23.6px;
			float: left;
		}
		
		.listWrap button {
			float: left;
			line-height: 20px;
		}
		
		div[class^=listWrap]:hover:not(#listWrap1) {
			border-radius: 5px;
			cursor: pointer;
			/*background: linear-gradient(60deg, #3e065f, #ff00d7);*/
			background-color:silver;
			transform: scale(1.01);
			transition: 0.2s;
		}
		
		div[class^=navi] {
			width: 200px;
			height: 70px;
			text-align: center;
			line-height: 70px;
		}
		
		.navi1, .navibar1 {
			width: 80px !important;
			margin-left: 100px;
		}
		
		.navibar {
			font-size: 20px !important;
		}
		
		.navi5 {
			margin-bottom: 5px;
		}
		/* 리스트 */
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
                    <a class="loginBtn">${loginNickname }</a>
                </div>
			<ul class="tog">
				<li><a href="/chart.music">메인페이지로</a></li>
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
                <div class="mainText">공연 관리</div>
                <div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                            &nbsp 현재 등록된 공연 목록<hr>
                        </li>
                        <li class="listLi" id="listLi2">
                            &nbsp 공연 추가하기<hr>
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
						<c:choose>
							<c:when test="${not empty perform }">
								<c:forEach var="perform" items="${perform }">
								<form id="upForm">
									<div class="listWrap">
										<div class="navi1" id="musicImg">
											<img src="/admin/${perform.poster }.jpg" id="albumImg">
										</div>
										<div class="navi2"><input type="text" value="${perform.theaterName }" class="intheaterName" readonly></div>
										<div class="navi3"><input type="text" value="${perform.performTitle }" class="inperformTitle" readonly></div>
										<div class="navi4"><input type="text" value="${perform.showtime }" class="inshowtime" readonly></div>
										<div class="navi5"><input type="text" value="<fmt:formatDate value="${perform.startDate }" pattern="yyyy-MM-dd"/>" class="instartDate" readonly></div>
										<div class="navi6"><input type="text" value="<fmt:formatDate value="${perform.endDate }" pattern="yyyy-MM-dd"/>" class="inendDate" readonly></div>
										<div class="navi7"><input type="text" value="${perform.performPrice }" class="inperformPrice" readonly></div>
										<div class="navi8"><input type="text" value="${perform.rating }" class="inrating" readonly></div>
										<div class="navi9"><input type="text" value="${perform.genre }" class="ingenre" readonly></div>
										<div id="btnBox2">
											<button type="button" class="update" pSeq="${perform.performSeq }">수정</button>
											<button type="button" class="delete" seq="${perform.performSeq }">삭제</button>
										</div>
										<hr id="listHr">
									</div>
								</form>	
								</c:forEach>
							</c:when>
							<c:otherwise>
                                출력할 내용이 없습니다.
                            </c:otherwise>
						</c:choose>
                    </div>
                    <form id="addPerform">
                    <div id="mainConArea2">
                        <div class="contentsInfo">
                            <div class="infoArea">
                                공연장<br>
                                <input type="text" name="theaterName" id="theaterName" class="inputText"><br>
                                공연이름<br>
                                <input type="text" name="performTitle" id="performTitle" class="inputText"><br>
                                러닝타임<br> 
                                <input type="text" name="showtime" id="showtime" class="inputText"><br>
                                공연 시작일 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp공연 종료일<br> 
                                <input type="date" name="startDate" id="startDate">
                                <input type="date" name="endDate" id="endDate"><br>
                                티켓 가격
                                <input type="text" name="performPrice" id="performPrice" class="inputText"><br>
                                관람 등급<br>
                                <input type="text" name="rating" id="rating" class="inputText"><br>
                                장르<br>
                                <input type="text" name="genre" id="genre" class="inputText"><br>
                            </div>
                            &nbsp&nbsp&nbsp공연 포스터 첨부
                            <div class="filebox">
<label for="file"></label> <input
                                    type="file" id="file" name="posterFile" onchange="readURL(this)">
                            </div>
                                                        &nbsp&nbsp&nbsp공연 포스터 첨부1
                            <div class="filebox">
 <label for="file2"></label> <input
                                    type="file" id="performPoster" name="performPoster">
                            </div>
                            <br>
                            <div class="btnBox">
                                <button type="button" id="saveMusic">저장하기</button>
                                <button type="button" id="cancelMusic">취소하기</button>
                            </div>
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

		// 삭제 버튼
		$(".delete").on("click", function() {
			if (confirm("삭제하시겠습니까?")) {
				let target = $(this).attr("seq");
				location.href = "/deletePerform.perform?seq=" + target;
			}
		})
		
		//  수정버튼 생성
        let updCancelBtn = $("<button>");
        	updCancelBtn.attr("type","button");
        	updCancelBtn.addClass("updCancelBtn");
        	updCancelBtn.css({
        		"border": "none",
            	"margin-top": "25px",
            	"color":"black",
            	"margin-left":"10px"
        	})
        	updCancelBtn.text("수정취소");
        	
        let updConfirmBtn = $("<button>");
	        updConfirmBtn.attr("type","button");
	        updConfirmBtn.addClass("updConfirmBtn");
	        updConfirmBtn.css({
	    		"border": "none",
	        	"margin-top": "25px",
	        	"color":"black"
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
	        	
	        	$(this).parent().parent().find(".intheaterName").attr("name","theaterName");
	        	$(this).parent().parent().find(".inperformTitle").attr("name","performTitle");
	        	$(this).parent().parent().find(".inshowtime").attr("name","showtime");
	        	$(this).parent().parent().find(".instartDate").attr("name","startDate");
	        	$(this).parent().parent().find(".inendDate").attr("name","endDate");
	        	$(this).parent().parent().find(".inperformPrice").attr("name","performPrice");
	        	$(this).parent().parent().find(".inrating").attr("name","rating");
	        	$(this).parent().parent().find(".ingenre").attr("name","genre");
	        })
	           
		
        // 수정사항 저장 버튼
        updConfirmBtn.on("click",function(){
        	let target = $(".update").attr("pSeq");
        	$("#upForm").attr("action","/updPerform.perform?pSeq="+target);
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
        
        // 공연추가
        $("#saveMusic").on("click",function(){
        	$("#addPerform").attr("action","/addPerform.perform");
        	$("#addPerform").attr("method","post");
        	$("#addPerform").submit();
        })
        
</script>
</body>

</html>
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
    <title>회원 관리</title>
    <link rel="stylesheet" href="/src/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
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

        .listLi:hover {
            cursor: pointer;
            background-color: purple;
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
            display : none;
        }

        .mainContents {
            background-color: #FFFFFF;
            border: 1px solid silver;
            float: left;
            position: relative;
            width: 100%;
            height: 700px;
            margin-top: 30px;
            overflow: hidden;
        }

        div[id^=mainConArea] {
            width: 100%;
            height: 95%;
        }
        
        #mainConArea2 {
            display: hidden;
        }
        
        input{
            color:black;
        }
        
        #listHeader>div, .qnaList>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #qnaSeqHeader, .qnaSeq {
        	width : 15%;
        }
        #qnaCategoryHeader, .qnaCategory {
        	width : 15%;
        }
        #qnaTitleHeader, .qnaTitle {
       		width : 30%;
        }
        #qnaWriterHeader, .qnaWriter {
        	width : 15%;
        }
        #qnaWriteDateHeader, .qnaWriteDate {
        	width : 10%;
        }
        #qnaStatusHeader, .qnaStatus {
        	width : 10%;
        }
        .qnaList, #listHeader {
        	height : 30px;
        }
        #listHeader{
        	height : 60px;
            line-height:60px;
        	font-size:20px;
        	background-color:purple;
        }
        #listHeader>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        }
        #qnaList{
        	margin-top:10px;
        }
        #listHr{
        	margin:5px 0px 5px 0px;
        }
        .qnaTitle>a{
            color:black;
            font-weight: bold;
        }
        /*기본*/
    </style>
</head>

<body>
    <div class="html">
        <div class="wrap">
            <div id="Header">
                <h1 id="logo">
                    <a href="/adminMain.adminMain"><img src="/image/web/logo-f-5.png"
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
                <div class="mainText">문의내역 확인</div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<div id="listHeader">
                        	<div id="qnaSeqHeader">문의 번호</div>
                        	<div id="qnaCategoryHeader">문의 유형</div>
                        	<div id="qnaTitleHeader">제목</div>
                        	<div id="qnaWriterHeader">작성자</div>
                        	<div id="qnaWriteDateHeader">문의 날짜</div>
                        	<div id="qnaStatusHeader">답변 상태</div>
                        </div>
                        <div id="qnaList">
                        	<c:choose>
                        		<c:when test="${not empty qna }">
                        			<c:forEach var="i" items="${qna }">
                        				<div class="qnaList">
                        					<div class="qnaSeq">${i.qnaSeq }</div>
                        					<div class="qnaCategory">${i.qnaCategory }</div>
                        					<div class="qnaTitle">
                                                <a href="/adminQnaDetail.board?qnaSeq=${i.qnaSeq }">${i.qnaTitle }</a>
                                            </div>
                        					<div class="qnaWriter">${i.qnaWriter }</div>
                        					<div class="qnaWriteDate"><fmt:formatDate value="${i.qnaWriteDate }" pattern="yyyy-MM-dd hh:mm"/></div>
                                            <div class="qnaStatus"></div>
                        				</div>
                        				<hr id="listHr">
                        			</c:forEach>                        			
                        		</c:when>    
                                <c:otherwise>
                                    <div>글이 없습니다.</div>
                                </c:otherwise>                    		
                        	</c:choose>
                        </div>                                                
                    </div>
                    <div id="navi">${navi }</div>
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
        
        // 회원 탈퇴 클릭 이벤트
        $(".delBtn").on("click", function(){
        	if ($(this).attr("membership")=="admin") {
        		alert("관리자는 강퇴시킬 수 없습니다!");
        	} else {
        		if (confirm("정말 탈퇴시키겠습니까? 시행하면 복원할 수 없습니다.")) {
        			alert("강퇴 완료.");
        			location.href = "/adminDel.member?email="+$(this).attr("email");
        		}
        	}
        });

        // 리스트  클릭 이벤트
//         $("#listLi1").on("click", function () {
//             $(this).css("background-color", "#01B9FF");
//             $("#listLi2").css("background-color", "#FFFFFF")
//             $("#mainConArea1").css({
//                 "display": "block"
//             })
//             $("#mainConArea2").css({
//                 "display": "none"
//             })
//         })
//         $("#listLi2").on("click", function () {
//             $(this).css("background-color", "#01B9FF");
//             $("#listLi1").css("background-color", "#FFFFFF")
//             $("#mainConArea1").css({
//                 "display": "none"
//             })
//             $("#mainConArea2").css({
//                 "display": "block"
//             })
//         })


    </script>
</body>

</html>
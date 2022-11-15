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
        @media(min-width:1800px) {
            .html {
                width: 1800px;
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
        
        #listHeader>div, .noticeList>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #noticeSeqHeader, .noticeSeq {
            margin-left:80px;
        	width : 15%;
        }
        #noticeCategoryHeader, .noticeCategory {
        	width : 10%;
        }
        #noticeTitleHeader, .noticeTitle {
       		width : 30%;
        }
        #noticeWriterHeader, .noticeWriter {
            margin-left:80px;
        	width : 10%;
        }
        #noticeWriteDateHeader, .noticeWriteDate {
            margin-left:80px;
        	width : 10%;
        }
        #qnaStatusHeader, .qnaStatus {
        	width : 15%;
        }
        .noticeList, #listHeader {
        	height : 30px;
        }
        #listHeader{
        	height : 60px;
            line-height:60px;
        	font-size:20px;
        	background-color:#01B9FF;
        }
        #listHeader>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        	padding-bottom:100px;
        	color:black !important;
        }
        #noticeList{
        	margin-top:10px;
        }
        #listHr{
        	margin:5px 0px 5px 0px;
        }
        .noticeTitle>a{
            color:black;
            font-weight: bold;
        }
		#writeBtn{
            background-color: #FF0050;
            color:white !important;
            width:100px;
            height:30px;
            border-radius: 5px;
            border:none;
            position:absolute;
            margin-right:100px;
            font-size:15px;
            line-height: 30px;
            left:20px;
            bottom:20px;
            text-align:center;
        }
        #writeBtn:hover{
        	cursor:pointer;
        }
        /*기본*/
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
                <div class="mainText">공지사항 관리</div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<div id="listHeader">
                        	<div id="noticeSeqHeader">번호</div>
                        	<div id="noticeCategoryHeader">유형</div>
                        	<div id="noticeTitleHeader">제목</div>
                        	<div id="noticeWriterHeader">작성자</div>
                        	<div id="noticeWriteDateHeader">작성일</div>
                        </div>
                        <div id="noticeList">
                        	<c:choose>
                        		<c:when test="${not empty noticeBoardList }">
                        			<c:forEach var="i" items="${noticeBoardList }">
                        				<div class="noticeList">
                        					<div class="noticeSeq">${i.noticeSeq }</div>
                        					<div class="noticeCategory">${i.noticeCategory }</div>
                        					<div class="noticeTitle">
                                                <a href="/detail.notice?noticeSeq=${i.noticeSeq }">${i.noticeTitle }</a>
                                            </div>
                        					<div class="noticeWriter">${i.noticeWriter }</div>
                        					<div class="noticeWriteDate"><fmt:formatDate value="${i.noticeWriteDate }" pattern="yyyy-MM-dd"/></div>
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
                    <div id="writeBtn">공지사항 작성</div>
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
        
	    // 공지사항 작성
	      $("#writeBtn").on("click", function(){
				location.href = "/admin/adminNotice/noticeWrite.jsp"; 
	      });
      	//쿠키
	      /*$.cookie("visits", 10);
	      $.cookie("visits", 10, {path: "/", domain: "http://localhost/list.notice?cpage=1"});
	      $.cookie(visits, 10, {expires: new Date(2022, 11, 15, 10, 15, 00)});
	      function myfunction(e){
	          $(e).parent().css("color:red");
	      }   */  

    </script>
</body>

</html>
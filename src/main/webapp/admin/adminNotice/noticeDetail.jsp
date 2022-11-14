<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 보기</title>
<link rel="stylesheet" href="/src/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
   integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
   crossorigin="anonymous"></script>
<style>
/* 공통 css와 겹쳐서 초기화 */
.loginBtn {
   border-top: 0px;
   border-bottom: 0px;
   margin-bottom: 0px;
}

#Header {
   position: fixed !important;
}

.adminContents {
   position: absolute;
   left: 230px;
   background: var(- -background-color);
   width: 100%;
   height: 100vh;
   margin: 50px 0px 0px 140px;
   overflow-y: scroll;
}

.adminMainHeader {
   width: 85vw;
   height: 13vh;
   background-color: lightgray;
   margin: 0px 10px 0px 10px;
   position: relative;
}

.mainText {
   font-size: 36px;
}

.adminMainHeader span {
   margin-left: 30px;
}

.adminMainView {
   color: white;
   width: 1200px;
}

.tog {
   top: 130px;
}
.header, #header2{
	height:30px;
}
.header>div, #header2>div{
	float:left;
}
#noticeSeqHeader, #noticeSeq{
	width : 5%;
}
#noticeCategoryHeader, #noticeWriteDateHeader, #noticeCategory, #noticeWriteDate {
	width : 10%;
}
#noticeTitleHeader, #noticeTitle {
	width : 20%;
}
#noticeWriterHeader, #noticeWriter {
	width : 15%;
}
#contents{
	width : 800px;
}

</style>
</head>

<body>
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
      <div class="adminContents">
         <div class="adminMainView">
            <div class="mainText">공지사항 보기</div>
            <br>
            <hr>   
         </div>
         <div class="header">
         			<div id="noticeSeqHeader">공지사항 번호</div>
            		<div id="noticeCategoryHeader">공지사항 유형</div>
            		<div id="noticeTitleHeader">제목</div>
            		<div id="noticeWriterHeader">작성자</div>
            		<div id="noticeWriteDateHeader">작성 날짜</div>
            </div>
            	<form action="/del.notice" id="form">
            	<div id="header2">            				
            		<div id="noticeSeq">${noticeDetail.noticeSeq }</div>
            		<div id="noticeCategory">${noticeDetail.noticeCategory }</div>
            		<div id="noticeTitle">${noticeDetail.noticeTitle }</div>
            		<div id="noticeWriter">${noticeDetail.noticeWriter }</div>
            		<div id="noticeWriteDate">${noticeDetail.noticeWriteDate }</div>
            		<input type="hidden" name="noticeSeq" value="${noticeDetail.noticeSeq }">
            		<input type="hidden" name="sysName" value="${noticeDetailFile.sysName }">            		
            	</div>
            	</form>
            	<div id="contents">
            		<div>본문</div>
            		${noticeDetail.noticeContents }
            	</div>
            	<div>첨부파일 : <a href="/download.file?sysname=${noticeDetailFile.sysName }&oriname=${noticeDetailFile.oriName}">${noticeDetailFile.oriName }</a></div>
            	<c:choose>
            	<c:when test="${loginMembership eq 'admin' }">
            	<div id="del">삭제</div>
            	</c:when>
            	</c:choose>
      </div>
   </div>
   <script>
      // 관리자 버튼 토글
      let adminBtn = document.getElementById("mypage");
      $(adminBtn).click(function() {
         $(this).next(".tog").fadeToggle();
      });
      
      $("#del").on("click", function(){
    	 if (confirm("정말 삭제하시겠습니까?")) {
    		 $("#form").css("action","/del.notice");
    		 $("#form").submit();
    	 } 
      });
      
   </script>
</body>

</html>
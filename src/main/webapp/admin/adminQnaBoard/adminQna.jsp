<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>문의내역 관리</title>
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

.header>div{
	float: left;
}
.header{
	height:10%;
}
.qnaList>div{
	float:left;
}
#qnaSeqHeader, #qnaStatusHeader, .qnaSeq, .qnaStatus {
	width : 5%;
}
#qnaCategoryHeader, #qnaWriteDateHeader, .qnaCategory, .qnaWriteDate {
	width : 10%;
}
#qnaTitleHeader, .qnaTitle {
	width : 20%;
}
#qnaWriterHeader, .qnaWriter {
	width : 15%;
}

</style>
</head>

<body>
   <div class="wrap">
      <div id="Header">
         <h1 id="logo">
            <a href="/adminMain.admin?nickname=${loginNickname }"><img
               src="/image/web/logo-f-5.png" alt="" /></a>
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
               <li><a href="/list.notice">공지사항 관리</a></li>
               <li><a id="chart" href="/allList.music?nickname=${loginNickname }">음원 관리</a></li>
               <li><a id="chart">공연 관리</a></li>
               <li><a href="#">회원 관리</a></li>
               <li><a href="/adminMemship.admin">멤버십 관리</a></li>
               <li><a href="/adminList.board?cpage=1">문의내역 확인</a></li>
            </ul>
         </div>
      </div>
      <div class="adminContents">
         <div class="adminMainView">
            <div class="mainText">문의내역 확인</div>
            <br>
            <hr>                        
         </div>
         <div class="header">
         			<div id="qnaSeqHeader">문의 번호</div>
            		<div id="qnaCategoryHeader">문의 유형</div>
            		<div id="qnaTitleHeader">제목</div>
            		<div id="qnaWriterHeader">작성자</div>
            		<div id="qnaWriteDateHeader">문의 날짜</div>
            		<div id="qnaStatusHeader">답변 상태</div>
            	</div>
            <c:choose>            	
            	<c:when test="${not empty qna }">
            		<c:forEach var = "i" items = "${qna }">
            			<div class="qnaList">
            				<div class="qnaSeq">${i.qnaSeq }</div>            				
            				<div class="qnaCategory">${i.qnaCategory }</div>
            				<div class="qnaTitle"><a href="/adminQnaDetail.board?qnaSeq=${i.qnaSeq }">${i.qnaTitle }</a></div>
            				<div class="qnaWriter">${i.qnaWriter }</div>
            				<div class="qnaWriteDate">${i.qnaWriteDate }</div>
            				<div class="qnaStatus"></div>
            			</div>
            		</c:forEach>            		
            	</c:when>
            	<c:otherwise>
            		<div>글이 없습니다.</div>
            	</c:otherwise>
            </c:choose>
      </div>
   </div>
   <script>
      // 관리자 버튼 토글
      let adminBtn = document.getElementById("mypage");
      $(adminBtn).click(function() {
         $(this).next(".tog").fadeToggle();
      });
      
   </script>
</body>

</html>
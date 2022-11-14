<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 관리</title>
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

.noticeList {
	height : 30px;
}

.noticeList>div, .header>div{
	float:left;
}

.header, .noticeList {
	height : 30px;
}

#noticeSeqHeader, .noticeSeq {
	width : 5%;
}
#noticeCategoryHeader, .noticeCategory {
	width : 15%;
}
#noticeTitleHeader, .noticeTitle, #noticeWriteDateHeader, .noticeWriteDate {
	width : 20%;
}
#noticeWriterHeader, .noticeWriter {
	width : 15%;
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
      <div class="adminContents">
         <div class="adminMainView">
            <div class="mainText">공지사항 관리</div>
            <br>
            <hr>
            <div class="header">
            	<div id="noticeSeqHeader">번호</div>
            	<div id="noticeCategoryHeader">유형</div>
            	<div id="noticeTitleHeader">제목</div>
            	<div id="noticeWriterHeader">작성자</div>
            	<div id="noticeWriteDateHeader">작성날짜</div>
            </div>
            <c:choose>
            	<c:when test = "${not empty noticeBoardList }">
            		<c:forEach var = "i" items = "${noticeBoardList }">
            			<div class="noticeList">            				
            				<div class="noticeSeq">${i.noticeSeq }</div>
            				<div class="noticeCategory">${i.noticeCategory }</div>
            				<div class="noticeTitle"><a href="/detail.notice?noticeSeq=${i.noticeSeq }">${i.noticeTitle }</a></div>
            				<div class="noticeWriter">${i.noticeWriter }</div>
            				<div class="noticeWriteDate">${i.noticeWriteDate }</div>
            			</div>
            		</c:forEach>            		
            	</c:when>
            	<c:otherwise>
            		<div>글이 없습니다.</div>
            	</c:otherwise>
            </c:choose>
            
            <div>${navi }</div>
            <div id="writeBtn">공지사항 쓰기</div>
            
         </div>
      </div>
   </div>
   <script>
      // 관리자 버튼 토글
      let adminBtn = document.getElementById("mypage");
      $(adminBtn).click(function() {
         $(this).next(".tog").fadeToggle();
      });
      
      $("#writeBtn").on("click", function(){
			location.href = "/admin/adminNotice/noticeWrite.jsp"; 
      });
      
   </script>
</body>

</html>
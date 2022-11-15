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
<title>관리자페이지</title>
<link rel="stylesheet" href="/src/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<style>
 /* ---------- 관리자페이지 세팅 초기값 ---------- */
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
        .mainContents a{
        	color:black;
        }
/*------------------------------------------------*/
        div[id^=mainConArea] {
            width: 100%;
            height: 100%;
        }    
        input,textarea,button,b{
            color:black;
        }
        /* ㅇ*/
        .mainIsland{
            background-color: #ffffff;
            float:left;
            border:1px solid silver;
        }
        .mainContents{
            overflow: hidden;
        }
        .leftArea, .rightArea{
            float:left;
            height:100%;
        }
        .leftArea{
            width:70%;
        }
        .rightArea{
            width:30%;
        }
        #sales{
            width:450px;
            height:300px;
            margin:120px 0px 0px 100px;
        }
        #memberCount{
            width:450px;
            height:300px;
            margin:120px 0px 0px 50px;
        }
        #inquire{
            width:950px;
            height:400px;
            overflow-y: scroll;
            margin:50px 0px 0px 100px;
        }
        #memberArea{
        	margin-top:120px;
            height:750px;
            width:100%;
        }
        /* 문의사항 */
        #listHeader>div, .qnaList>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #qnaSeqHeader, .qnaSeq, #emailHeader {
        	width : 15%;
     		margin-left:30px;
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
        	height : 30px;
            line-height:30px;
        	font-size:12px;
        	background-color:#01B9FF;
        }
        #listHeader>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        }
        #qnaList{
        	margin-top:5px;
        }
        .qnaTitle>a{
            color:black;
            font-weight: bold;
        }
        .qnaList div{
            font-size:10px;
        }
        .islandTitle{
            height:45px;
            line-heifht:45px;
            font-size:25px;
            font-weight:bold;
            margin-left:10px;
            display:inline-block;
        }
        .islandTitle>a:hover{
        	cursor:pointer;
        	color:#ff0505;
        }
        /* 회원 */
                #listHeader2>div, .member>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #nameHeader, .name {
        	width : 15%;
        	margin-left:20px;
        }
        #nickHeader, .nickname {
        	width : 20%;
        	margin-left:20px;
        }
        #membershipHeader, .membership {
        	width : 10%;
        	margin-left:20px;
        }
        #scribeHeader, .scribeDate {
        	width : 15%;
        	margin-left:20px;
        }
        #joinHeader, .joinDate {
        	width : 15%;
        	margin-left:20px;
        }
        .member, #listHeader2 {
        	height : 30px;
        	font-size:12px;
        }
        .member{
        	overflow-y:scroll;
        }
        #listHeader2{
        	height : 30px;
            line-height:30px;
        	font-size:15px;
        	background-color:#01B9FF;
        }
        #listHeader2>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        }
        #memberList::-webkit-scrollbar{
        	display:block;
        }
        #memberList{
        	margin-top:10px;
        	overflow-y:scroll;
        }
        #listHr{
        	margin:5px 0px 5px 0px;
        }
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
    <div class="mainContents">
        <div class="leftArea">
            <div id="graph">
                <div class="mainIsland" id="sales">매출액</div>
                <div class="mainIsland" id="memberCount">회원 수</div>
            </div>
            <div id="qnaArea">
                <div class="mainIsland" id="inquire">
                <div class="islandTitle"><a href="/adminList.board?cpage=1">문의내역</a></div>
                    <div id="listHeader">
                        <div id="qnaSeqHeader">문의 번호</div>
                        <div id="qnaCategoryHeader">문의 유형</div>
                        <div id="qnaTitleHeader">제목</div>
                        <div id="qnaWriterHeader">작성자</div>
                        <div id="qnaWriteDateHeader">문의 날짜</div>
                    </div>
                    <div id="qnaList">
                        <c:choose>
                            <c:when test="${not empty qnaList }">
                                <c:forEach var="i" items="${qnaList }">
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
            </div>
        </div>

        <div class="rightArea">
            <div class="mainIsland" id="memberArea">
            	<div class="islandTitle"><a href="/list.member?cpage=1">회원목록</a></div>
          	        <div id="listHeader2">
                      	<div id="nameHeader">이름</div>
                      	<div id="nickHeader">닉네임</div>
                      	<div id="membershipHeader">멤버십등급</div>
                      	<div id="scribeHeader">구독일</div>
                      	<div id="joinHeader">가입일</div>
                      </div>
                      <div id="memberList">
                      	<c:choose>
                      		<c:when test="${not empty memberList}">
                      			<c:forEach var="i" items="${memberList }">
                      				<div class="member">
                      				<input type="hidden" value="${i.scribeDate }" id="dummyDate">
                      					<div class="name">${i.name }</div>
                      					<div class="nickname">${i.nickname }</div>
                      					<div class="membership">${i.membership }</div>
                      					<div class="scribeDate"><fmt:formatDate value="${i.scribeDate }" pattern="yyyy-MM-dd"/></div>
                      					<div class="joinDate"><fmt:formatDate value="${i.joinDate }" pattern="yyyy-MM-dd"/></div>
                      				</div>
                      				<hr id="listHr">
                      			</c:forEach>                        			
                      		</c:when>                        		
                      	</c:choose>
                      </div>  
            </div>
        </div>                                          
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
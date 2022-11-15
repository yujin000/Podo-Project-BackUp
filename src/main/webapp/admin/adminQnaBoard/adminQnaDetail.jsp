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
    <title>문의내역 확인</title>
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
        
        #listHeader>div, .qnaList>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #qnaSeqHeader, .qnaSeq {
        	width : 15%;
        }
        #qnaCategoryHeader, .qnaCategory {
        	width : 10%;
        }
        #qnaTitleHeader, .qnaTitle {
            margin-left:70px;
       		width : 30%;
        }
        #qnaWriterHeader, .qnaWriter {
            margin-left:50px;
        	width : 20%;
        }
        #qnaWriteDateHeader, .qnaWriteDate {
        	width : 15%;
        }

        .qnaList, #listHeader {
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
        .commentWriter, #contentsTitle{
        	font-weight:bold;
        }
        .commentContents, #contentsMain{
        	width : 1200px;
        }
        .commentList{
            margin-left:100px;
        }
        #qnaContents{
            margin-left:100px;
        }
        #comments{
            margin-left:100px;
            position:absolute;
            bottom:40px;
        }
        #comment{
            width:1200px;
            height:100px;
            resize: none;
        }
        #sectionHr{
            width:1350px;
            margin-left:100px;
        }
        #commentBtn{
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
            right:10px;
            bottom:45px;
            text-align:center;
        }
        #commentBtn:hover{
        	cursor:pointer;
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
                <div class="mainText">문의내역 확인</div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<div id="listHeader">
                        	<div id="qnaSeqHeader">문의 번호</div>
                        	<div id="qnaCategoryHeader">문의 유형</div>
                        	<div id="qnaTitleHeader">제목</div>
                        	<div id="qnaWriterHeader">작성자</div>
                        	<div id="qnaWriteDateHeader">문의 날짜</div>
                        </div>
                        <div id="qnaList">
                            <div class="qnaList">
                                <div class="qnaSeq">${qnaBoard.qnaSeq }</div>
                                <div class="qnaCategory">${qnaBoard.qnaCategory }</div>
                                <div class="qnaTitle">${qnaBoard.qnaTitle }</div>
                                <div class="qnaWriter">${qnaBoard.qnaWriter }</div>                                
                                <div class="qnaWriteDate">${qnaBoard.qnaWriteDate }</div>
                            </div>
                            <hr id="listHr">
                        </div>
                        <div id="qnaContents">
                            <div>
                                첨부파일 : <a href="/download.file?sysname=${boardFile.sysName }&oriname=${boardFile.oriName}">${boardFile.oriName }</a> 
                           </div>  
                            <div id="contentsMain">
                            ${qnaBoard.qnaContents }
                            </div>       		
                        </div> 
                        
                        <br>
                        <br>
                        <hr id="sectionHr">
                        <c:choose>
                            <c:when test= "${not empty commentList }">
                                <c:forEach var="i" items = "${commentList }">
                                <div class="commentList">
                                    <div>답변<br></div>
                                    <div class="commentWriter">${i.qnaCommentWriter } 님의 답변</div>
                                    <div class="commentWriteDate">작성시간 : <fmt:formatDate value="${i.qnaCommentWriteDate }" pattern="yyyy-MM-dd hh:mm"/></div><br>
                                    <div class="commentContents">${i.qnaCommentContents }</div>
                                </div>            				
                                </c:forEach>
                            </c:when>
                        <c:otherwise>
                            <div style="margin-left:100px;">아직 답변이 없습니다.</div>
                        </c:otherwise>
                        </c:choose>
            	
                        <form action="/write.qnaC" id="form">
                            <c:if test="${count eq '0' }">
                                <div id="comments">
                                    <div>답변하기</div>
                                    <textarea id="comment" name="comment"></textarea>
                                    <input type="hidden" value="${qnaBoard.qnaSeq }" name="qnaSeq">
                                </div>
                                <button type="button" id="commentBtn">댓글쓰기</button>
                            </c:if>
                        </form>  
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
      
      // 댓글쓰기
      $("#commentBtn").on("click", function(){
    	  if ($("#comment").val().length>200) {
    		  alert("200자 이하로 작성해주세요.");
    	  } else {
    		  $("#form").submit();
    	  }
      });




    </script>
</body>

</html>
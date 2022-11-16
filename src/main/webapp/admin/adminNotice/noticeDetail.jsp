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
        #noticeSeqHeader, .noticeSeq {
            margin-left:40px;
        	width : 15%;
        }
        #noticeCategoryHeader, .noticeCategory {
        	width : 10%;
        }
        #noticeTitleHeader, .noticeTitle {
       		width : 30%;
        }
        #noticeWriterHeader, .noticeWriter {
        	width : 20%;
        }
        #noticeWriteDateHeader, .noticeWriteDate {
        	width : 15%;
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
        .noticeTitle>a{
            color:black;
            font-weight: bold;
        }        
        /*기본*/
        .commentWriter, #contentsTitle{
        	font-weight:bold;
        }
        .commentContents, #contentsMain{
        	border:1px solid black;
        	width : 1000px;
        	height : 150px;
        }
        #contentsMain{
            width:1400px;
            height:500px;
            margin:auto;
            border:none;
            word-break:normal;
        	word-break:break-all;
        	white-space: pre-wrap;
        }
        #del{
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
        #del:hover{
        	cursor:pointer;
        }
        #attFile{
            margin-left:90px;
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
                <div class="mainText">공지사항 보기</div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<div id="listHeader">
                        	<div id="noticeSeqHeader">공지사항 번호</div>
                        	<div id="noticeCategoryHeader">공지사항 유형</div>
                        	<div id="noticeTitleHeader">제목</div>
                        	<div id="noticeWriterHeader">작성자</div>
                        	<div id="noticeWriteDateHeader">작성일</div>
                        </div>
                        <form action="/del.notice" id="form">
                        <div id="qnaList">
                            <div class="qnaList">
                                <div class="noticeSeq">${noticeDetail.noticeSeq }</div>
                                <div class="noticeCategory">${noticeDetail.noticeCategory }</div>
                                <div class="noticeTitle">${noticeDetail.noticeTitle }</div>
                                <div class="noticeWriter">${noticeDetail.noticeWriter }</div>                                
                                <div class="noticeWriteDate"><fmt:formatDate value="${noticeDetail.noticeWriteDate }" pattern="yyyy-MM-dd"/></div>
                                <input type="hidden" name="noticeSeq" value="${noticeDetail.noticeSeq }">
                                <input type="hidden" name="sysName" value="${noticeDetailFile.sysName }">            		
                            </div>
                            <hr id="listHr">
                        </div>
                        </form>
                        <div>
                            <div id="contentsMain">
                            ${noticeDetail.noticeContents }
                            </div>
                            <div id="attFile">
                                 첨부파일 : <a href="/download.file?sysname=${noticeDetailFile.sysName }&oriname=${noticeDetailFile.oriName}">${noticeDetailFile.oriName }</a></div>
                            </div>            		
                        </div> 
                        <c:choose>
                            <c:when test="${loginMembership eq 'admin' }">
                            <div id="del">삭제</div>
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
      
      $("#del").on("click", function(){
    	 if (confirm("정말 삭제하시겠습니까?")) {
    		 $("#form").css("action","/del.notice");
    		 $("#form").submit();
    	 } 
      });




    </script>
</body>

</html>
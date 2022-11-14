<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        @import url(src/css/reset.css);
        /* system font */
        @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap");

        /* event font */
        @font-face {
            font-family: "EliceDigitalBaeum-Bd";
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2") format("woff2");
            font-weight: normal;
            font-style: normal;
        }

        :root {
            --font-color: #fff;
            --background-color: #111;
            --sub-background-color: #333;
            --boder-silver: 1px solid silver;
            --main-color: #3e065f;
            --point-color: #ff00d7;
            --font-weight: bold;
            --line-height: 45px;
        }

        * {
            margin: 0;
            padding: 0;
            border: 1px solid #fff;
            text-decoration: none;
            border: none;
        }

         div { 
             border: 1px solid #fff; 
         }

        body {
            width: 100vw;
            background: var(--background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            padding: 0 75px;
            height: 100%;
            width: 100vw;
			background-color: bisque; 
            overflow-y: scroll;
            margin-bottom:200px;
        }
		
		.main {
            height: 100%;
            margin-top: 8vh;
		    background-color: lightgray;
        }
        
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
			background-color: #00000d50;
        }
        
        /*category css*/
        .titleCategory>div>a{
        color: var(--font-color);
        font-weight: var(--font-weight);
        line-height: var(--line-height);
        }
        .titleCategory{
        width:100%;
        height: 59px;
        font-size: 28px;
        /* background-color:#00000d50; */
        text-aline:center;
        }
        
        #notice{
        float:left;
        width:10vw;
        line-height: var(--line-height);
        color: var(--font-color);
        background-color: #00000d80;
        }
        #myInquiry{
        float:left;
        width:15vw;
        line-height: var(--line-height);
        color: var(--font-color);
        background-color: #00000d90;
        }
        
        /*division css*/
        .division {
            width: 100%;
            font-size: 20px;
            height: 35px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        
        #category {
            float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
		#qnaCategory{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
        #history {
            float: left;
            width: 45%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
		#qnaTitle{
			float: left;
            width: 45%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		#writer{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
		}
		#noticeWriter{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
		}
        #date{
            float: left;
            width: 15%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        #qnaWriteDate{
        	float: left;
            width: 15%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
        }
        
        /*list css*/
        .list{
		margin-top: 2vh;
		width: 100%;
		height: 48vh;
		border: 1px solid black;
        }
    </style>
        <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
</head>

<body>
    <div class="container">
        <div class="main">
            <div class="titleText">고객센터</div>
            <div class="titleCategory">
                    <div id="notice"><a href="/listLook.notice?cpage=1">공지사항</a>
                    <hr style="border: solid 5px #3e065f; width: 60%"></div>
                    <div id="myInquiry"><a href="/list.board?cpage=1">내 문의 내역</a></div>
            </div>
            
            <div class="division">
                    <div id="category">유형</div>
                    <div id="history">제목</div>
                    <div id="writer">작성자</div>
                    <div id="date">작성일</div>
            </div>
            
            <div class="list">
				<c:choose>
					<c:when test="${not empty noticeBoardList}">
						<c:forEach var="n" items="${noticeBoardList }">
							<div class="writelist">
								<div id="qnaCategory">${n.noticeCategory }</div>
								<div id="qnaTitle">
									<a href="/detailLook.notice?noticeSeq=${n.noticeSeq }">${n.noticeTitle }</a>
								</div>
								<div id="noticeWriter">${n.noticeWriter }</div>
								<div id="qnaWriteDate">${n.noticeWriteDate }</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         문의가 없습니다
         </c:otherwise>
				</c:choose>
			</div>

			<div>${naviLook }</div>
        </div>
    </div>
</body>

</html>
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
			background-color: bisque; 
            overflow-y: scroll;
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
        .category>div>a{
        color: var(--font-color);
        font-weight: var(--font-weight);
        line-height: var(--line-height);
        }
        .category{
        width:100%;
        height: 59px;
        font-size: 28px;
        background-color:#00000d50;
        text-aline:center;
        }
        #home{
        float:left;
   		width:4vw;
   		line-height: var(--line-height);
        color: var(--font-color);
   		background-color: #00000d50;
        }
        
        
        /*list css*/
        .list{
		margin-top: 2vh;
		width: 100%;
		height: 55vh;
		overflow-y: auto;
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
            <div class="titleText">위시리스트</div>
            <div class="category">
                    <div id="home"><a href="/mypage/wishList.jsp">노래</a>
                    <hr style="border: solid 5px #3e065f; width: 20%"></div>
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
			
        </div>
    </div>
</body>

</html>
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
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        #category {
            float: left;
            width: 30%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }

        #history {
            float: left;
            width: 55%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }

        #date {
            float: left;
            width: 15%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
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
            <div class="titleText">고객센터</div>
            <div class="category">
                    <div id="home"><a href="/mypage/serviceCenter.jsp">홈</a>
                    <hr style="border: solid 5px #3e065f; width: 20%"></div>
                    <div id="notice"><a href="/mypage/notice.jsp">공지사항</a></div>
                    <div id="myInquiry"><a href="/list.board?cpage=1">내 문의 내역</a></div>
            </div>
            
            <div class="division">
                    <div id="category">category</div>
                    <div id="history">title</div>
                    <div id="date">date</div>
            </div>
            
            <div class="list">
            	
            </div>
        </div>
    </div>
</body>

</html>
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

         /* div { 
             border: 1px solid #fff; 
         } */

        body {
            width: 100vw;
            background: var(--background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            padding: 0 75px;
            height: 100%;
/*          	background-color: bisque;  */
            width: 100vw;
    		margin-bottom:200px;
            
        }
      
      .main {
            height: 100%;
            margin-top: 8vh;
          	/* background-color: lightgray; */
        }
        
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
         	/* background-color: #00000d50; */
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
        /* background-color: #00000d80; */
        }
        #myInquiry{
        float:left;
        width:15vw;
        line-height: var(--line-height);
        color: var(--font-color);
        /* background-color: #00000d90; */
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
            width: 30%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
		#qnaCategory{
			float: left;
            width: 30%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
        #history {
            float: left;
            width: 55%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
		#qnaTitle{
			float: left;
            width: 55%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
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
      border: 1px solid transparent;
        }
        
        .writelist{
        width: 100%;
		height: 46px;
		font-size: 18px;
		margin-top:2vh;
		margin-bottom:2vh;
        }

        #writeBtn {
        	float:right;
            width: 8vw;
            height: 35px;
            text-align: center;
            border-radius: 5px;
            font-size: 15px;
            font-weight: var(--font-weight);
            border: 1px solid gray;
            cursor: pointer;
            background: var(--background-color);
            color: var(--font-color)
/*             background-color: #00000d50; */
        }

        #writeBtn:hover {
            border: 1px solid silver;
        }
        
        #navi{
        text-align:center;
        }
        #navi>a{
        color:white;
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
                    <div id="notice"><a href="/listLook.notice?cpage=1">공지사항</a></div>
                    <div id="myInquiry"><a href="/list.board?cpage=1">내 문의 내역</a>
                    <hr style="border: solid 5px #3e065f; width: 58%"></div>
            </div>
            
            <div class="division">
                    <div id="category">문의 유형</div>
                    <div id="history">문의 내역</div>
                    <div id="date">문의일</div>
                </div>

			<div class="list">
				<c:choose>
					<c:when test="${not empty qna}">
						<c:forEach var="q" items="${qna }">
							<div class="writelist">
								<div id="qnaCategory">${q.qnaCategory }</div>
								<div id="qnaTitle">
									<a href="/detail.board?qnaSeq=${q.qnaSeq }">${q.qnaTitle }</a>
								</div>
								<div id="qnaWriteDate">${q.qnaWriteDate }</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         문의가 없습니다
         </c:otherwise>
				</c:choose>
			</div>

			<div id="navi">${navi }</div>
            <div>
              <button type="button" id="writeBtn">문의하기</button>
            </div>
        </div>
    </div>
    
    <script>
    document.getElementById("writeBtn").addEventListener("click", function() {
       location.href = "/mypage/qnaWrite.jsp"
    })
    </script>
</body>

</html>
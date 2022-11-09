<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
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

        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            background-color: #00000d50;
        }

        /*qna css */
        .qna {
            height: 100%;
            margin-top: 8vh;
            background-color: lightgray;
        }

        .qnalist {
            width: 100%;
            height: 65vh;
            margin-top: 5vh;
            background-color: #00000d80;
        }

        #category {
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }

        #title {
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        #contents{
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        
        
        #writeBtn {
            margin-top: 2vh;
            width: 6vw;
            height: 40px;
            text-align: center;
            border-radius: 5px;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border: 1px solid gray;
            cursor: pointer;
            background: var(--background-color);
            color: var(--font-color)
/*             background-color: #00000d50; */
        }

        #writeBtn:hover {
            border: 1px solid silver;
        }
    </style>
</head>

<body>
    <div class="container">
    <form action="/insert.board" id="insertForm" method="post">
        <div class="qna">
            <div class="titleText">1:1 문의</div>
            <div class="qnalist">
            
					<div id="category">
						문의유형
						<input type="text" id="qnaCategory" name="qnaCategory" value="${dtoDetail.qnaCategory }" disabled>

					</div>
					<div id="title">제목
                        ${dtoDetail.qnaTitle }
                    </div>
                    <div id="contents">문의 내용
                        ${dtoDetail.qnaContents }            
                    </div>
            </div>
            
            <div>
                 첨부파일 : <a href="/download.file?sysname=${fileDto.sysName }&oriname=${fileDto.oriName}">${fileDto.oriName }</a> 
            </div>
            
            <div style="float:right;">
              <button type="button" id="writeBtn">작성완료</button>
            </div>
            
        </div>
        </form>
    </div>
    <script>
    document.getElementById("writeBtn").addEventListener("click", function() {
    	document.getElementById("insertForm").submit();
    })
    </script>
</body>
</html>
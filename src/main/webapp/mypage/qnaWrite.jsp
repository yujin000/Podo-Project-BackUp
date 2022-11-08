<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .wrap {
            padding: 0 75px;
            width: 100%;
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
    </style>
</head>

<body>
    <div class="wrap">
        <div class="qna">
            <div class="titleText">1:1 문의</div>
            <div class="qnalist">
                    <div id="category">문의 유형</div>
                    <div id="title">제목
                        <input type="text" placeholder="제목을 입력하세요" name="title" id="title">
                    </div>
                    <div id="contents">문의 내용
                        <textarea placeholder="내용을 입력해주세요" name="contents" 
                        cols="120" rows="13" id="contents"></textarea>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>
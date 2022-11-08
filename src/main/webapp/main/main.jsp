<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      /* 기본 Reset css 셋팅입니다 지우지 마세요 */
      @import url(src/css/reset.css);
      /* system font */
      @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap");
      /* event font */
      @font-face {
        font-family: "EliceDigitalBaeum-Bd";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2")
          format("woff2");
        font-weight: normal;
        font-style: normal;
      }
      :root {
        --font-color: #fff;
        --background-color: #000;
        --sub-background-color: #222;
        --boder-silver: 1px solid silver;
        --main-color: #3e065f;
        --point-color: #ff00d7;
      }
      * {
        margin: 0;
        padding: 0;
      }
      body {
        width: 100vw;
        background: var(--sub-background-color);
        color: var(--font-color);
      }
      .container {
        padding: 0 40px;
        height: 100%;
      }
      footer {
        width: 100%;
        height: 100px;
        border: var(--boder-silver);
        position: absolute;
        text-align: center;
        color: var(--font-color);
      }
      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>main</h1>
      <p>contents</p>
    </div>
    <footer>footer</footer>
  </body>
</html>

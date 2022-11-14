<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <style>
      /* 기본 Reset css 셋팅입니다 지우지 마세요 */
      @import url(../src/css/reset.css);
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
        /* border: 1px solid red; */
      }
      body,
      html {
        width: 100%;
        height: 100vmax;
        background: var(--sub-background-color);
        color: var(--font-color);
      }
      .container {
        padding: 0 50px;
        height: 100%;
      }

      header {
        margin-top: 50px;
        width: 100%;
        display: inline-block;
        margin-bottom: 10px;
      }

      header h1 {
        width: 100%;
        display: inline-block;
        font-size: 45px;
        font-family: "EliceDigitalBaeum-Bd";
      }

      h3 {
        width: 100%;
        display: inline-block;
        font-size: 30px;
        margin-bottom: 20px;
      }
      footer {
        width: 100%;
        height: 200px;
        margin-top: 70vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: transparent;
        opacity: 0.5;
        display: block;
      }

      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }

      ul {
        width: 100%;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: start;
        gap: 0 20px;
      }
      li {
        width: 210px;
        height: 210px;
        padding: 15px 0;
        background: #3e065f;
        display: flex;
        margin-bottom: 20px;
        position: relative;
        align-items: center;
        text-align: center;
      }

      li a.playBtn {
        width: 50px;
        height: 50px;
        position: absolute;
        top: 70%;
        left: 5%;
        opacity: 0;
        transition: all 0.5s;
        /* 서서히 나타내는 효과 */
      }

      .playBtn:hover {
        opacity: 1;
      }
      li .material-symbols-outlined {
        font-size: 50px;
        color: white;
        display: inline-block;
      }
      li p {
        display: block;
        color: #fff;
        font-size: 1.8rem;
        margin: 0 auto;
        font-family: "EliceDigitalBaeum-Bd";
      }

      li div {
        width: 100%;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <header>
        <h1>스테이션</h1>
      </header>
      <div class="contents">
        <h3>장르 스테이션</h3>
        <ul>
          <li
            style="
              background-image: url('../image/web/genre_1.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_2.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_3.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_4.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_5.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_6.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/genre_7.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
        </ul>
      </div>
      <div class="contents">
        <h3>무드 스테이션</h3>
        <ul>
          <li
            style="
              background-image: url('../image/web/mood_1.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_2.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_3.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_4.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_5.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_6.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_7.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_8.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_9.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_10.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_11.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_12.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_13.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
          <li
            style="
              background-image: url('../image/web/mood_14.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
          </li>
        </ul>
      </div>
         <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    </div>

 
    <script type="text/javascript">
      let playBtn = document.getElementById("playBtn");
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      }
      body {
        width: 100vw;
        background: var(--sub-background-color);
        color: var(--font-color);
      }
      .container {
        width: 100%;
        padding: 0 80px;
        height: 100%;
        display: block;
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
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: transparent;
        opacity: 0.5;
      }

      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }

      ul {
        width: 1526px;
        margin-top: 30px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 0 20px;
      }
      li {
        width: 280px;
        margin-bottom: 20px;
        position: relative;
        align-items: center;
      }

      li a.playBtn {
        width: 50px;
        height: 50px;
        position: absolute;
        top: 56%;
        left: 2%;
        opacity: 0;
        transition: all 0.5s;
        /* 서서히 나타내는 효과 */
      }

      .playBtn:hover {
        opacity: 1;
      }
      li .material-symbols-outlined {
        font-size: 70px;
        color: white;
        display: inline-block;
      }
      li p {
        display: block;
        color: #fff;
        font-size: 1.8rem;
        margin: 0 auto;
      }

      li div {
        width: 100%;
      }

      .banner {
        width: 1526px;
        height: 360px;
        text-align: center;
        display: flex;
        justify-content: start;
      }

      .banner img:nth-child(1) {
        width: 32%;
        display: inline-block;
      }
      .banner img:nth-child(2) {
        width: 68%;
        display: inline-block;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <header>
        <h1>매거진</h1>
      </header>
      <div class="banner">
        <img src="../image/web/main_cover_1.png" alt="" />
        <img src="../image/web/main_cover_2.png" alt="" />
      </div>
      <div class="contents">
        <ul>
          <li>
            <img src="../image/web/cover-1.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-2.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-3.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-4.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-5.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-6.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-7.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-8.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-9.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
          <li>
            <img src="../image/web/cover-10.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span
              >Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi
              rerum optio nihil ullam quos ducimus totam sunt autem earum.
              Reprehenderit
            </span>
          </li>
        </ul>
      </div>
    </div>

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    <script type="text/javascript">
      let playBtn = document.getElementById("playBtn");
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
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

      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }

      h3 {
        width: 100%;
        display: inline-block;
        font-size: 30px;
        margin-top: 10px;
        margin-bottom: 10px;
        font-family: "EliceDigitalBaeum-Bd";
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

      .container {
        width: 100%;
        padding: 0 80px;
        height: 100%;
        margin-top: 50px;
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

      ul#mag-list {
        width: 1525px;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
        gap: 0 20px;
      }
      #mag-list > li {
        width: 200px;
        margin-bottom: 20px;
        position: relative;
        align-items: center;
      }

      .playBtn {
        position: absolute;
        width: 200px;
        height: 200px;
        left: 0;
        opacity: 0;
        transition: all 0.5s;
        /* 서서히 나타내는 효과 */
      }

      .playBtn:hover {
        opacity: 1;
      }
      .material-symbols-outlined {
        width: 100%;
        font-size: 4rem;
        color: white;
        line-height: 200px;
        text-align: center;
        display: inline-block;
      }
      #mag-list li p {
        display: block;
        color: #fff;
        font-size: 1.8rem;
        margin: 0 auto;
      }

      #mag-list li div {
        width: 100%;
      }
      #station-list {
        width: 1525px;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
        gap: 0 20px;
      }

      #station-list li {
        width: 200px;
        height: 200px;
        padding: 15px 0;
        display: flex;
        margin-bottom: 20px;
        position: relative;
        align-items: center;
        text-align: center;
      }

      #station-list > li .st-playBtn {
        position: absolute;
        width: 200px;
        height: 200px;
        opacity: 0;
        transition: all 0.5s;
      }
      #station-list > li .st-playBtn:hover {
        opacity: 1;
      }
      .st-playBtn > .material-symbols-outlined {
        width: 100%;
        font-size: 4rem;
        color: white;
        line-height: 200px;
        display: inline-block;
      }

      #chart-list {
        width: 100%;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 0 10px;
      }

      #chart-list > li {
        width: 32.5%;
        min-width: 300px;
        height: 80px;
        padding: 15px 0;
        display: flex;
        margin-bottom: 10px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.3);
      }

      #chart-list > li img {
        width: 50px;
        display: inline-block;
      }

      #chart-list > li p {
        width: 100%;
        max-width: 650px;
        padding-left: 10px;
        display: block;
      }

      #chart-list > li p.artist {
        margin-top: 5px;
        font-size: 12px;
        color: #999;
      }
      #chart-list > li div {
        width: 100%;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <!-- banner -->
      <div class="banner">
        <img src="../image/web/main_cover_1.png" alt="" />
        <img src="../image/web/main_cover_2.png" alt="" />
      </div>
      <!-- mag -->
      <div class="contents">
        <h3>매거진</h3>
        <ul id="mag-list">
          <li>
            <img src="../image/web/cover-1.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-2.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-3.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-4.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-5.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-6.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
          <li>
            <img src="../image/web/cover-7.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>title</p>
            <span>Lorem ipsum dolor ist amet consectetur </span>
          </li>
        </ul>
      </div>
      <div class="contents">
        <h3>스테이션</h3>

        <ul id="station-list">
          <li
            style="
              background-image: url('../image/web/mood_1.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_2.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_3.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_4.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_5.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_6.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
          <li
            style="
              background-image: url('../image/web/mood_7.png');
              background-repeat: no-repeat;
              background-size: cover;
            "
          >
            <a href="" class="st-playBtn"
              ><span class="material-symbols-outlined">play_circle</span></a
            >
          </li>
        </ul>
      </div>
      <div class="contents">
        <h3>차트</h3>
        <ul id="chart-list">
          <c:choose>
            <c:when test="${not empty mainList}">
              <c:forEach var="i" items="${mainList}">
                <li>
                  <a href="" id="selectChart">
                    <img src="/image/music/${i.musicImg}.jpg" alt="" />
                  </a>
                  <div>
                    <p>${i.musicSeq}&nbsp; ${i.musicName}</p>
                    <p class="artist">
                      &nbsp;&nbsp;&nbsp;&nbsp; ${i.musicArtist}
                    </p>
                  </div>
                </li>
              </c:forEach>
            </c:when>
            <c:otherwise> error! </c:otherwise>
          </c:choose>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2") format("woff2");
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

    .wrap {
      padding: 0 40px;
      width: 100%;
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
      display: none;
      /* Chrome, Safari, Opera*/
    }

    .logoName {
      font-weight: bold;
    }

    .contents {
      max-width: 1610px;
      min-width: 1610px;
      position: relative;
      height: 100%;
      margin: 20px;
    }

    .contentsTitle {
      display: flex;
      text-align: center;
      margin-top: 30px;
      max-width: 1610px;
      min-width: 1610px;
      flex-wrap: wrap;
      justify-content: left;
      gap: 0px 15px;
    }


    .perform {
      margin: 0 0 40px 0;
    }

    .header {
      margin-top: 30px;
    }

    a {
      text-decoration: none;
    }

    .nameTop {
      display: flex;
      align-items: center;
      justify-content: space-around;
      margin: 30px 0px 30px 0px;
      height: 80px;
      width: 1574px;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-bottom: 1px solid rgba(255, 255, 255, 0.5);
      font-size: 20px;
    }

    .listimg {
      display: flex;
    }

    .imgset {
      margin-right: 20px;
    }

    .listset {
      width: 595px;
    }

    .listset1 {
      width: 185px;
    }

    .flexli {
      display: flex;
      align-items: center;
    }

    .saleText {
      width: 65px;
      text-align: center;
      border: 1px solid rgba(255, 0, 215);
      /* color: #ff00d7; */
    }
  </style>
</head>

<body>
  <div class="wrap">
    <div class="header">
      <h1 class="logoName"><img src="src/lmage/logo-f-b.png" alt="">
        티켓</h1>
    </div>
    <div class="contents">
      <h1>공연</h1>

      <div class="contentsTitle">
        <a href="" style="color: var(--font-color);">
          <div class="imgTop">
            <img src="src/lmage/testPoster.jpg" style="width: 308px; height: 420px;">
            <p>뮤지컬 웨스트 사이드 스토어</p>
            <p style="color: lightgray;">멜론티켓 단독 NFT 증정</p>
          </div>
        </a>

        <a href="" style="color: var(--font-color);">
          <div class="imgTop">
            <img src="src/lmage/perform/mammoo.jfif" style="width: 308px; height: 420px;">
            <p>뮤지컬 웨스트 사이드 스토어</p>
            <p style="color: lightgray;">멜론티켓 단독 NFT 증정</p>
          </div>
        </a>

        <a href="" style="color: var(--font-color);">
          <div class="imgTop">
            <img src="src/lmage/testPoster.jpg" style="width: 308px; height: 420px;">
            <p>뮤지컬 웨스트 사이드 스토어</p>
            <p style="color: lightgray;">멜론티켓 단독 NFT 증정</p>
          </div>
        </a>

        <a href="" style="color: var(--font-color);">
          <div class="imgTop">
            <img src="src/lmage/testPoster.jpg" style="width: 308px; height: 420px;">
            <p>뮤지컬 웨스트 사이드 스토어</p>
            <p style="color: lightgray;">멜론티켓 단독 NFT 증정</p>
          </div>
        </a>
        <a href="" style="color: var(--font-color);">
          <div class="imgTop">
            <img src="src/lmage/testPoster.jpg" style="width: 280px; height: 420px;">
            <p>뮤지컬 웨스트 사이드 스토어</p>
            <p style="color: lightgray;">멜론티켓 단독 NFT 증정</p>
          </div>
        </a>
      </div>
      <div class="nameTop">
        <div style="width: 10px;">

        </div>
        <div class="nametitle">
          공연명
        </div>
        <div style="width: 10px;">

        </div>
        <div class="nametitle">
          공연일시
        </div>
        <div class="nametitle">
          공연장소
        </div>
      </div>
      <div class="perform1">

        <div class="perform">
          <ul class="listimg">
            <li><img src="src/lmage/testPoster.jpg" style="width: 130px; height: 180px;" class="imgset"></li>
            <li style="margin: 20px 0 0 0;">
              <div class="saleText">판매중</div><br>
              뮤지컬 〈웨스트 사이드 스토리〉
            </li>
            <li class="listset">
            </li>
            <li class="flexli">
              2022.11.17 - 2023.02.26
            </li>
            <li class="listset1">
            </li>
            <li class="flexli">
              충무아트센터 대극장
            </li>
          </ul>
        </div>

        <div class="perform">
          <ul class="listimg">
            <li><img src="src/lmage/testPoster.jpg" style="width: 130px; height: 180px;" class="imgset"></li>
            <li style="margin: 20px 0 0 0;">
              <div class="saleText">판매중</div><br>
              뮤지컬 〈웨스트 사이드 스토리〉
            </li>
            <li class="listset">
            </li>
            <li class="flexli">
              2022.11.17 - 2023.02.26
            </li>
            <li class="listset1">
            </li>
            <li class="flexli">
              충무아트센터 대극장
            </li>
          </ul>
        </div>

        <div class="perform">
          <ul class="listimg">
            <li><img src="src/lmage/testPoster.jpg" style="width: 130px; height: 180px;" class="imgset"></li>
            <li style="margin: 20px 0 0 0;">
              <div class="saleText">판매중</div><br>
              뮤지컬 〈웨스트 사이드 스토리〉
            </li>
            <li class="listset">
            </li>
            <li class="flexli">
              2022.11.17 - 2023.02.26
            </li>
            <li class="listset1">
            </li>
            <li class="flexli">
              충무아트센터 대극장
            </li>
          </ul>
        </div>

        <div class="perform">
          <ul class="listimg">
            <li><img src="src/lmage/testPoster.jpg" style="width: 130px; height: 180px;" class="imgset"></li>
            <li style="margin: 20px 0 0 0;">
              <div class="saleText">판매중</div><br>
              뮤지컬 〈웨스트 사이드 스토리〉
            </li>
            <li class="listset">
            </li>
            <li class="flexli">
              2022.11.17 - 2023.02.26
            </li>
            <li class="listset1">
            </li>
            <li class="flexli">
              충무아트센터 대극장
            </li>
          </ul>
        </div>

        <div class="perform">
          <ul class="listimg">
            <li><img src="src/lmage/testPoster.jpg" style="width: 130px; height: 180px;" class="imgset"></li>
            <li style="margin: 20px 0 0 0;">
              <div class="saleText">판매중</div><br>
              뮤지컬 〈웨스트 사이드 스토리〉
            </li>
            <li class="listset">
            </li>
            <li class="flexli">
              2022.11.17 - 2023.02.26
            </li>
            <li class="listset1">
            </li>
            <li class="flexli">
              충무아트센터 대극장
            </li>
          </ul>
        </div>

      </div>
    </div>
  </div>
  <footer>footer</footer>
</body>

</html>
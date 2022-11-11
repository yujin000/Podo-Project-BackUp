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
        --background-color: #111;
        --sub-background-color: #333;
        --boder-silver: 1px solid silver;
        --main-color: #3e065f;
        --point-color: #ff00d7;
      }
      * {
        margin: 0;
        padding: 0;
        /* border: 1px solid #fff; */
        text-decoration: none;
        border: none;
      }
      body {
        width: 100vw;
        background: var(--background-color);
        color: var(--font-color);
        font-family: "Noto Sans KR", sans-serif;
      }
      .wrap {
        margin-top: 25vh;
        padding: 0 40px;
        width: 100%;
        height: 100%;
        text-align: center;
      }

      .wrap h1 {
        text-align: center;
        margin-bottom: 20px;
        opacity: 1;
      }

      .wrap form {
        width: 100%;
        text-align: center;
      }

      .wrap a {
        display: inline-block;
        margin-top: 10px;
        color: silver;
        font-size: 0.8rem;
      }

      form input {
        width: 250px;
        height: 50px;
        display: block;
        margin: 0 auto;
        margin-bottom: 10px;
        border-radius: 4px;
        border: var(--boder-silver);
        background-color: transparent;
        color: silver;
        padding: 10px;
      }

      form button {
        width: 250px;
        height: 50px;
        margin-top: 5px;
        background: var(--main-color);
        border-radius: 4px;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        cursor: pointer;
      }

      form button:hover {
        opacity: 0.7;
      }
      footer {
        width: 100%;
        height: 100px;
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: #000;
        opacity: 0.5;
      }
      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <h1 id="logo">
        <a href="../home.jsp"><img src="../image/web/logo-f-5.png" alt="" /></a>
      </h1>
      <form action="/login.member" method="post">
        <input type="text" name="email" placeholder="email" />
        <input type="text" name="pw" placeholder="password" />
        <button type="submit" id="loginBtn">로그인</button>
      </form>
      <a href="inputForm.jsp">회원가입</a>
      <a href="find.jsp">&nbsp;| &nbsp;비밀번호 찾기</a>
    </div>
    <!-- <footer>
      포도뮤직(주) 대표이사 : 조성태 사업자등록번호 : 220-81-99999
      통신판매업신고번호 : 제2006-경기성남-9999호 주소 : 서울 중구 남대문로 120
      대일빌딩 2층,3층 대표전화 : 1155-9999 이메일 : xorrn93@gmail.com 호스팅
      서비스 제공 : AWS 개인정보처리방침 PODO 이용약관 고객센터 결제/환불안내
      상담 © PODO Music Corp.
    </footer> -->

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
  </body>
</html>

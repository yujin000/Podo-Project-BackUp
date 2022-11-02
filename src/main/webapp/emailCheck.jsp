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
        width: 250px;
        margin: 0 auto;
        text-align: center;
        display: block;
      }

      .wrap a {
        display: inline-block;
        margin-top: 10px;
        color: silver;
        font-size: 0.8rem;
      }

      form p {
        text-align: left;
        margin-bottom: 10px;
        margin-left: 5px;
        font-size: 14px;
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
        margin-bottom: 10px;
      }
      #submitNumber {
        width: 250px;
        height: 50px;
        margin-top: 5px;
        background: var(--sub-background-color);
        border-radius: 4px;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        cursor: pointer;
        margin-bottom: 10px;
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
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="wrap">
      <h1>이메일 인증</h1>
      <form action="" method="post">
        <p>이메일</p>
        <input type="text" name="id" placeholder="email" id="email" />
        <p id="msg"></p>
        <button type="button" id="submitNumber">인증번호 전송</button>
        <p>인증번호</p>
        <input type="text" name="password" id="number" placeholder="인증번호" />
        <button type="button" id="numberCheck">확인</button>
        <p id="msg"></p>
      </form>
    </div>
    <script>
      var emailRegex =
        /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      var number = "0102";
      $("#email").keyup(function () {
        let result = emailRegex.test($(this).val());
        if ($(this).val() == "") {
          $(this).val("");
        } else if (!result) {
          $(this)
            .next("#msg")
            .css("color", "#888")
            .text("올바른 이메일 형식을 입력해주세요!");
        } else {
          $(this).next("#msg").text("");
        }
      });

      $("#email").change(function () {
        let result = emailRegex.test($(this).val());
        if (!result) {
          $(this).val("");
        } else {
        }
      });

      $("#submitNumber").click(function () {
        let email = $("#email").val();
        alert("인증번호 : " + number);
      });

      $("#numberCheck").click(function () {
        let result = $("#number").val() == number;
        if ($("#number").val() == "") {
          $("#number").val("");
        } else if (!result) {
          $(this)
            .next("#msg")
            .css("color", "#888")
            .text("인증번호가 틀립니다.");
          $("#number").val("");
        } else {
          alert("인증번호 일치!");
          window.close();
        }
      });
    </script>
  </body>
</html>

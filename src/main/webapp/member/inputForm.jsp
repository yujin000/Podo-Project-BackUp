<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
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
        --border-silver: 1px solid silver;
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
        margin-top: 5vh;
        padding: 0 40px;
        width: 100%;
        height: 100%;
        text-align: center;
      }

      .wrap h1 {
        text-align: center;
        margin-bottom: 20px;
      }

      .wrap form {
        width: 350px;
        margin: 0 auto;
        text-align: center;
        display: block;
      }

      form p {
        text-align: left;
        margin-bottom: 10px;
        margin-left: 5px;
        font-size: 14px;
      }

      form input {
        width: 350px;
        height: 50px;
        display: block;
        margin: 0 auto;
        margin-bottom: 10px;
        border-radius: 4px;
        color: silver;
        padding: 10px;
        border: var(--border-silver);
        background-color: transparent;
      }

      button#emailSendBtn {
        width: 170px;
        height: 50px;
        background: var(--main-color);
        border-radius: 4px;
        border: none;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        margin-right: 0px;
      }
      form button#inputSubmit {
        width: 350px;
        height: 50px;
        margin-top: 10px;
        background: var(--main-color);
        border-radius: 4px;
        border: none;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
      }

      form button#numberCheck {
        width: 350px;
        height: 50px;
        background: var(--main-color);
        border-radius: 4px;
        border: none;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
      }

      form button#inputSubmit:hover {
        opacity: 0.7;
      }

      form button {
        width: 170px;
        height: 50px;
        background-color: var(--sub-background-color);
        border-radius: 4px;
        margin-bottom: 10px;
        margin-right: 5px;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        cursor: pointer;
      }

      form button:hover {
        background: var(--sub-background-color);
      }
      footer {
        width: 100%;
        height: 100px;
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: var(--background-color);
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
      <h1 id="logo">
        <a href="../home.jsp"><img src="../image/web/logo-f-5.png" alt="" /></a>
      </h1>
      <form action="" method="post">
        <p>이메일</p>
        <input
          type="text"
          name="email"
          id="email"
          placeholder="exam@gamil.com"
        />
        <p id="msg"></p>
        <button type="button" id="dupleCheck">중복확인</button>
        <button id="emailSendBtn" type="button">인증번호 전송</button>
        <p>인증번호 입력</p>
        <input type="hidden" value="" id="message" name="message" />
        <input type="text" name="password" id="number" placeholder="인증번호" />
        <p id="msg"></p>
        <button type="button" id="numberCheck">확인</button>
        <p>비밀번호</p>
        <input type="text" name="pw" id="pw" placeholder="최소 7자~최대20자" />
        <p id="msg"></p>
        <p>비밀번호 재확인</p>
        <input type="text" id="pwCheck" />
        <p id="msg"></p>
        <p>닉네임</p>
        <input type="text" name="nickname" id="nickname" placeholder="10자" />
        <p id="msg"></p>
        <p>이름</p>
        <input type="text" name="name" id="name" placeholder="5글자" />
        <p id="msg"></p>
        <p>전화번호</p>
        <input type="text" name="phone" id="phone" placeholder="01012345678" />
        <p id="msg"></p>
        <button type="button" id="inputSubmit">회원가입</button>
      </form>
    </div>

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    <!-- 유효성 검사 -->
    <script>
      window.onload = function () {
        var emailRegex =
          /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        var pwRegex = /^([A-Za-z\d\!|\@|\#|\$|\%]){7,20}$/;
        var nameRegex = /^[가-힣]{1,5}$/;
        var nicknameRegex = /^[가-힣a-zA-z\d]{1,10}$/;
        var phoneRegex = /(\d{3}).*(\d{3}).*(\d{4})/;

        var dupleResult = false;
        var numberResult = false;

        $("#inputSubmit").click(function () {
          if (
            numberResult == true &&
            dupleResult == true &&
            $('input[type="text"]').val() != ""
          ) {
            alert("회원가입을 축하드립니다.");
            location.href = "/signup.member?email";
          } else if (numberResult == false) {
            alert("이메일 인증을 완료해주세요!");
          } else if (dupleResult == false) {
            alert("중복확인을 완료해주세요!");
          } else {
            alert("작성란에 빈 값이 존재합니다");
          }
        });

        $("#dupleCheck").click(function () {
          if ($("#email").val() == "") {
            $("#email")
              .next("#msg")
              .html("작성란이 비어있습니다. ")
              .css("color", "red");
          } else {
            $.ajax({
              url: "/emailDupleCheck.member",
              type: "post",
              data: {
                email: $("#email").val(),
              },
              success: function (res) {
                if (res == "true") {
                  $("#email").val("");
                  $("#result").html("중복된 ID입니다. ").css("color", "red");
                } else {
                  $("#email")
                    .next("#msg")
                    .html("사용가능한 ID입니다.")
                    .css("color", "white");
                  dupleResult = true;
                  $("#email").keyup(function () {
                    $("#email")
                      .next("#msg")
                      .html("값이 바뀌었습니다. 중복확인을 다시 진행주세요!")
                      .css("color", "red");

                    dupleResult = false;
                  });
                }
              },
              error: function () {
                alert("요청실패");
              },
            });
          }
        });
        $("#emailSendBtn").click(function () {
          if (
            $("#email").next("#msg").text() == "사용가능한 ID입니다." &&
            $("#email").val() != "" &&
            dupleResult == true
          ) {
            $("#email")
              .next("#msg")
              .css("color", "white")
              .text("인증번호 전송중 ..");
            $("#emailSendBtn").text("재전송");
            $.ajax({
              url: "/MailSender.member",
              type: "post",
              data: {
                email: $("#email").val(),
              },
              success: function (res) {
                if (res == null) {
                  alert("요청 실패");
                } else {
                  $("#email")
                    .next("#msg")
                    .css("color", "white")
                    .text("인증번호 전송완료!");
                }
              },
            }).done(function (resp) {
              let result = JSON.parse(resp);
              $("#message").val(result);
            });
          } else {
            $("#email")
              .next("#msg")
              .css("color", "red")
              .text("중복확인 을 먼저 수행해주세요!");
          }
        });

        $("#numberCheck").click(function () {
          let result = $("#number").val() == $("#message").val();
          if ($("#number").val() == "") {
            $("#number").val("");
          } else if (!result) {
            $("#number")
              .next("#msg")
              .css("color", "red")
              .text("인증번호가 틀립니다.");
            $("#number").val("");
          } else {
            $("#number")
              .next("#msg")
              .css("color", "white")
              .text("인증번호가 일치합니다.");

            numberResult = true;
            $("#number").prop("readonly", true);
          }
        });

        $("#email").keyup(function () {
          let result = emailRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("올바른 이메일 형식을 입력해주세요 ");
          } else {
          }
        });

        $("#email").change(function () {
          let result = emailRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        $("#pw").keyup(function () {
          let result = pwRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("대문자, 소문자, 숫자, !@#$% 만 사용 가능합니다. ");
          } else {
            $(this).next("#msg").text("");
          }
        });

        $("#pw").change(function () {
          let result = pwRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        $("#pwCheck").keyup(function () {
          let result = $(this).val() === $("#pw").val();
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("비밀번호가 같지 않습니다!");
          } else {
            $(this).next("#msg").text("");
          }
        });

        $("#pwCheck").change(function () {
          let result = $(this).val() === $("#pw").val();
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        $("#nickname").keyup(function () {
          let result = nicknameRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("한글,영문,숫자 10자 만 사용 가능 합니다 ");
          } else {
            $(this).next("#msg").text("");
          }
        });

        $("#nickname").change(function () {
          let result = nicknameRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        $("#name").keyup(function () {
          let result = nameRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("한글 5자 만 사용 가능 합니다 ");
          } else {
            $(this).next("#msg").text("");
          }
        });

        $("#name").change(function () {
          let result = nameRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        $("#phone").keyup(function () {
          let result = phoneRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("올바른 전화번호 형식을 입력해주세요");
          } else {
            $(this).next("#msg").text("");
          }
        });

        $("#phone").change(function () {
          let result = phoneRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });
      };
    </script>
  </body>
</html>

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

      button#emailCheck {
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
    <% String email = request.getParameter("email"); if(email == null){ /* email
    = ""; */ } %>

    <div class="wrap">
      <h1 id="logo">
        <a href="../home.jsp"
          ><img src="../image/web/logo-f-5.png" alt=""
        /></a>
      </h1>
      <form action="/signup.member" method="post">
        <p>이메일</p>
        <input
          type="text"
          name="email"
          id="email"
          placeholder="exam@gamil.com"
        />
        <p id="result"></p>
        <button type="button" id="DupleCheck" onclick="emailDupleCheck()">
          중복확인
        </button>
        <button id="emailCheck" type="button">이메일 인증</button>
        <p id="msg"></p>
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
        <button type="submit" id="inputSubmit">회원가입</button>
      </form>
    </div>

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    <!-- 유효성 검사 -->
    <script>
      var emailRegex =
        /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      var pwRegex = /^([A-Za-z\d\!|\@|\#|\$|\%]){7,20}$/;
      var nameRegex = /^[가-힣]{1,5}$/;
      var nicknameRegex = /^[가-힣a-zA-z\d]{1,10}$/;
      var phoneRegex = /(\d{3}).*(\d{3}).*(\d{4})/;
      
      var result = false;

      $("#emailCheck").click(function () {
        if (
          $("#result").text() == "사용가능한 ID입니다. " &&
          $("#email").val() != "" && result == true
        ) {
          window.open(
            "emailCheck.jsp?email=" + $("#email").val(),
            "이메일인증",
            "width=700px,height=700px"
          );
        } else {
          $("#result")
            .html("중복확인 을 먼저 수행해주세요!")
            .css("color", "red");
        }
      });

      function emailDupleCheck() {
        if ($("#email").val() == "") {
          $("#result").html("작성란이 비어있습니다. ").css("color", "red");
        } else {
          $.ajax({
            url: "/emailDupleCheck.member",
            type: "post",
            data: {
              email: $("#email").val(),
              // "email" : $("#Join_email").val()  -> 가독성이 더 좋음.
            },
            success: function (res) {
              // res = response , req = request
              // rs.next() -> true : 중복이 있다. / false : 중복이 없다.
              // 기본적으로 out객체로 응답받는 데이터는 text/html 구조임.
              // boolean false 로 받아온 객체는 String "false"로 받아짐.
              if (res == "true") {
                $("#email").val("");
                $("#result").html("중복된 ID입니다. ").css("color", "red");
              } else {
                $("#result")
                  .html("사용가능한 ID입니다. ")
                  .css("color", "white");
//                 $("#email").prop("readonly", true);

					result = true;
					
					$("#email").keyup(function () {
						 $("#result")
		                  .html("값이 바뀌었습니다. 중복확인을 다시 진행주세요!")
		                  .css("color", "red");
						result = false;
					})
					
              }
            },
            error: function () {
              alert("요청실패");
            },
          });
        }
      }

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
    </script>
  </body>
</html>

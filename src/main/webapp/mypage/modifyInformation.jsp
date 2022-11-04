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

/*         div { */
/*             border: 1px solid #fff; */
/*         } */

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
/*             background-color: bisque; */
            overflow-y: scroll;
        }

        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
/*             background-color: #00000d50; */
        }

        /*마이페이지 css */
        .mypage {
            height: 100%;
            margin-top: 8vh;
/*             background-color: lightgray; */
        }

        .profileDiv {
            width: 10vw;
            min-width: 100px;
/*             background-color: #00000d50; */
        }

        .profile {
            width: 100%;
            min-width: 100px;
            border-radius: 50%
        }

        .nameText {
            font-size: 25px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
/*             background-color: #00000d50; */
        }

        .followerText {
            margin-left: 2vw;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
/*             background-color: #00000d50; */
        }

        #profileBtn {
            margin-top: 2vh;
            width: 20vw;
            height: 50px;
            text-align: center;
            border-radius: 5px;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border: 1px solid gray;
            cursor: pointer;
/*             background-color: #00000d50; */
        }

        #profileBtn:hover {
            border: 1px solid silver;
        }


        /*멤버십 css */
        .membership {
            width: 80%;
            height: 100%;
            margin-top: 6vh;
/*             background-color: lightgray; */
        }
    </style>
</head>

<body>
    <div class="wrap">
        <div class="mypage">
            <div class="titleText">프로필 수정</div>
            <div class="profileDiv">
                <img src="/image/web/profile-default.jpg" class="profile">
            </div>
            <div><a href="" style="color: var(--font-color)">프로필 이미지 업로드</a></div>
            <div><a href="" style="color: var(--font-color)">프로필 이미지 삭제</a></div>
        </div>

        <div class="membership">
            <div>
                <div>Email</div>
                <input type="text" value="duck@naver.com" disabled>
            </div>
            <div>
                <div>Name</div>
                <input type="text" value="신짱구" disabled>
            </div>
            <div>
                <div>Pw</div>
                <input type="text">
            </div>
            <div>
                <div>Phone</div>
                <input type="text">
            </div>
        </div>

        <div id="profileBtn">
            <a href="" style="color: var(--font-color)">프로필 수정</a>
        </div>
        <div id="profileBtn">
            <a href="" style="color: var(--font-color)">회원 탈퇴</a>
        </div>
    </div>
</body>

</html>
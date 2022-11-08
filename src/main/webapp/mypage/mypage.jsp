<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        .container {
            padding: 0 75px;
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

        .profileBtn {
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
            background: var(--background-color);
            color: var(--font-color)
/*             background-color: #00000d50; */
        }

        .profileBtn:hover {
            border: 1px solid silver;
        }



        /*멤버십 css */
        .membership {
            width: 80%;
            height: 100%;
            margin-top: 6vh;
/*             background-color: lightgray; */
        }

        table {
            width: 100%;
            font-size: 20px;
            line-height: 45px;
        }

        table thead {
            text-align: left;
            border: 1px solid #fffffd50;
            border-width: 0 0 1px;
        }

        .thName {
            padding-left: 1vw;
            width: 42vw;
        }

        .thStartdate {
            width: 17vw;
        }

        .thEnddate {
            width: 13vw;
        }

        .List div {
            text-align: left;
        }


        /*예매 내역 css */
        .ticketingHistory {
            height: 100%;
            width: 80%;
            margin-top: 8vh;
/*             background-color: lightgray; */
        }
        .ticketingName {
            padding-left: 1vw;
            width: 42vw;
        }

        .ticketingStartdate {
            width: 21vw;
        }

        .ticketingDetail {
            min-width: 90px;
            width: 5vw;
        }
        #detailBtn {}

        #detailBtn a {
            width: 100%;
            height: 50px;
            text-align: center;
            line-height: 50px;
            border-radius: 5px;
            font-size: 20px;
            font-weight: var(--font-weight);
            border: 1px solid gray;
        }

        #detailBtn a:hover {
            color: #fff;
        }

        #detailBtn a {
            border: 1px solid #222;
        }

        #detailBtn a:hover {
            border: 1px solid silver;
        }
        
		/*프로필 수정 css */
		.membership>div>input{
		background : var(--background-color);
		font-family: "Noto Sans KR", sans-serif;
		color: var(--font-color);
		border: 1px solid silver;
		color: var(--font-color);
		}
		.notInput{
		color: var(--font-color);
		font-size:20px;
		}
		
		.filebox label {
    	display: inline-block;
    	padding: 10px 20px;
    	color: #fff;
    	vertical-align: middle;
    	background-color: #3e065f;
    	cursor: pointer;
    	height: 40px;
    	margin-left: 10px;
		}

		.filebox input[type="file"] {
    	position: absolute;
    	width: 0;
    	height: 0;
    	padding: 0;
    	overflow: hidden;
   		border: 0;
		}
    </style>
        <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
</head>

<body>
    <div class="container" id="wrap1">
        <div class="mypage">
            <div class="titleText">마이페이지</div>
            <div class="profileDiv">
                <img src="/image/web/profile-default.jpg" class="profile">
            </div>
            <span class="nameText">${DTO.nickname }</span>
            <span class="followerText">팔로워 27 </span>
            <div>
                <button class="profileBtn" id="modifyBtn">프로필 수정</button>
            </div>
        </div>

        <div class="membership">
            <div class="titleText">My 멤버십</div>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th class="thName">멤버십명</th>
                            <th class="thStartdate">멤버십 혜택 기간</th>
                            <th class="thEnddate">다음 결제일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="List">
                            <th>
                                <div style="padding-left: 1vw;">${DTO.membership }</div>
                            </th>
                            <td>
                                <div>${DTO.scribeDate }</div>
                            </td>
                            <td>
                            	<div>
                            	<c:choose>
                            	<c:when test= "${!DTO.scribeDate}">${DTO.scribeDate }</c:when>
                            		<c:otherwise>${DTO.scribeDate}</c:otherwise>
                            		</c:choose>
                            	</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="ticketingHistory">
            <div class="titleText">예매 내역</div>
            <table>
                <thead>
                    <tr>
                        <th class="ticketingName">상품명</th>
                        <th class="ticketingStartdate">이용일/매수</th>
                        <th class="ticketingDetail"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="List">
                        <th>
                            <div style="padding-left: 1vw;">마룬파이브 내한공연 (Maroon 5 Live in Seoul)</div>
                        </th>
                        <td>
                            <div>2022.11.03 / 1매</div>
                        </td>
                        <td>
                            <div id="detailBtn">
                                <a href="" style="color: var(--font-color)">상세보기</a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    
    <!-- 프로필 수정 -->
    <div class="container" id="wrap2">
    <form action="/informUpdate.member" method="post" enctype="multipart/form-data" id="updateForm">
        <div class="mypage">
            <div class="titleText">프로필 수정</div>
            <div class="profileDiv">
                <img src="/image/web/profile-default.jpg" class="profile" id="preview">
            </div>
            
            <div class="filebox">
            <label for="file">프로필 이미지 업로드</label> <input
            type="file" id="file" name="file" onchange="readURL(this)">
            </div>
            
            <div><a href="" style="color: var(--font-color)">프로필 이미지 삭제</a></div>
        </div>
	
		
        <div class="membership">
        <form action="/informUpdate.member" method="post">
            <div>
                <div>Email</div>
                <input type="text" value="${loginEmail }" class="notInput" disabled>
            </div>
            <div>
                <div>비밀번호</div>
                <input type="text" name="pw" id="pw">
            </div>
            <div>
                <div>이름</div>
                <input type="text" value="${loginName }" class="notInput" disabled>
            </div>
            <div>
                <div>닉네임</div>
                <input type="text" value="${DTO.nickname }" name="nickname" id="nickname" class="inputAble">
            </div>
            <div>
                <div>전화번호</div>
                <input type="text" value="${DTO.phone }" name="phone" id="phone">
            </div>

        <div>
             <button type="button" id="profileBtn" class="profileBtn">프로필 수정</button>
        </div>
       
        <div id="profileBtn">
            <button type="button" style="color: var(--font-color)" id="deleteBtn" class="profileBtn">회원 탈퇴</button>  
        </div>
        </div>
        </form>
    </div>

    <script>
    window.onload = function() {
    	$('#wrap2').css("display","none");
    }
    let modify = document.getElementById("modifyBtn");
	let completion = document.getElementById("profileBtn");
	let memberDelete = document.getElementById("deleteBtn");
	
	$(modify).click(function() {
		$('#wrap1').fadeOut(450).css("display", "none");
		$('#wrap2').css("display", "block");
	});

	completion.addEventListener("click", function() {
		document.getElementById("updateForm").submit();
	});
	
	memberDelete.addEventListener("click", function() {
		if (confirm("정말 회원 탈퇴를 하시겠습니까?")) {
			location.href = "/delete.member"
			alert("회원 탈퇴 완료");
		} else {
		}
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
    </script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 관리</title>
    <link rel="stylesheet" href="/src/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        /* 관리자페이지 세팅 초기값 */
        @media(max-width:1500px) {
            .html {
                width: 1500px;
            }
        }

        * div:not(#Header) {
            color: #515151;
        }

        #list,
        .listLi {
            color: #515151;
            height: 50px;
            line-height: 50px;
        }

        .listLi:hover {
            cursor: pointer;
            background-color: #01B9FF;
        }

        .loginBtn {
            border-top: 0px;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        body {
            background: #EEEEEE;
        }

        .html {
            overflow: hidden;
        }

        .wrap {
            width: 230px;
            height: 100vh;
            float: left;
        }

        #Header {
            position: fixed !important;
            background-color: #515151;
        }

        .adminContents {
            width: 84%;
            height: 100vh;
            overflow-y: scroll;
            float: left;
            padding-left: 2%;
            padding-top: 2%;
        }

        .adminMainHeader {
            width: 85vw;
            height: 13vh;
            background-color: lightgray;
            position: relative;
        }

        .mainText {
            font-size: 30px;
            border: 1px solid silver;
            width: 100%;
            height: 70px;
            background-color: #FFFFFF;
            line-height: 60px;
            padding-left: 20px;
        }

        .adminMainView {
            width: 100%;
            margin: auto;
        }

        .tog {
            top: 130px;
        }

        .mainList {
            margin-top: 30px;
            background-color: #FFFFFF;
            border: 1px solid silver;
            height: 400px;
            width: 20%;
            float: left;
            display : none;
        }

        .mainContents {
            background-color: #FFFFFF;
            border: 1px solid silver;
            float: left;
            position: relative;
            width: 95%;
            height: 700px;
            margin-left: 30px;
            margin-top: 30px;
            overflow: hidden;
        }

        div[id^=mainConArea] {
            width: 100%;
            height: 95%;
        }
        
        #mainConArea2 {
            display: hidden;
        }
        
        input{
            color:black;
        }
        
        #listHeader>div, .member>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #emailHeader, .email {
        	width : 15%;
        }
        #nameHeader, .name {
        	width : 10%;
        }
        #phoneHeader, .phone {
       		width : 10%;
        }
        #nickHeader, .nickname {
        	width : 10%;
        }
        #membershipHeader, .membership {
        	width : 10%;
        }
        #scribeHeader, .scribeDate {
        	width : 15%;
        }
        #joinHeader, .joinDate {
        	width : 15%;
        }
        .member, #listHeader {
        	height : 30px;
        }
        #navi {
        	height : 5%;
        	text-align : center;
        }
        
        
        /*기본*/
    </style>
</head>

<body>
    <div class="html">
        <div class="wrap">
            <div id="Header">
                <h1 id="logo">
                    <a href="/adminMain.member?nickname=${loginNickname }"><img src="/image/web/logo-f-5.png"
                            alt="" /></a>
                </h1>
                <div id="mypage">
                    <a class="loginBtn">${nickname }</a>
                </div>
                <ul class="tog">
                    <li><a href="/index.jsp">메인페이지로</a></li>
                    <li><a href="#">계정설정</a></li>
                    <li><a href="/logout.member">로그아웃</a></li>
                </ul>
                <div id="GNB">
                    <ul>
                        <li><a id="today">공지사항 작성</a></li>
                        <li><a id="chart" href="/allList.music?nickname=${loginNickname }">음원 관리</a></li>
                        <li><a id="chart">공연 관리</a></li>
                        <li><a href="#">회원 관리</a></li>
                        <li><a href="/goodsList.goods">멤버십 관리</a></li>
                        <li><a href="#">문의내역 확인</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="adminContents">
            <div class="adminMainView">
                <div class="mainText">회원 관리</div>
                <div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                        
                        </li>
                        <li class="listLi" id="listLi2">
                            
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<div id="listHeader">
                        	<div id="emailHeader">이메일</div>
                        	<div id="nameHeader">이름</div>
                        	<div id="phoneHeader">전화번호</div>
                        	<div id="nickHeader">닉네임</div>
                        	<div id="membershipHeader">멤버십등급</div>
                        	<div id="scribeHeader">구독만료일</div>
                        	<div id="joinHeader">가입일</div>
                        </div>
                        <div id="memberList">
                        	<c:choose>
                        		<c:when test="${not empty memberList}">
                        			<c:forEach var="i" items="${memberList }">
                        				<div class="member">
                        					<div class="email">${i.email }</div>
                        					<div class="name">${i.name }</div>
                        					<div class="phone">${i.phone }</div>
                        					<div class="nickname">${i.nickname }</div>
                        					<div class="membership">${i.membership }</div>
                        					<div class="scribeDate">${i.scribeDate }</div>
                        					<div class="joinDate">${i.joinDate }</div>
                        					<button class="delBtn" type="button" email="${i.email }" membership="${i.membership }">회원 탈퇴</button>
                        				</div>
                        			</c:forEach>                        			
                        		</c:when>                        		
                        	</c:choose>
                        </div>                                                
                    </div>
                    <div id="navi">${navi }</div>
                    <div id="mainConArea2">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 관리자 버튼 토글
        let adminBtn = document.getElementById("mypage");
        $(adminBtn).click(function () {
            $(this).next(".tog").fadeToggle();
        });
        
        // 회원 탈퇴 클릭 이벤트
        $(".delBtn").on("click", function(){
        	if ($(this).attr("membership")=="admin") {
        		alert("관리자는 강퇴시킬 수 없습니다!");
        	} else {
        		if (confirm("정말 탈퇴시키겠습니까? 시행하면 복원할 수 없습니다.")) {
        			alert("강퇴 완료.");
        			location.href = "/adminDel.member?email="+$(this).attr("email");
        		}
        	}
        });

        // 리스트  클릭 이벤트
//         $("#listLi1").on("click", function () {
//             $(this).css("background-color", "#01B9FF");
//             $("#listLi2").css("background-color", "#FFFFFF")
//             $("#mainConArea1").css({
//                 "display": "block"
//             })
//             $("#mainConArea2").css({
//                 "display": "none"
//             })
//         })
//         $("#listLi2").on("click", function () {
//             $(this).css("background-color", "#01B9FF");
//             $("#listLi1").css("background-color", "#FFFFFF")
//             $("#mainConArea1").css({
//                 "display": "none"
//             })
//             $("#mainConArea2").css({
//                 "display": "block"
//             })
//         })


    </script>
</body>

</html>
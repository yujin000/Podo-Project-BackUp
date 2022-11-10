<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자페이지</title>
<link rel="stylesheet" href="/src/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<style>
/* 공통 css와 겹쳐서 초기화 */
.loginBtn {
	border-top: 0px;
	border-bottom: 0px;
	margin-bottom: 0px;
}

.adminContents {
	position: absolute;
	left: 230px;
	background: var(- -background-color);
	width: 100%;
	height: 100vh;
}

.adminContents * {
	color: #111;
}

.adminMainHeader {
	width: 85vw;
	height: 13vh;
	background-color: lightgray;
	margin: 0px 10px 0px 10px;
	position: relative;
}

.adminMainHeader span {
	margin-left: 30px;
}

#adminHeaderHello {
	font-size: 40px;
}

#nowTime {
	padding-top: 4px;
}

#adminLogoutBtn {
	right: 1px;
	height: 100%;
	position: absolute;
}

.adminMainView {
	width: 85vw;
	height: 85vh;
	margin: 10px 10px 0px 10px;
	overflow: hidden;
}

.mainView1, .mainView2 {
	height: 100%;
	width: 100%;
	float: left;
}

.mainView1 {
	width: 70%;
	margin: auto;
}

.mainView2 {
	width: 30%;
}

.mainView1-1, .mainView1-2 {
	height: 100%;
	width: 60vw;
}

.mainView1-1 {
	height: 54vh;
}

.mainView1-2 {
	height: 40vh;
}

.mainView1-1 div {
	float: left;
	height: 50vh;
	width: 27vw;
	margin: 10px 0px 4px 30px;
	background-color: lightgray;
}

#inquire {
	background-color: lightgray;
	height: 68%;
	width: 55.8vw;
	margin: 10px 0px 4px 30px;
}

#userCount * {
	float: left;
	background-color: lightgray;
	margin: 10px;
	height: 100%;
}

#userCount {
	width: 90%;
	height: 30%;
	overflow: hidden;
}

#userCountGraph {
	width: 100%;
}

#userList {
	background-color: lightgray;
	height: 66.5%;
	width: 87.6%;
	margin: 6px 10px 4px;
}

.tog {
	top: 130px;
	left:
}
</style>
</head>

<body>
	<div class="wrap">
		<div id="Header">
			<h1 id="logo">
				<a href="/adminMain.member?nickname=${loginNickname }"><img src="/image/web/logo-f-5.png" alt="" /></a>
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
					<li><a href="/list.notice">공지사항 관리</a></li>
					<li><a id="chart"
						href="/allList.music?nickname=${loginNickname }">음원 관리</a></li>
					<li><a id="chart">공연 관리</a></li>
					<li><a href="#">회원 관리</a></li>
					<li><a href="/goodsList.goods">멤버십 관리</a></li>
					<li><a href="#">문의내역 확인</a></li>
				</ul>
			</div>
		</div>
		<div class="adminContents">
			<div class="adminMainHeader">
				<span id="adminHeaderHello"> ${nickname }님 환영합니다. </span><br> <span
					id="nowTime"> 2022년 11월 02일 / 11시 11분 </span>

			</div>
			<div class="adminMainView">
				<div class="mainView1">
					<div class="mainView1-1">
						<div id="showlist">show list</div>
						<div id="musiclist">music list</div>
					</div>
					<div class="mainView1-2">
						<div id="inquire">inquire list</div>
					</div>
				</div>
				<div class="mainView2">
					<div id="userCount">
						<div id="userCountGraph">graph</div>
					</div>
					<div id="userList">user list</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 관리자 버튼 토글
		let adminBtn = document.getElementById("mypage");
		$(adminBtn).click(function() {
			$(this).next(".tog").fadeToggle();
		});
	</script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>음원관리</title>
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

#Header {
	position: fixed !important;
}

.adminContents {
	position: absolute;
	left: 230px;
	background: var(- -background-color);
	width: 100%;
	height: 100vh;
	margin: 50px 0px 0px 140px;
	overflow-y: scroll;
}

.adminMainHeader {
	width: 85vw;
	height: 13vh;
	background-color: lightgray;
	margin: 0px 10px 0px 10px;
	position: relative;
}

.mainText {
	font-size: 36px;
}

.adminMainHeader span {
	margin-left: 30px;
}

.adminMainView {
	color: white;
	width: 1200px;
}

.tog {
	top: 130px;
}

</style>
</head>

<body>
	<div class="wrap">
		<div id="Header">
			<h1 id="logo">
				<a href="/adminMain.admin?nickname=${loginNickname }"><img
					src="/image/web/logo-f-5.png" alt="" /></a>
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
					<li><a href="/adminMemship.admin">멤버십 관리</a></li>
					<li><a href="#">문의내역 확인</a></li>
				</ul>
			</div>
		</div>
		<div class="adminContents">
			<div class="adminMainView">
				<div class="mainText">멤버십 관리</div>
				<br>
				<hr>
				
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
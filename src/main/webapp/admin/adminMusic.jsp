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

.html {
	overflow: hidden;
}

@media ( max-width :1500px) {
	.html {
		width: 1500px;
	}
}

.wrap {
	width: 230px;
	height: 100vh;
	float: left;
}

#Header {
	position: fixed !important;
}

.adminContents {
	background: var(- -background-color);
	width: 80%;
	height: 100vh;
	overflow-y: scroll;
	float: left;
	padding-left: 7%;
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
	margin-top: 50px;
}

.adminMainHeader span {
	margin-left: 30px;
}

.adminMainView {
	color: silver;
	width: 100%;
	margin: auto;
}

.tog {
	top: 130px;
}

.musicList {
	width: 100%;
	margin-top: 30px;
}

.addMusic {
	background-image: linear-gradient(#000, #000),
		linear-gradient(to right, #3e065f 0%, #ff00d7 100%);
	border: 1px solid transparent;
	border-radius: 5px;
	background-origin: border-box;
	background-clip: content-box, border-box;
	margin: 10px 0px 5px;
	background-color: #555;
	height: 70px;
	text-align: center;
	line-height: 70px;
	font-size: 20px;
}

.addMusic:hover {
	cursor: pointer;
}

.listWrap {
	width: 100%;
	color: silver;
}

.listWrap div {
	font-size: small;
	overflow: hidden;
	height: 23.6px;
	float: left;
}

.listWrap button {
	float: left;
	line-height: 20px;
}

div[class^=listWrap]:hover:not(#listWrap1) {
	border-radius: 5px;
	cursor: pointer;
	/*background: linear-gradient(60deg, #3e065f, #ff00d7);*/
	background-color:silver;
	transform: scale(1.01);
	transition: 0.2s;
}

div[class^=navi] {
	width: 200px;
	height: 70px;
	text-align: center;
	line-height: 70px;
}

.navi1, .navibar1 {
	width: 80px !important;
	margin-left: 100px;
}

.navibar {
	font-size: 20px !important;
}

.navi5 {
	margin-bottom: 5px;
}

#musicImg {
	position: relative;
}

#albumImg {
	width: 50px;
	height: 50px;
	position: absolute;
	left: 20%;
	top: 15%;
}

hr {
	width: 100%;
}

#listHr {
	border: 0.7px dashed;
}

/* 음원 추가하기 창 css */
.addMusicArea {
	display: none;
}

.container {
	margin-left: 200px;
	overflow: hidden;
	width: 100%;
	height: 600px;
}

.container>div[class^="contents"] {
	float: left;
}

.contentsImg {
	width: 20%;
	height: 100%;
}

.contentsImg>img {
	width: 200px;
	height: 200px;
	margin: 15px 0px 0px 15px;
}

.contentsInfo {
	width: 60%;
	height: 100%;
}

.infoArea, .filebox, .btnBox, .mp3File, .lylics {
	width: 80%;
	margin-left: 10px;
}

.textArea, .textAreaMp3 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #3e065f;
	width: 330px;
	color: black;
}

/* 파일첨부 css */
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

.update, .delete {
	border: none;
	background-color: transparent;
	color: silver;
	margin-top: 25px;
}

.update+.delete {
	margin-left: 10px;
}

.update:hover, .delete:hover {
	cursor: pointer;
	font-weight:bold;
	transform: scale(1.01);

}

#saveMusic, #cancelMusic {
	background: #3e065f;
	color: silver;
}

#saveMusic:hover, #cancelMusic {
	cursor: pointer;
}

#updateBtn:hover {
	cursor: pointer;
}

#btnBox2 {
	height: 100%;
	margin-left: 10%;
}

@media ( max-width :1600px) {
	#btnBox2 {
		height: 100%;
		margin-left: 2%;
	}
}
</style>
</head>

<body>
	<div class="html">
		<div class="wrap">
			<div id="Header">
				<h1 id="logo">
					<a href="/adminMain.member?nickname=${loginNickname }"><img
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
						<li><a href="/admin/adminNotice/adminNotice.jsp">공지사항 관리</a></li>
						<li><a id="chart"
							href="/allList.music?nickname=${loginNickname }">음원 관리</a></li>
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
				<div class="mainText">음원관리</div>
				<br>
				<hr>
				<div class="musicList">
					<div class="addMusic" id="addMusic" title="음원 추가하기">음원 추가하기</div>
					<form id="form">
						<div class="addMusicArea" id="addMusicArea">
							<div class="container">
								<div class="contentsImg">
									<img id="preview">
								</div>
								<div class="contentsInfo">
									<div class="infoArea">
										노래이름<br> <input type="text" name="musicName"
											id="musicName" class="textArea"><br> 아티스트<br>
										<input type="text" name="musicArtist" id="musicArtist"
											class="textArea"><br> 앨범명<br> <input
											type="text" name="musicAlbum" id="musicAlbum"
											class="textArea"><br> 장르<br> <input
											type="text" name="musicGenre" id="musicGenre"
											class="textArea"><br> 차트<br> <input
											type="text" name="musicChart" id="musicChart"
											style="color: black;">
									</div>
									<div class="lylics">
										가사
										<textarea name="musicLylics"
											style="width: 100%; height: 100px; resize: none; color: black;"
											id="lylics"></textarea>
									</div>
									&nbsp&nbsp&nbsp이미지 파일 첨부
									<div class="filebox">
										<input class="textAreaMp3" id="mp3File"> <label
											for="file">파일찾기</label> <input type="file" id="file"
											name="imgFile" onchange="readURL(this)">
									</div>
									<div class="mp3File">
										mp3 첨부<br> <input type="file" name="mp3File" id="imgFile">
									</div>
									<br>

									<div class="btnBox">
										<button type="button" id="saveMusic">저장하기</button>
										<button type="button" id="cancelMusic">취소하기</button>
									</div>

								</div>
							</div>
						</div>
					</form>
					<form id="updateForm">
						<div class="listWrap" id="listWrap1">
							<div class="navibar1"></div>
							<div class="navibar">곡 이름</div>
							<div class="navibar">가수</div>
							<div class="navibar">앨범 이름</div>
							<div class="navibar">장르</div>
							<hr>
						</div>
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="list" items="${list}">
									<input type="hidden" class="seq" name="seq"
										value="${list.musicSeq }">
									<div class="listWrap">
										<div class="navi1" id="musicImg">
											<img src="/admin/${list.musicImg }.jpg" id="albumImg">
										</div>
										<div class="navi2">${list.musicName }</div>
										<div class="navi3">${list.musicArtist }</div>
										<div class="navi4">${list.musicAlbum }</div>
										<div class="navi5">${list.musicGenre }</div>
										<div id="btnBox2">
											<button type="button" class="update" seq="${list.musicSeq }">수정</button>
											<button type="button" class="delete" seq="${list.musicSeq }">삭제</button>
										</div>
										<input type="hidden" value="${list.musicSeq }"
											class="seqHidden">
										<hr id="listHr">
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
                                출력할 내용이 없습니다.
                            </c:otherwise>
						</c:choose>
					</form>
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

		// 음원 추가하기
		$("#addMusic").on("click", function() {
			$(".addMusicArea").css("display", "block");
		})

		// 음원 추가 취소버튼 클릭 시 초기화
		$("#cancelMusic").on("click", function() {
			if (confirm("음원 추가를 취소하시겠습니까?")) {
				$(".addMusicArea").css("display", "none");
				$(".infoArea").children("input").val("");
				$(".filebox").children("input").val("");
				$(".mp3File").children("input").val("");
				$("#preview").removeAttr("src");
			}
		})

		// 앨범 이미지 미리보기
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

		// 파일 첨부시 파일경로 표시(placeholder) 
		$("#file").on('change', function() {
			var fileName = $("#file").val();
			$(".textAreaMp3").val(fileName);
		});

		// 음악 추가 저장 버튼
		$("#saveMusic")
				.on(
						"click",
						function() {
							console.log($("#file").val());
							if ($("#file").val() == ""
									|| $(".textArea").val() == ""
									|| $("#imgFile").val() == ""
									|| $("#lylics").val() == "") {
								alert("노래이름, 아티스트, 앨범명, 장르, 가사, 이미지, MP3파일 모두 입력되어야 합니다.");
							} else {
								if (confirm("추가하시겠습니까?")) {
									$("#form")
											.attr("action", "/addMusic.music");
									$("#form").attr("enctype",
											"multipart/form-data");
									$("#form").attr("method", "post");
									$("#form").submit();
								}
							}
						})
		// 삭제 버튼
		$(".delete").on("click", function() {
			if (confirm("삭제하시겠습니까?")) {
				let target = $(this).attr("seq");
				location.href = "/deleteMusic.music?seq=" + target;
			}
		})
		// 수정하기 버튼

		let updateDiv = $("<div>");
		updateDiv.attr("class", "addedDiv");
		updateDiv.css({
			"overflow" : "hidden",
			"margin-left" : "200px",
			"color" : "black"
		})
		let addName = $("<input>");
		addName.attr("type", "text");
		addName.attr("name", "updateName");
		addName.css("color", "black");
		addName.addClass("updTxt");

		let addArtist = $("<input>");
		addArtist.attr("type", "text");
		addArtist.css({
			"margin-left" : "30px",
			"color" : "black"
		});
		addArtist.attr("name", "updateArtist");
		addArtist.addClass("updTxt");

		let addAlbum = $("<input>");
		addAlbum.attr("type", "text");
		addAlbum.css({
			"margin-left" : "30px",
			"color" : "black"
		});
		addAlbum.attr("name", "updateAlbum");
		addAlbum.addClass("updTxt");

		let addGenre = $("<input>");
		addGenre.attr("type", "text");
		addGenre.css({
			"margin-left" : "30px",
			"color" : "black"
		});
		addGenre.attr("name", "updateGenre");
		addGenre.addClass("updTxt");

		let updBtn = $("<button>");
		updBtn.attr("type", "button");
		updBtn.attr("id", "updateBtn");
		updBtn.html('수정하기');
		updBtn.css({
			"border" : "none",
			"background-color" : "transparent",
			"color" : "black"
		});
		let cancelBtn = $("<button>");
		cancelBtn.attr("type", "button");
		cancelBtn.attr("id", "updateBtn");
		cancelBtn.html('취소하기');
		cancelBtn.css({
			"border" : "none",
			"background-color" : "transparent",
			"color" : "black",
			"margin-left" : "10px"
		});

		updateDiv.append(addName);
		updateDiv.append(addArtist);
		updateDiv.append(addAlbum);
		updateDiv.append(addGenre);

		// 수정하기 버튼 클릭 시 수정영역 추가   
		$(".update").on("click", function() {
			
			$(this).parent().parent().find('hr').append(updateDiv);
			$(this).parent().parent().find('hr').append(updBtn);
			$(this).parent().parent().find('hr').append(cancelBtn);
		})

		// 수정하기 취소하기 마우스 호버 이벤트
		updBtn.on("mouseover", function() {
			$(this).css("font-weight", "bold");
		})
		updBtn.on("mouseout", function() {
			$(this).css("font-weight", "normal");
		})
		cancelBtn.on("mouseover", function() {
			$(this).css("font-weight", "bold");
		})
		cancelBtn.on("mouseout", function() {
			$(this).css("font-weight", "normal");
		})

		// 수정하기 완료 버튼 클릭
		updBtn.on("click", function() {
			$(this).parent().parent().find(".seqHidden").attr("name",
					"modifySeq");
			if ($(".updTxt").val() == "") {
				alert("모든 항목을 입력해 주세요.");
			} else {
				if(confirm("변경사항을 저장하시겠습니까?")){
					$("#updateForm").attr("action", "/update.music");
					$("#updateForm").submit();
				}
			}
		})

		// 수정 취소하기 버튼 클릭
		cancelBtn.on("click", function() {
			if (confirm("수정사항을 취소하시겠습니까?")) {
				location.reload();
			}
		})
		
		// 리스트 마우스 호버 이벤트
		$("div[class^=listWrap]:not(#listWrap1)").on("mouseover",function(){
			$(this).find("div").css("color","black");
			$(this).find("button").css("color","black");
		})
		$("div[class^=listWrap]:not(#listWrap1)").on("mouseout",function(){
			$(this).find("div").css("color","silver");
			$(this).find("button").css("color","silver");
		})
	</script>
</body>

</html>
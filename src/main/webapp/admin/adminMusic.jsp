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
        
        #listLi1{
        	background-color:#01B9FF;
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
        }

        .mainContents {
            background-color: #FFFFFF;
            border: 1px solid silver;
            float: left;
            position: relative;
            width: 77.4%;
            height: 700px;
            margin-left: 30px;
            margin-top: 30px;
            overflow: hidden;
        }

        div[id^=mainConArea] {
            width: 100%;
            height: 100%;
        }
		#mainConArea1{
			overflow-y: scroll;
		}
        #mainConArea2 {
            display: hidden;
            overflow-y: scroll;
        }
        
        input{
            color:black;
        }

        /*기본*/

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
				<div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                            &nbsp 현재 등록된 음원 목록
                        </li>
                        <li class="listLi" id="listLi2">
                            &nbsp 음원 추가하기
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
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
                                            <div class="navi2"><input type="text" value="${list.musicName }" class="inMusicName" readonly></div>
                                            <div class="navi3"><input type="text" value="${list.musicArtist }" class="inMusicArtist" readonly></div>
                                            <div class="navi4"><input type="text" value="${list.musicAlbum }" class="inMusicAlbum" readonly></div>
                                            <div class="navi5"><input type="text" value="${list.musicGenre }" class="inMusicGenre" readonly></div>
                                            <div class="navi6"><textarea class="inMusicLylics" style="color:black;"readonly>${list.musicLylics } </textarea></div>
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
                    <div id="mainConArea2">
                        <form id="form">
                            <div class="addMusicArea" id="addMusicArea">
                                <div class="container">
                                    <div class="contentsImg">
                                        <img id="preview">
                                    </div>
                                    <div class="contentsInfo">
                                        <div class="infoArea">
										      노래이름<br />
										      <input
										        type="text"
										        name="musicName"
										        id="musicName"
										        class="textArea"
										      /><br />
										      아티스트<br />
										      <input
										        type="text"
										        name="musicArtist"
										        id="musicArtist"
										        class="textArea"
										      /><br />
										      앨범명<br />
										      <input
										        type="text"
										        name="musicAlbum"
										        id="musicAlbum"
										        class="textArea"
										      /><br />
										      장르<br />
										      <input
										        type="text"
										        name="musicGenre"
										        id="musicGenre"
										        class="textArea"
										      /><br />
										      차트<br />
										      <input
										        type="text"
										        name="musicChart"
										        id="musicChart"
										        style="color: black"
										      />
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
                    </div>
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

          // 리스트  클릭 이벤트
          $("#listLi1").on("click", function () {
            $(this).css("background-color", "#01B9FF");
            $("#listLi2").css("background-color", "#FFFFFF")
            $("#mainConArea1").css({
                "display": "block"
            })
            $("#mainConArea2").css({
                "display": "none"
            })
        })
        $("#listLi2").on("click", function () {
            $(this).css("background-color", "#01B9FF");
            $("#listLi1").css("background-color", "#FFFFFF")
            $("#mainConArea1").css({
                "display": "none"
            })
            $("#mainConArea2").css({
                "display": "block"
            })
        })


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
		$("#saveMusic").on("click",function() {
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
        // 현재 판매중인 이용권 수정버튼 생성
        let updCancelBtn = $("<button>");
        updCancelBtn.attr("type", "button");
        updCancelBtn.addClass("updCancelBtn");
        updCancelBtn.css({
            "border": "none",
            "color": "black",
            "margin-top": "25px",
            "margin-left": "10px"
        })
        updCancelBtn.text("수정취소");

        let updConfirmBtn = $("<button>");
        updConfirmBtn.attr("type", "button");
        updConfirmBtn.addClass("updConfirmBtn");
        updConfirmBtn.css({
            "border": "none",
            "color": "black",
            "margin-top": "25px"
        })
        updConfirmBtn.text("저장");

        // 수정 버튼 클릭 시 readonly > false로 변경
        $(".update").on("click", function () {
            $(this).parent().find(".delete").css("display", "none");
            $(this).parent().find(".update").css("display", "none");
            $(this).parent().append(updConfirmBtn);
            $(this).parent().append(updCancelBtn);
            $(this).parent().parent().find("input").removeAttr("readonly");
            $(this).parent().parent().find("textarea").removeAttr("readonly");
            $(this).parent().parent().find("input").css("color", "red");
            $(this).parent().parent().find(".inMusicName").attr("name", "musicName");
            $(this).parent().parent().find(".inMusicArtist").attr("name", "musicArtist");
            $(this).parent().parent().find(".inMusicAlbum").attr("name", "musicAlbum");
            $(this).parent().parent().find(".inMusicGenre").attr("name", "musicGenre");
            $(this).parent().parent().find(".inMusicLylics").attr("name", "musicLylics");
        })

        // 수정사항 저장 버튼
        updConfirmBtn.on("click", function () {
            $("#updateForm").attr("action", "/update.music");
            $("#updateForm").attr("method", "post");
            if (confirm("입력하신 내용으로 수정하시겠습니까?")) {
                $("#updateForm").submit();
            }
        })

        // 취소버튼
        updCancelBtn.on("click", function () {
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
		
		// 음원등록 유효성 검사
		
	</script>
</body>

</html>
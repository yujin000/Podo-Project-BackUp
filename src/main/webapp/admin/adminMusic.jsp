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
            display: none;
            overflow-y: scroll;
        }
        
        input{
            color:black;
        }
		button{
            color:black;
        }
        /*기본*/

		/* 파일첨부 css */
label{
  padding: 6px 25px;
  background-color:#01B9FF;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
#file{
    display: none;
}

/* 기본 리스트 css */
.listWrap{
    position:relative;
    height:150px;
}
b{
    color:black;
}
.listWrap input{
    border:none;
}
div[class^=navi]{
    display:inline-block;
    position:absolute;
}
#musicImg{
    width:100px;
    height:100px;
    top:50%;
    transform: translateY(-50%);
    left:25px;
}
.navi1{
    left:30px;
    top:20px;
    z-index: 99;
}
.navi2{
    top:15px;
    left:150px;
}
.navi3{
    top:15px;
    left:360px;
}
.navi4{
    bottom:20px;
    left:150px;
}
.navi5{
    bottom:20px;
    left:360px;
}
.navi6{
    top:10px;
    right:180px;
    width:40%;
    height:110px;
}
.navi6>textarea{
    resize: none;
    width:100%;
    height:84%;
}
#btnBox2{
    display:inline-block;
    right:50px;
    position: absolute;
    top:50%;
    transform: translateY(-50%);
}
#listHr{
    position:absolute;
    bottom:1px;
    width:100%;
}
/* 기본 리스트 css 끝 */

/* 추가하기 */
.mainConArea2{
    position:relative;
}
 #h1text{
    position:absolute;
    color:#515151;
    left:30px;
    top:10px;
}
div[class^=inInfo],.btnBox{
    display:inline-block;
    position:absolute;
}
.showimg{
    position:absolute;
    display:inline-block;
    border:1px solid silver;
    width:250px;
    height:250px;
    display:inline-block;
    left:170px;
    top:150px;
}
.addImg>img{
    width:100%;
    height:100%;
}
.inInfo1{
    left:550px;
    top:90px;
}
.inInfo2{
    left:550px;
    top:140px;
}
.inInfo3{
    left:550px;
    top:190px;
}
.inInfo4{
    left:550px;
    top:240px;
}
.inInfo5{
    left:550px;
    top:290px;
}
.inInfo6{
    left:550px;
    top:340px;
    width:500px;
}
.inInfo6 textarea{
    width:100%;
}
.inInfo7{
    left:230px;
    top:420px;
}
.inInfo8{
    left:550px;
    top:470px;
}
.btnBox{
    bottom:100px;
    left:550px;
}
.btnBox>button:first-child{
    background-color: #FF0050;
    color:white;
    width:100px;
    height:30px;
    border-radius: 5px;
    border:none;
}
.btnBox>button:nth-child(2){
    width:100px;
    height:30px;
    border-radius: 5px;
    border:1px solid silver;
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
				<li><a href="/start.music">메인페이지로</a></li>
				<li><a href="/logout.member">로그아웃</a></li>
			</ul>
			<div id="GNB">
				<ul>
					<li><a href="/list.notice?cpage=1">공지사항 관리</a></li>
					<li><a href="/allList.music">음원 관리</a></li>
					<li><a href="/adminPerform.perform">공연 관리</a></li>
					<li><a href="/list.member?cpage=1">회원 관리</a></li>
					<li><a href="/goodsList.goods">멤버십 관리</a></li>
					<li><a href="/adminList.board?cpage=1">문의내역 확인</a></li>
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
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="list" items="${list}">
                                        <input type="hidden" class="seq" name="seq"
                                            value="${list.musicSeq }">
                                        <div class="listWrap">
                                            <div class="navi1" id="musicImg">
                                                <img src="/admin/${list.musicImg }" id="albumImg">
                                            </div>
                                            <div class="navi2"><b>· 곡제목</b><br><input type="text" value="${list.musicName }" class="inMusicName" readonly></div>
                                            <div class="navi3"><b>· 아티스트</b><br><input type="text" value="${list.musicArtist }" class="inMusicArtist" readonly></div>
                                            <div class="navi4"><b>· 앨범명</b><br><input type="text" value="${list.musicAlbum }" class="inMusicAlbum" readonly></div>
                                            <div class="navi5"><b>· 장르</b><br><input type="text" value="${list.musicGenre }" class="inMusicGenre" readonly></div>
                                            <div class="navi6"><b>· 가사</b><br><textarea class="inMusicLylics" style="color:black;"readonly>${list.musicLylics } </textarea></div>
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
                        <h1 id="h1text">음원 추가하기</h1>
                        <form id="form">
                            <div class="addMusicArea" id="addMusicArea">
                                <div class="container">
                                    <div class="contentsInfo">
                                        <div class="showimg">
                                            <img id="preview">
                                        </div>
                                        <div class="inInfo1">
                                            <b>· 노래이름</b><br />
                                            <input type="text" name="musicName" id="musicName" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo2">
                                            <b>· 아티스트</b><br />
                                            <input type="text" name="musicArtist" id="musicArtist" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo3">
                                            <b>· 앨범명</b><br />
                                            <input type="text" name="musicAlbum" id="musicAlbum" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo4">
                                            <b>· 장르</b><br />
                                            <input type="text" name="musicGenre" id="musicGenre" class="textArea" maxlength="20"/><br />
                                        </div>
                                        <div class="inInfo5">
                                            <b>· 차트</b><br />
                                            <input type="text" name="musicChart" id="musicChart" style="color: black" maxlength="4"/>
                                        </div>
                                        <div class="inInfo6">
                                            <b>· 가사</b><br>
                                            <textarea name="musicLylics"
                                                style="width: 500; height: 100px; resize: none; color: black;"
                                                id="lylics" maxlength="1000"></textarea>
                                        </div>
                                        <div class="inInfo7">
                                             <label for="file">앨범 업로드</label> <input type="file" id="file" name="imgFile" onchange="readURL(this)">
                                        </div>
                                        <div class="inInfo8">
                                            <b>· mp3 첨부</b><br> <input type="file" name="mp3File" id="imgFile">
                                        </div>
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

          let span = $("<span>");
          let chartChk = false;
          // 음원등록 유효성 검사
          $("#musicChart").on("keyup",function(){
              let regex = /^[0-9]{1,4}$/;
              let result = regex.test($("#musicChart").val());

              if(!result){
                  $("#musicChart").after(span);
                  span.text("1~4자리 숫자만 입력할 수 있습니다.");
                  span.css("color","#FF0050");
                  chartChk = false;
              }else{
                  chartChk = true;
                  span.remove();
              }
          })

  		// 음악 추가 저장 버튼
  		$("#saveMusic").on("click",function() {
  			if ($("#file").val() == ""
  					|| $(".textArea").val() == ""
  					|| $("#imgFile").val() == ""
  					|| $("#lylics").val() == "") {
  				alert("노래이름, 아티스트, 앨범명, 장르, 가사, 이미지, MP3파일 모두 입력되어야 합니다.");
  			}else if(chartChk == false){
                  alert("차트 입력 양식을 확인해주세요.");
              }else {
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
            "color": "black",
            "margin-left": "5px"
        })
        updCancelBtn.text("취소");

        let updConfirmBtn = $("<button>");
        updConfirmBtn.attr("type", "button");
        updConfirmBtn.addClass("updConfirmBtn");
        updConfirmBtn.css({
            "color": "black"
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
            $(this).parent().parent().find("input").css({
            	"color": "#FF0050",
            	"border":"1px solid black"
            });
            $(this).parent().parent().find("textarea").css("color", "#FF0050");
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
		
		// 음원등록 유효성 검사
		musicChart
	</script>
</body>

</html>
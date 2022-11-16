<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공연 관리</title>
    <link rel="stylesheet" href="/src/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        /* 관리자페이지 세팅 초기값 */
        @media(max-width:1700px) {
            .html {
                width: 1700px;
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
        
        input,textarea{
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
#performImg{
    width:90px;
    height:120px;
    top:45%;
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
.navi3>input{
	width:500px;
}
.navi4{
    bottom:20px;
    left:150px;
}
.navi5{
    top:15px;
    left:840px;
}
.navi6{
    top:40px;
    left:840px;
}
.navi7{
    bottom:20px;
    left:360px;
}
.navi8{
    top:15px;
    left:660px;
}
.navi9{
    bottom:20px;
    left:660px;
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
    width:300px;
    height:400px;
    display:inline-block;
    left:170px;
    top:100px;
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
}
.inInfo6 textarea{
    width:100%;
}
.inInfo7{
    left:230px;
    top:520px;
}
.inInfo8{
    left:550px;
    top:400px;
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
                    <a href="/adminMain.adminMain"><img src="/image/web/logo-f-5.png"
                            alt="" /></a>
                </h1>
                <div id="mypage">
                    <a class="loginBtn">${loginNickname }</a>
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
                <div class="mainText">공연 관리</div>
                <div class="mainList">
                    <ul id="list">
                        <li class="listLi" id="listLi1">
                            &nbsp 현재 등록된 공연 목록
                        </li>
                        <li class="listLi" id="listLi2">
                            &nbsp 공연 추가하기
                        </li>
                    </ul>
                </div>
                <div class="mainContents">
                    <div id="mainConArea1">
						<c:choose>
							<c:when test="${not empty perform }">
								<c:forEach var="perform" items="${perform }">
								<form id="upForm">
									<div class="listWrap">
										<div class="navi1" id="performImg">
											<img src="/image/perform/${perform.poster }" id="posterImg">
										</div>
                                        <div class="navi2"><b>극장명</b><br><input type="text" value="${perform.theaterName }" class="intheaterName" readonly></div>
                                        <div class="navi3"><b>공연이름</b><br><input type="text" value="${perform.performTitle }" class="inperformTitle" readonly></div>
                                        <div class="navi4"><b>상영시간</b><br><input type="text" value="${perform.showtime }" class="inshowtime" readonly></div>
                                        <div class="navi5"><b>시작일</b><input type="text" value="<fmt:formatDate value="${perform.startDate }" pattern="yyyy-MM-dd"/>" class="instartDate" readonly></div>
                                        <div class="navi6"><b>종료일</b><input type="text" value="<fmt:formatDate value="${perform.endDate }" pattern="yyyy-MM-dd"/>" class="inendDate" readonly></div>
                                        <div class="navi7"><b>가격</b><br><input type="text" value="${perform.performPrice }" class="inperformPrice" readonly></div>
                                        <div class="navi8"><b>관람등급</b><br><input type="text" value="${perform.rating }" class="inrating" readonly></div>
                                        <div class="navi9"><b>장르</b><br><input type="text" value="${perform.genre }" class="ingenre" readonly></div>
										<div id="btnBox2">
											<button type="button" class="update" pSeq="${perform.performSeq }">수정</button>
											<button type="button" class="delete" seq="${perform.performSeq }">삭제</button>
										</div>
										<hr id="listHr">
									</div>
								</form>	
								</c:forEach>
							</c:when>
							<c:otherwise>
                                출력할 내용이 없습니다.
                            </c:otherwise>
						</c:choose>
                    </div>

                    <div id="mainConArea2">
                        <h1 id="h1text">공연 추가하기</h1>
                        <form id="addPerform">
                            <div class="addPerform" id="addPerform">
                                <div class="container">
                                    <div class="contentsInfo">
                                        <div class="showimg">
                                            <img id="preview">
                                        </div>
                                        <div class="inInfo1">
                                            <b>공연장</b><br />
                                            <input type="text" name="theaterName" id="theaterName" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo2">
                                            <b>공연이름</b><br />
                                            <input type="text" name="performTitle" id="performTitle" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo3">
                                            <b>상영시간</b><br />
                                            <input type="text" name="showtime" id="showtime" class="textArea" maxlength="40"/><br />
                                        </div>
                                        <div class="inInfo4">
                                            <b>티켓 가격</b><br />
                                            <input type="text" name="performPrice" id="performPrice" class="textArea" maxlength="20"/><br />
                                        </div>
                                        <div class="inInfo5">
                                            <b>관람 등급</b><br />
                                            <input type="text" name="rating" id="rating" style="color: black" maxlength="20"/>
                                        </div>
                                        <div class="inInfo6">
                                            <b>장르</b><br />
                                            <input type="text" name="rating" id="rating" style="color: black" maxlength="20"/>
                                        </div>
                                        <div class="inInfo7">
                                             <label for="file">콘서트 포스터 업로드</label> <input type="file" id="file" name="posterFile" onchange="readURL(this)">
                                        </div>
                                        <div class="inInfo8">
                                            공연 시작일 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp공연 종료일<br> 
                                            <input type="date" name="startDate" id="startDate">
                                            <input type="date" name="endDate" id="endDate"><br>
                                       </div>
                                       <input type="hidden" id="performPoster" name="performPoster" value="grizzly.jfif">
                                        <div class="btnBox">
                                            <button type="button" id="savePerform">저장하기</button>
                                            <button type="button" id="cancelPerform">취소하기</button>
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
    $(adminBtn).click(function () {
        $(this).next(".tog").fadeToggle();
    });

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

	// 삭제 버튼
	$(".delete").on("click", function() {
		if (confirm("삭제하시겠습니까?")) {
			let target = $(this).attr("seq");
			location.href = "/deletePerform.perform?seq=" + target;
		}
	})
	
	//  수정버튼 생성
    let updCancelBtn = $("<button>");
    	updCancelBtn.attr("type","button");
    	updCancelBtn.addClass("updCancelBtn");
    	updCancelBtn.css({
        	"color":"black",
        	"margin-left":"10px"
    	})
    	updCancelBtn.text("취소");
    	
    let updConfirmBtn = $("<button>");
        updConfirmBtn.attr("type","button");
        updConfirmBtn.addClass("updConfirmBtn");
        updConfirmBtn.css({
        	"color":"black"
    	})
    	updConfirmBtn.text("저장");
        
     // 수정 버튼 클릭 시 readonly > false로 변경
     
     
        $(".update").on("click", function () {
        	$(this).parent().find(".delete").css("display","none");
        	$(this).parent().find(".update").css("display","none");
        	$(this).parent().append(updConfirmBtn);
        	$(this).parent().append(updCancelBtn);
        	$(this).parent().parent().find("input").removeAttr("readonly");
        	$(this).parent().parent().find(".inProductsSeq").attr("readonly","true");
            $(this).parent().parent().find("input").css({
            	"color": "#FF0050",
            	"border":"1px solid black"
            });
        	$(this).parent().parent().find(".navi2").focus();
        	
        	$(this).parent().parent().find(".intheaterName").attr("name","theaterName");
        	$(this).parent().parent().find(".inperformTitle").attr("name","performTitle");
        	$(this).parent().parent().find(".inshowtime").attr("name","showtime");
        	$(this).parent().parent().find(".instartDate").attr("name","startDate");
        	$(this).parent().parent().find(".inendDate").attr("name","endDate");
        	$(this).parent().parent().find(".inperformPrice").attr("name","performPrice");
        	$(this).parent().parent().find(".inrating").attr("name","rating");
        	$(this).parent().parent().find(".ingenre").attr("name","genre");
        })
           
	
    // 수정사항 저장 버튼
    updConfirmBtn.on("click",function(){
    	let target = $(".update").attr("pSeq");
    	$("#upForm").attr("action","/updPerform.perform?pSeq="+target);
    	$("#upForm").attr("method","post");
    	if(confirm("입력하신 내용으로 수정하시겠습니까?")){
        	$("#upForm").submit();
    	}
    })
    
    // 취소버튼
    updCancelBtn.on("click",function(){
    	if (confirm("수정사항을 취소하시겠습니까?")) {
			location.reload();
		}
    })
    

    let performChk = false;
    let priceChk = false;
    let span = $("<span>");
    let span2= $("<span>");
    // 공연등록 유효성 검사
    $("#showtime").on("keyup",function(){
          let regex = /^[0-9]{1,10}$/;
          let result = regex.test($("#showtime").val());

          if(!result){
                $("#showtime").after(span);
                span.text("숫자만 입력할 수 있습니다.");
                span.css("color","#FF0050");
                performChk = false;
          }else{
                performChk = true;
              span.remove();
          }
    })

    $("#performPrice").on("keyup",function(){
          let regex = /^[0-9]{1,10}$/;
          let result = regex.test($("#performPrice").val());

          if(!result){
              $("#performPrice").after(span2);
              span2.text("숫자만 입력할 수 있습니다.");
              span2.css("color","#FF0050");
              priceChk = false;
          }else{
        	  priceChk = true;
              span2.remove();
          }
    })

    // 공연추가
    $("#savePerform").on("click",function() {
			if ($("#file").val() == ""
					|| $(".textArea").val() == ""
					|| $("#file").val() == ""
					|| $("#startDate").val() == ""
                || $("#endDate").val() == "") {
				alert("모든 항목은 필수 입력사항입니다.");
			}else if(performChk == false || priceChk == false){
              alert("양식을 다시 확인해주세요.");
              console.log(performChk);
              console.log(priceChk);
          	}else {
				if (confirm("추가하시겠습니까?")) {
					$("#addPerform").attr("action", "/addPerform.perform");
					$("#addPerform").attr("method", "post");
					$("#addPerform").submit();
				}
			}
		})

        
</script>
</body>

</html>
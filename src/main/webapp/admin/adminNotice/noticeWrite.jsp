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
            width: 100%;
            height: 700px;
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
        
        
        #listHr{
        	margin:5px 0px 5px 0px;
        }
        .noticeTitle>a{
            color:black;
            font-weight: bold;
        }
        #writeConfirm{
            background-color: #FF0050;
            color:white !important;
            width:100px;
            height:30px;
            border-radius: 5px;
            border:none;
            position:absolute;
            margin-right:100px;
            font-size:15px;
            line-height: 30px;
            left:20px;
            bottom:20px;
            text-align: center;
        }
        #writeConfirm:hover{
        	cursor:pointer;
        }
        #noticeContents{
        	width:1300px;
        	height:500px;
            resize: none;
            margin-top:10px;
            margin-left:130px;
            color:black;
        }      
        #cateDiv{
            margin-left:130px;
        }
        #noticeCategoryList{
            margin-top:20px;
            color:black;
        }  
        #noticeTitle{
            width:1268px;
        }
        #noticeTitleDiv{
            margin-top:20px;
            margin-left:130px;
        }
        #fileDiv{
            margin-left:130px;
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
                <div class="mainText">공지사항 작성하기</div>
                <div class="mainContents">
                    <div id="mainConArea1">
                    	<form action="/write.notice" id="form" method="post" enctype="multipart/form-data">
                            <div id="noticeTitleDiv">
                                제목
                                <input type="text" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력하세요.">
                            </div>
                            <div id="cateDiv">카테고리
                                <select id="noticeCategoryList">
                                    <option>서비스소식</option>
                                    <option>서비스오픈</option>
                                    <option>서비스점검</option>
                                    <option>서비스종료</option>
                                    <option>안내</option>
                                    <option>기타</option>
                                   </select>
                            <input type="hidden" id="noticeCategory" name="noticeCategory" value="서비스소식">
                            </div>
                            <div>
                                <textarea id="noticeContents" name="noticeContents" name="editordata"></textarea>
                            </div>
                            <div id="fileDiv"><input type="file" name="file"></div>
                            </form>                                                
                    </div>
                    <div id="writeConfirm">글 작성하기</div>
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
    </script>
	
	<script>
		// 글 작성 이벤트
		
		// 글작성버튼
		let writeConfirm = document.querySelector("#writeConfirm");
		// 카테고리값이 들어갈 input태그
		let noticeCategory = document.querySelector("#noticeCategory");
		// 카테고리 선택하는 콤보박스
		let noticeCategoryList = document.querySelector("#noticeCategoryList");
		
		// 콤보박스 목록을 선택하여 바꾼경우
		noticeCategoryList.addEventListener("change", function(){
			noticeCategory.value = this.value;
			console.log(noticeCategory);
		});
		
		writeConfirm.addEventListener("click", function(){
			if (noticeTitle.value.length==0) {
				alert("제목을 입력하세요.");
			} else if (noticeContents.value.length==0) {
				alert("내용을 입력하세요.");
			} else if (noticeTitle.value.length>30) {
				alert("제목은 30자 이하로 작성해주세요.")
			} else if (noticeContents.value.length>200) {
				alert("내용은 200자 이하로 작성해주세요.")	
			} else {
				let form = document.getElementById("form");
				form.submit();
			}
		});
	</script>
</body>

</html>
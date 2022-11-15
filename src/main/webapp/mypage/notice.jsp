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

        body {
            width: 100vw;
            background: var(--background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            padding: 0 75px;
            height: 100%;
            width: 100vw;
            margin-bottom:200px;
        }
		
		.main {
            height: 100%;
            margin-top: 8vh;
        }
        
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            font-family: "EliceDigitalBaeum-Bd";
        }
        
        /*category css*/
        .titleCategory>div>a{
        color: var(--font-color);
        font-weight: var(--font-weight);
        line-height: var(--line-height);
        }
        .titleCategory{
        width:100%;
        height: 59px;
        font-size: 28px;
        text-aline:center;
        }
        
        /* 공지사항 카테고리 */
        #notice{
        min-width: 169px;
        float:left;
        width:10vw;
        line-height: var(--line-height);
        color: var(--font-color);
        }
        
        /* 내 문의 카테고리 */
        #myInquiry{
        min-width: 253.5px;
        float:left;
        width:15vw;
        line-height: var(--line-height);
        color: var(--font-color);
        }
        
        /*division css*/
        .division {
            width: 100%;
            font-size: 20px;
            height: 35px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        
        
        /* 유형 */
        #category {
            float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
		#noticeCategory{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/* 제목 */
        #history {
            float: left;
            width: 45%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
		#noticeTitle{
			float: left;
            width: 45%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/*작성자 */
		#writer{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
		}
		#noticeWriter{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/* 작성일 */
        #date{
            float: left;
            width: 15%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        #noticeWriteDate{
        	float: left;
            width: 15%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
        }
        
        /*글 list 전체 틀*/
        .list{
		margin-top: 2vh;
		width: 100%;
		height: 41vh;
		border: 1px solid transparent;
        }
        
        /* 글 1개 div */
        .writelist{
        width: 100%;
		height: 46px;
		font-size: 18px;
		margin-top:2vh;
		margin-bottom:2vh;
		border-bottom: 1px solid rgb(255,255,255,0.3);
        }
        
        #navi{
        text-align:center;
        }
        #navi>a{
        color:white;
        margin-right: 10px;
        }
    </style>
        <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
</head>

<body>
    <div class="container">
        <div class="main">
            <div class="titleText">고객센터</div>
            <div class="titleCategory">
                    <div id="notice"><a href="/listLook.notice?cpage=1" style="color: var(--point-color);">공지사항</a></div>
                    <div id="myInquiry">
                    <a href="" id="inquiryBtn">내 문의 내역</a>
                    </div>
            </div>
            
            <div class="division">
                    <div id="category">유형</div>
                    <div id="history">제목</div>
                    <div id="writer">작성자</div>
                    <div id="date">작성일</div>
            </div>
            
            <div class="list">
            
				<c:choose>
					<c:when test="${not empty noticeBoardList}">
						<c:forEach var="n" items="${noticeBoardList }">
							<div class="writelist">
								<div id="noticeCategory">${n.noticeCategory }</div>
								<div id="noticeTitle">
									<a href="/detailLook.notice?noticeSeq=${n.noticeSeq }" style="color:white;">${n.noticeTitle }</a>
								</div>
								<div id="noticeWriter">${n.noticeWriter }</div>
								<div id="noticeWriteDate">${n.noticeWriteDate }</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         문의가 없습니다
         </c:otherwise>
				</c:choose>
				
			</div>

			<div id="navi">${naviLook }</div>
        </div>
    </div>
    
    <script>
    let loginEmail = "${loginEmail}";
    document.getElementById("inquiryBtn").addEventListener("click",function(e){
    	if (loginEmail) {
    		e.preventDefault();
    		location.href="/list.board?cpage=1";
    	    }else{
    	    	alert("로그인 후 이용할 수 있습니다.");
    	    	return false;
    	    }
    });
    </script>
</body>

</html>
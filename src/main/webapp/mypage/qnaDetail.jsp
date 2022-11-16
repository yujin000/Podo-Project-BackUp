<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
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
            --background-color: #000;
            --sub-background-color: #222;
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
            background: var(--sub-background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
            -ms-overflow-style: none;
        }
		body::-webkit-scrollbar{
  			display:none;
		}

        .container {
            padding: 0 75px;
            height: 100%;
            width: 100vw;
        }
        
        /* 1:1문의 */
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
        }
        
        /*qna css */
        .qna {
            height: 100%;
            margin-top: 8vh;
        }
        .qnalist {
            width: 100%;
            height: 47vh;
            margin-top: 5vh;
        }
        
        /*문의 유형*/
        #category {
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border-bottom: 1px solid rgb(255,255,255,0.3);
        }
        #categoryP{
    		width: 165px;
    		font-family: "Noto Sans KR", sans-serif;
    		font-weight: bold;
    		background: var(--sub-background-color);
    		color: #fff;
    		display: inline-block;
    		margin-left: 3vw;
        }
        /*제목*/
        #title {
            width: 100%;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border-bottom: 1px solid rgb(255,255,255,0.3);
        }
        #titleP{
        	width: 330px;
    		font-family: "Noto Sans KR", sans-serif;
    		font-weight: bold;
    		background: var(--sub-background-color);
    		color: #fff;
    		display: inline-block;
    		margin-left: 5.3vw;
        }
        
        /*문의내용*/
        #contents{
            width: 100%;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        #contentsDiv{
        height:33vh;
        border: 1px solid rgb(255,255,255,0.3);
        padding-left: 10px;
        padding-right: 10px;
        word-break:normal;
        word-break:break-all;
        white-space: pre-wrap;
        }
        
        /*첨부파일*/
        #file{
			width: 100%;
    		height: 35px;
    		font-size: 17px;
    		font-weight: var(--font-weight);
    		line-height: var(--line-height);
        }
        
        /*댓글*/
        #comment{
        	width: 100%;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        #commentDiv{
        height:8.5vh;
        border: 1px solid rgb(255,255,255,0.3);
        padding-left: 10px;
        }
        
        /*목록 버튼*/
        #listBtn {
            margin-top: 2vh;
            width: 6vw;
            height: 40px;
            text-align: center;
            border-radius: 5px;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border: 1px solid gray;
            cursor: pointer;
            background: var(--sub-background-color);
            color: var(--font-color);
        }
        #listBtn:hover {
            border: 1px solid silver;
        }
        
        footer {
        width: 100%;
        height: 200px;
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: transparent;
        opacity: 0.5;
      }
    </style>
</head>

<body>
    <div class="container">
    <form action="/insert.board" id="insertForm" method="post">
        <div class="qna">
            <div class="titleText">1:1 문의</div>
            <div class="qnalist">
            
					<div id="category">문의유형
						<p id="categoryP">${dtoDetail.qnaCategory }</p>
					</div>
					<div id="title">제목
                        <p id="titleP">${dtoDetail.qnaTitle }</p>
                    </div>
                    <div id="contents">문의 내용
                        <div id=contentsDiv>${dtoDetail.qnaContents }</div>     
                    </div>
            </div>
            
            <!-- 첨부파일 -->
            <div id="file">
                 첨부파일 : <a href="/download.file?sysname=${fileDto.sysName }&oriname=${fileDto.oriName}">${fileDto.oriName }</a> 
            </div>
            
            <!-- 댓글 -->
            <div>
			<c:forEach var='i' items='${qdto }'>
				<div id="comment">댓글</div>
				<div id="commentDiv">${i.qnaCommentContents }</div>
			</c:forEach>
			
            </div>
            
            <!--  목록 버튼 -->
            <div style="float:right;">
              <button type="button" id="listBtn">목록</button>
            </div>
            
        </div>
        </form>
        
        <footer>
       <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>© PODO Music Corp.</p>
    	</footer>
    	
    </div>
    <script>
    //목록버튼 이벤트
    document.getElementById("listBtn").addEventListener("click",function(){
    	history.back();
    })
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		/*공지사항*/
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
        }

        /*notice css */
        .notice {
            height: 100%;
            margin-top: 8vh;
        }

        .noticeList {
            width: 100%;
            height: 48vh;
            margin-top: 5vh;
        }
		
		/*유형*/
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
    		margin-left: 3.3vw;
    		
        }
        /*작성자*/
        #writer{
        	width: 100%;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border-bottom: 1px solid rgb(255,255,255,0.3);
        }
        #writerP{
            width: 165px;
    		font-family: "Noto Sans KR", sans-serif;
    		font-weight: bold;
    		background: var(--sub-background-color);
    		color: #fff;
    		display: inline-block;
    		margin-left: 2.4vw;
        }
        
        /*내용*/
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
        
        /* 목록 버튼*/
        #listBtn {
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
        <div class="notice">
            <div class="titleText">공지사항</div>
            <div class="noticeList">
            
					<div id="category">유형
						<p id="categoryP">${noticeDetail.noticeCategory }</p>
					</div>
					
					<div id="title">제목
                     	<p id="titleP">${noticeDetail.noticeTitle }</p>
                    </div>
                    
                    <div id="writer">작성자
                        <p id="writerP">${noticeDetail.noticeWriter }</p>         
                    </div>
                    
                    <div id="contents">내용
                         <div id=contentsDiv>${noticeDetail.noticeContents }            
                    </div>
            </div>
            
            <div id="file">
                 첨부파일 : <a href="/download.file?sysname=${noticeDetailFile.sysName }&oriname=${noticeDetailFile.oriName}">${noticeDetailFile.oriName }</a> 
            </div>
            

            <div style="float:right;">
              <button type="button" id="listBtn">목록</button>
            </div>
            
        </div>
    </div>
    
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
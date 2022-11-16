<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

         /* div { 
             border: 1px solid #fff; 
         } */

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
        
        /*공지사항*/
        #notice{
        min-width: 169px;
        float:left;
        width:10vw;
        line-height: var(--line-height);
        color: var(--font-color);
        }
        
        /*내 문의*/
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
        /*문의 유형*/
        #category {
            float: left;
            width: 30%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
        /*qnaCategory*/
		#qnaCategory{
			float: left;
            width: 30%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/*문의 내역*/
        #history {
            float: left;
            width: 55%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
        /*qnaTitle*/
		#qnaTitle{
			float: left;
            width: 55%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/*문의일*/
        #date{
            float: left;
            width: 15%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
        /*작성일 (qnaWriteDate)*/
        #qnaWriteDate{
        	float: left;
            width: 15%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
        }
        
        /*list css*/
        .list{
      		margin-top: 2vh;
      		width: 100%;
      		height: 41vh;
      		border: 1px solid transparent;
        }
        .writelist{
            width: 100%;
    		height: 55px;
    		font-size: 20px;
    		margin-top: 2vh;
    		margin-bottom: 2vh;
    		border-bottom: 1px solid rgb(255,255,255,0.3);
        }
		
		/*작성완료 버튼*/
        #writeBtn {
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
        #writeBtn:hover {
            border: 1px solid silver;
        }
        
        /*네비게이션바*/
        #navi{
        text-align:center;
        }
        #navi>a{
        color:white;
        margin-right: 10px;
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
                    <div id="notice"><a href="/listLook.notice?cpage=1">공지사항</a></div>
                    <div id="myInquiry"><a href="/list.board?cpage=1" style="color: var(--point-color);">내 문의 내역</a></div>
            </div>
            
            <div class="division">
                    <div id="category">문의 유형</div>
                    <div id="history">문의 내역</div>
                    <div id="date">문의일</div>
                </div>

			<!-- 리스트 출력 -->
			<div class="list">
			
				<c:choose>
					<c:when test="${not empty qna}">
						<c:forEach var="q" items="${qna }">
							<div class="writelist">
								<div id="qnaCategory">${q.qnaCategory }</div>
								<div id="qnaTitle">
									<a href="/detail.board?qnaSeq=${q.qnaSeq }" style="color:white;">${q.qnaTitle }</a>
								</div>
								<div id="qnaWriteDate">
								<fmt:formatDate value="${q.qnaWriteDate }" pattern="yyyy-MM-dd" />
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         문의가 없습니다
         </c:otherwise>
				</c:choose>
				
			</div>
			
			<!-- 네비게이션 바 -->
			<div id="navi">${navi }</div>
			
			<!-- 문의하기 버튼 -->
            <div style="float:right;">
              <button type="button" id="writeBtn">문의하기</button>
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
    //글 쓰기 버튼 이벤트
    document.getElementById("writeBtn").addEventListener("click", function() {
       location.href = "/mypage/qnaWrite.jsp"
    })
    </script>
</body>

</html>
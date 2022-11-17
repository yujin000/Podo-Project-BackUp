<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
		
		.main {
            height: 100%;
            margin-top: 8vh;
        }
        
        /*위시리스트*/
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            font-family: "EliceDigitalBaeum-Bd";
        }
        
        /*category css*/
        .category{
        width:100%;
        height: 59px;
        font-size: 28px;
        text-aline:center;
        }
        #home{
        float:left;
        min-width: 57.53px;
   		width:4vw;
   		line-height: var(--line-height);
        color: var(--font-color);
    	font-weight: var(--font-weight);
    	line-height: var(--line-height);
        }
        
        
        /*list css*/
        .list{
		margin-top: 1vh;
		width: 100%;
		height: 100%;
		border: 1px solid transparent;
        }
        
        .wishlist{
            height: 96px;
    		width: 100%;
    		font-size: 20px;
    		font-weight: var(--font-weight);
    		border-bottom: 1px solid rgb(255,255,255,0.3);
    		margin-top: 10px;
		}
		
        #heart{
        	float: left;
            width: 5%;
            border-width: 0 0 1px;
            line-height: 85px;
        }
        #musicImg{
        	float: left;
            width: 10%;
            border-width: 0 0 1px;
        }
        #songName{
			float: left;
            width: 25%;
            border-width: 0 0 1px;
            line-height: 75px;
		}
		#album{
            float: left;
            width: 25%;
            border-width: 0 0 1px;
            line-height: 75px;
        }
		#artistName{
			float: left;
            width: 35%;
            border-width: 0 0 1px;
            line-height: 75px;
		}
		#imgAlbum{
		width: 80px;
    	height: 80px;
		}
		.material-symbols-outlined {
  			font-variation-settings:
  			'FILL' 1,
  			'wght' 400,
  			'GRAD' 0,
  			'opsz' 48;
  			color:red;
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
            <div class="titleText">위시리스트</div>
            <div class="category">
                    <div id="home">노래</div>
            </div>
            
            <!-- 위시리스트 출력 -->
            <div class="list">
            
				<c:choose>
					<c:when test="${not empty wish}">
						<c:forEach var="w" items="${wish }">
							<div class="wishlist">
								<span class="material-symbols-outlined" id="heart">favorite</span>
								<div id="musicImg"><img src="/audio/${w.musicImg }" id="imgAlbum"> </div>
								<div id="songName">${w.musicName }</div>
								<div id="album">${w.musicAlbum }</div>
								<div id="artistName">${w.musicArtist }</div>												
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         위시리스트가 없습니다. 노래를 추가해주세요.
         </c:otherwise>
				</c:choose>
				
			</div>
			
        </div>
        
        <footer>
       <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>© PODO Music Corp.</p>
       </footer>
    	
    </div>
</body>

</html>
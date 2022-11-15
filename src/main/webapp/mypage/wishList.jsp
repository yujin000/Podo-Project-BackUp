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

/*          div {  */
/*              border: 1px solid #fff;  */
/*          } */

        body {
            width: 100vw;
            background: var(--background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            padding: 0 75px;
            height: 100%;
/* 			background-color: bisque;  */
            width: 100vw;
    		margin-bottom:200px;
        }
		
		.main {
            height: 100%;
            margin-top: 8vh;
/* 		    background-color: lightgray; */
        }
        
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            font-family: "EliceDigitalBaeum-Bd";
/* 			background-color: #00000d50; */
        }
        
        /*category css*/
        .category{
        width:100%;
        height: 59px;
        font-size: 28px;
/*         background-color:#00000d50; */
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
/*    		background-color: #00000d50; */
        }
        
        
        /*list css*/
        .list{
		margin-top: 1vh;
		width: 100%;
		height: 55vh;
		border: 1px solid transparent;
        }
        .writelist{
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
		img{
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
            
            
            <div class="list">
				<c:choose>
					<c:when test="${not empty wish}">
						<c:forEach var="w" items="${wish }">
							<div class="writelist">
								<span class="material-symbols-outlined" id="heart">favorite</span>
								<div id="musicImg"><img src="/image/music/${w.musicImg }.jpg"> </div>
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
    </div>
</body>

</html>
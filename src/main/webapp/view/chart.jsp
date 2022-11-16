<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <style>
      /* 기본 Reset css 셋팅입니다 지우지 마세요 */
      @import url(../src/css/reset.css);
      /* system font */
      @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap");
      /* event font */
      @font-face {
        font-family: "EliceDigitalBaeum-Bd";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2")
          format("woff2");
        font-weight: normal;
        font-style: normal;
      }
           /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }
      
      :root {
        --font-color: #fff;
        --background-color: #000;
        --sub-background-color: #222;
        --boder-silver: 1px solid silver;
        --main-color: #3e065f;
        --point-color: #ff00d7;
      }
      * {
        margin: 0;
        padding: 0;
        /* border: 1px solid red; */
      }
      body {
        width: 100vw;
        background: var(--sub-background-color);
        color: var(--font-color);
      }
      .container {
        padding: 0 80px;
        height: 100%;
      }

      header {
        margin-top: 50px;
        width: 100%;
        display: inline-block;
        margin-bottom: 10px;
      }

      header h1 {
        font-size: 45px;
        font-family: "EliceDigitalBaeum-Bd";
      }

      h3 {
        font-size: 30px;
        margin-bottom: 20px;
      }


 
      ul {
        width: 100%;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 0 10px;
      }
      li {
        width: 32.5%;
        min-width: 300px;
        height: 80px;
        padding: 15px 0;
        display: flex;
        margin-bottom: 10px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.3);
      }

      li img {
        width: 50px;
        display: inline-block;
      }
      li p {
        width: 100%;
        max-width: 650px;
        padding-left: 10px;
        display: block;
      }

      li p.artist {
        margin-top: 5px;
        font-size: 12px;
        color: #999;
      }
      li div {
        width: 100%;
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
      <header>
        <h1>차트</h1>
      </header>
      <div class="contents">
        <h3>Top 30</h3>
        <ul>
          <c:choose>
            <c:when test="${not empty list}">
              <c:forEach var="i" items="${list}">
                <li>
                  <a href="" id="selectChart">
                    <img src="/image/music/${i.musicImg}" alt="" />
                  </a>
                  <div>
                    <p class="musicName" data-index="${i.musicChart }">${i.musicSeq}&nbsp; ${i.musicName}</p>
                    <p class="artist">
                      &nbsp;&nbsp;&nbsp;&nbsp; ${i.musicArtist}
                    </p>
                  </div>
                </li>
              </c:forEach>
            </c:when>
            <c:otherwise> error! </c:otherwise>
          </c:choose>
        </ul>
      </div>
      
          <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    </div>



    <script type="text/javascript">
      let select = document.getElementById("selectChart");

      select.onclick = function () {
        $.ajax({
          url: "/add.wish",
          type: "get",
          data: {
            musicSeq: musicList[playIndex].musicSeq,
          },
        });
      };
    </script>
    
    <script type="text/javascript">
    	// 차트 목록을 받는 배열
    	let musicChartList = new Array();
    	<c:forEach items="${list }" var="i">
		musicChartList.push({
			musicSeq : "${i.musicSeq}",
			musicName : "${i.musicName}",
			musicArtist : "${i.musicArtist}",
			musicAlbum : "${i.musicAlbum}",
			musicImg : "${i.musicImg}",
			musicMp3 : "${i.musicMp3}",
			musicChart : "${i.musicChart}",
			musicLylics : "${i.musicLylics}"
			});
		</c:forEach>
		    			
// 			노래 클릭시 차트 목록이 컨트롤러 목록에 뿌려지며, 해당 노래가 재생된다.		
// 			let membership = "${loginMembership}";
// 				if (membership=="admin" || membership=="vip") {
// 				$(".musicName").on("click", function(){
// 					parent.playList = musicChartList;
// 					parent.playIndex = parseInt(this.getAttribute("data-index"))-1;
// 					parent.listMusic();
// 					parent.loadMusic(parent.playIndex);				
// 					parent.playMusic();
// 				});
// 			};		
		
    </script>
  </body>
</html>

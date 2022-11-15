<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PODO</title>
	
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link rel="stylesheet" href="src/css/style.css" />
            <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    <style>
      #mypage {
        width: 100%;
        height: 50px;
        text-align: center;
        line-height: 50px;
        border-top: 1px solid silver;
        border-bottom: 1px solid silver;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #mypage > img {
        width: 30px;
        height: 30px;
        border-radius: 40px;
        margin-left: 10px;
      }
      #mypage > span {
        width: 140px;
        text-align: left;
        margin-left: 10px;
      }
      .tog {
        width: 140px;
        right: 24px;
        padding: 10px 0px;
        top: 150px;
        float: right;
        border: none;
        position: absolute;
        border-radius: 4px;
        display: none;
        background: #222;
        opacity: 0.9;
      }
      .playlist img{
      	width:20px;
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <div id="Header">
        <h1 id="logo">
          <a href="home.jsp"><img src="image/web/logo-f-5.png" alt="" /></a>
        </h1>
        <div id="LoginBox">
          <c:choose>
            <c:when test="${loginEmail != null}">
              <div id="mypage">
                <img src="image/web/profile-default.jpg" alt="" /><span
                  >${loginNickname}</span
                >
              </div>
              <ul class="tog">
                <li><a id="mypageBtn">마이페이지</a></li>
                <c:choose>
                  <c:when test="${loginMembership eq 'admin'}">
                    <li><a href="/adminMain.adminMain">관리자페이지</a></li>
                  </c:when>
                </c:choose>
                <li><a href="#">계정설정</a></li>
                <li><a href="#">친구초대 </a></li>
                <li><a href="logout.member">로그아웃</a></li>
              </ul>
            </c:when>
            <c:otherwise>
              <a class="loginBtn" href="/member/loginForm.jsp">로그인</a>
            </c:otherwise>
          </c:choose>
        </div>

        <input type="search" placeholder="MUSIC 검색" id="search" />

        <!-- login 성공 시  -->
        <div id="GNB">
          <ul>
            <li><a id="today">투데이</a></li>
            <li><a id="chart">차트</a></li>
            <li><a id="wishBtn">위시리스트</a></li>
            <li><a id="station">스테이션</a></li>
            <li><a id="mag">매거진</a></li>
            <li><a id="serviceBtn">고객센터</a></li>
          </ul>
        </div>
        <div id="events">
          <ul>
            <li>EVENT1</li>
            <li>EVENT2</li>
            <li>EVENT3</li>
          </ul>
        </div>

        <div id="FloatArea">
          <a id="membership">멤버쉽 구독</a>
          <a id="ticketing">포도 티켓</a>
        </div>
        <a href="" class="service">서비스 소개</a>
      </div>

      <iframe
        src="/view/main.jsp"
        width="100%"
        height="100%"
 
        style="display: block; padding-left: 230px; border: none;"
        id="iframe"
      ></iframe>
      <c:choose>
        <c:when
          test="${loginMembership eq 'admin' || loginMembership eq 'vip'}"
        >
          <div id="MusicControl">
            <div class="hidden">
              <div>	
                    <img src="image/web/album-p.png" alt="">	
                </div>
              <ul>
              
              </ul>
            </div>
            <div class="gageBar" id="gageBar">
              <div class="gage" id="gage"></div>
            </div>
            <div class="controller">
              <ul class="musicInfo">
                <li>
                  <img
                    src="/image/web/album-p.png"
                    alt="/image/web/album-p.png"
                    id="musicImg"
                  />
                </li>
                <li id="playInfo">
                  <strong id="playTitle">title</strong>
                  <p id="playArtist">name</p>
                </li>
                <li>
                  <button>
                    <span
                      class="material-symbols-rounded"
                      id="wish"
                      data-wish="false"
                      title="위시리스트 추가"
                    >
                      favorite
                    </span>
                    <!-- 								<img src="/image/web/favorite_fill0.png"> -->
                  </button>
                </li>
                <li>
                  <button>
                    <span class="material-symbols-rounded">
                      library_books
                    </span>
                  </button>
                </li>
              </ul>
              <ul class="controlBtn">
                <li><span class="material-symbols-rounded"> repeat </span></li>
                <li>
                  <span class="material-symbols-rounded" id="playPrev">
                    skip_previous
                  </span>
                </li>
                <li>
                  <audio
                    id="playAudio"
                    data-status="pause"
                    title="재생/일시정지 선택"
                  ></audio>
                  <span class="material-symbols-rounded" id="playBtn">
                    play_arrow
                  </span>
                </li>
                <li>
                  <span class="material-symbols-rounded" id="playNext">
                    skip_next
                  </span>
                </li>
                <li><span class="material-symbols-rounded"> replay </span></li>
              </ul>

              <ul class="volume">
                <li>
                  <div>
                    <span id="currentTimeText">0 : 00</span><span> / </span
                    ><span id="entireTimeText">0 : 00</span>
                  </div>
                </li>
                <li>
                  <a
                    ><span class="material-symbols-rounded" id="volumeMute">
                      volume_up
                    </span></a
                  >
                </li>
                <li><input type="range" id="volumeBar" min="0" max="100" /></li>
                <li>
                  <a id="openList"
                    ><span class="material-symbols-rounded">
                      queue_music
                    </span></a
                  >
                </li>
              </ul>
            </div>
          </div>
        </c:when>
      </c:choose>
    </div>


    <script>
      // openList button toggle
      let ow = document.getElementById("openList");
      $(ow).click(function () {
        $(".hidden").toggle();
      });
    </script>
    <script>
      // loginBox button toggle
      let lb = document.getElementById("mypage");
      $(lb).click(function () {
        $(this).next(".tog").fadeToggle();
      });
    </script>
    <script>
      // login page move action
      $(".loginBtn").click(function () {
        $("#loginPage").fadeIn(450).css("display", "block");
        $("#test").css("display", "none");
        $("#main").css("display", "none");
      });
    </script>
    <script>
      // list page move action
      $("#today").click(function () {
        $("#iframe").attr("src", "/mainList.music");
      });
      $("#chart").click(function () {
        $("#iframe").attr("src", "/chart.music");
      });
      $("#wishBtn").click(function () {
    	let loginEmail = "${loginEmail}";
        if (loginEmail) {
      	$("#iframe").attr("src", "/list.wish");
        }else{
        	alert("로그인 후 이용할 수 있습니다.");
        	return false;
        }
      });
      $("#mag").click(function () {
        $("#iframe").attr("src", "/view/mag.jsp");
      });
      $("#station").click(function () {
        $("#iframe").attr("src", "/view/station.jsp");
      });
      $("#mypageBtn").click(function () {
        $("#iframe").attr("src", "/mypage.member");
      });
      let loginEmail = "${loginEmail }";
      $("#ticketing").click(function () {
        $("#iframe").attr("src", "/list.perform");
      });
      $("#serviceBtn").click(function () {
        $("#iframe").attr("src", "/listLook.notice?cpage=1");
      });
      $("#membership").click(function () {
          $("#iframe").attr("src", "/index.goods");
      });
      
    </script>
    <script>
      let membership = "${loginMembership}";
      if (membership=="admin" || membership=="vip") {
      // Music Controller 부분
        	// 목록페이지 전체 div값
        	const musicListPage = document.querySelector(".hidden ul");
        	musicListPage.setAttribute("id","변수확인용");
        	// 현재 곡 번호 offset
        	let playIndex = 0;
        	// 플레이/일시정지 버튼
        	const playBtn = document.querySelector("#playBtn");
        	// 이전/다음 재생 버튼
        	const playPrev = document.querySelector("#playPrev");
        	const playNext = document.querySelector("#playNext");
        	// 오디오를 재생할 a태그 및 초기화
        	const playAudio = document.querySelector("#playAudio");
        	// 좌측 하단에 뜨는 재생 정보
        	const playInfo = document.querySelector("#playInfo");
        	const musicImg = document.querySelector("#musicImg");
        	
        	const playTitle = document.querySelector("#playTitle");
        	const playArtist = document.querySelector("#playArtist");
        	// 컨트롤러 볼륨 바
        	const volumeBar = document.querySelector("#volumeBar");
        	playAudio.volume = volumeBar.value/100; // 처음 홈페이지에 들어왔을 때, 컨트롤러 볼륨 초기화.
        	// 음소거 버튼
        	const volumeMute = document.querySelector("#volumeMute");
        	// 타이머 관련 변수 선언
        	const gage = document.querySelector("#gage"); // 현재 시간바
        	const gageBar = document.querySelector("#gageBar"); // 전체 시간바
        	const currentTimeText = document.querySelector("#currentTimeText"); // 화면에 표시되는 재생시간대 타이머
        	const entireTimeText = document.querySelector("#entireTimeText"); // 화면에 표시되는 전체 재생시간
        	// 위시리스트 변수 선언
        	const wish = document.querySelector("#wish");
        	// music list array
        	let musicList = new Array();
        		<c:forEach items="${musicList }" var="i">
        			musicList.push({
        				musicSeq : "${i.musicSeq}",
        				musicName : "${i.musicName}",
        				musicArtist : "${i.musicArtist}",
        				musicAlbum : "${i.musicAlbum}",
        				musicImg : "${i.musicImg}",
        				musicMp3 : "${i.musicMp3}",
        				musicChart : "${i.musicChart}",
        				musicLylics : "${i.musicLylics}"
        			})
        		</c:forEach>
        	// 페이지 첫 화면 접속시, 받은 목록에서 기본 재생곡으로 맨 앞 곡을 선택해준다.
        	playAudio.setAttribute("src","/audio/" + musicList[playIndex].musicMp3 + ".mp3");
        	// 좌측 하단에 재생대기중인 음원의 정보를 표시한다.
        	playTitle.innerHTML = musicList[playIndex].musicName;
        	playArtist.innerHTML = musicList[playIndex].musicArtist;
        	musicImg.src = `/image/music/\${musicList[playIndex].musicImg}.jpg`;
        	// 각 함수 구현
        	// 재생 함수
        	function playMusic() {
      			playAudio.setAttribute("data-status", "play");
      			playAudio.play();
      			playBtn.innerText = "pause";
      			wishExist();
        	};
        	// 일시정지 함수
        	function pauseMusic() {
        		playAudio.setAttribute("data-status", "pause");
      	playAudio.pause();
      	playBtn.innerText = "play_arrow";
        	}
        	// 음악 정보 가져오기 함수
        	function loadMusic(index) {
            	playTitle.innerHTML = musicList[playIndex].musicName;
            	playArtist.innerHTML = musicList[playIndex].musicArtist;
            	musicImg.src = `/image/music/\${musicList[index].musicImg}.jpg`;
            	playAudio.setAttribute("src","/audio/" + musicList[index].musicMp3 + ".mp3");
        	}
        	// 이전 곡 듣기 함수
        	function prevMusic(){
        		playIndex--;
        		playIndex < 0 ? playIndex = musicList.length-1 : playIndex = playIndex;
        		loadMusic(playIndex);
        		playMusic();
        	}
        	// 다음 곡 듣기 버튼
        	function nextMusic(){
        		playIndex++;
        		playIndex > musicList.length-1 ? playIndex = 0 : playIndex = playIndex;
        		loadMusic(playIndex);
        		playMusic();
        	}
        	// 위시리스트 여부에 따라 하트모양을 바꿔주는 함수
        	function wishExist(){
        		$.ajax({
        			url : "/exist.wish",
        			type : "get",
        			data:{
        				"musicSeq" : musicList[playIndex].musicSeq
        			},
        			dataType:"json"
        		}).done(function(resp){
        			let result = JSON.parse(resp);
        			if (result==false) {
        				$("#wish").html("favorite");
        				$("#wish").css({
                            "font-variation-settings":"'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 48",
                            "color":"white"});
        				$("#wish").attr("title","위시리스트 추가");
        				$("#wish").attr("data-wish","false");
        			} else {
        				$("#wish").html("favorite");
        				$("#wish").css({
                            "font-variation-settings":"'FILL' 1,'wght' 400,'GRAD' 0,'opsz' 48",
                            "color":"red"});
        				$("#wish").attr("title","위시리스트 제거");
        				$("#wish").attr("data-wish","true");
        			}
        		});
        	};
        	// 처음 페이지에서 위시리스트 여부를 판별해준다.
        	wishExist();
        	// 컨트롤러 타이머 구현
        	playAudio.addEventListener("timeupdate", e=>{
        		const currentTime = e.target.currentTime;
        		const entireTime = e.target.duration;
        		let currentBar = (currentTime/entireTime)*100; // %값이므로 100을 곱해준다.
        		gage.style.width = `\${currentBar}%`; // 재생시간 진행에 따라 타이머 바가 증가한다.
        		let entireMin = Math.floor(entireTime/60); // 음악 전체시간 (분)
        		let entireSec = Math.floor(entireTime%60); // 음악 전체시간 (초)
        		if (entireSec < 10) {
        			entireSec = `0\${entireSec}`;
        		} // 10초 미만인 경우, 앞에 0을 붙인다.
        		// 화면에 전체 시각 출력
        		entireTimeText.innerText = `\${entireMin} : \${entireSec}`;
        		// 컨트롤러가 음원을 받아온 직후
        		playAudio.addEventListener("loadeddata", function() {
        			let audioDuration = playAudio.duration;
        			let loadEntireMin = Math.floor(audioDuration/60);
            		let loadEntireSec = Math.floor(audioDuration%60);
            		if (loadEntireSec < 10) {
            			loadEntireSec = `0\${loadEntireSec}`;
            		}
            		//화면에 재생 진행 시각 출력
            		entireTimeText.innerText = `\${loadEntireMin} : \${loadEntireSec}`;
        		});
        		let currentMin = Math.floor(currentTime/60);
        		let currentSec = Math.floor(currentTime%60);
        		if (currentSec < 10) {
        			currentSec = `0\${currentSec}`;
        		}
        		//화면에 재생 진행 시각 출력
        		currentTimeText.innerText = `\${currentMin} : \${currentSec}`;
        	});
        	// 타이머 클릭시, 해당 시점을 재생하는 이벤트 구현
        	gageBar.addEventListener("click", function(e){
        		let gageBarWidth = gageBar.clientWidth;
        		let timerOffsetX = e.offsetX;
        		playAudio.currentTime = (timerOffsetX / gageBarWidth) * playAudio.duration;
        		playMusic();
        	});
        	// PlayList 목록을 출력하는 함수
        	function listMusic(){
        		musicListPage.innerHTML = "";
        		for (let i=0; i<musicList.length; i++) {
            		// 각 목록값이 들어갈 li 태그
            	    let li = `
            	    <li class="playList" data-index="\${i}">
                            <div>
                            <img src ="image/music/\${musicList[i].musicImg}.jpg" ></div>
                            <div>
                            <p>\${musicList[i].musicName}</p>
                            <p>\${musicList[i].musicArtist}</p>
                        </div>
                        </li>
                    `;
            		musicListPage.insertAdjacentHTML("beforeend",li);
            	}	
        	};
        	
        	listMusic();
        	
        	// 재생/일시정지 버튼 클릭시
        	playBtn.addEventListener("click",function (){
        		// 일시정지 상태에서 재생버튼을 클릭시 재생
        		if (playAudio.getAttribute("data-status") == "pause") {
        			playMusic();
        		} else if (playAudio.getAttribute("data-status") == "play") {
        			pauseMusic();
        		}
        	});
        	// 이전 버튼 클릭시
        	playPrev.addEventListener("click", function(){
        		prevMusic();
        	});
        	// 다음 버튼 클릭시
        	playNext.addEventListener("click", function(){
        		nextMusic();
        	});
        	// 노래가 끝나고 다음곡 자동재생
        	playAudio.addEventListener("ended", function(){
        		nextMusic();
        	})
        	// 컨트롤러 볼륨 조절
        	volumeBar.addEventListener("change", function(){
        		playAudio.volume = this.value/100;
        	});
        	volumeBar.addEventListener("mousemove", function(){
        		playAudio.volume = this.value/100;
        	});
        	// 음소거 버튼 클릭시 음소거
        	volumeMute.addEventListener("click", function(){
        		if (playAudio.muted) {
        			playAudio.muted = false;
        			volumeMute.innerText = "volume_up";
        		} else {
        			playAudio.muted = true;
        			volumeMute.innerText = "volume_off";
        		}
        	});
        	// 목록 클릭시, 해당 노래가 재생
        	let playList = document.querySelectorAll(".playList");
        	for (let i=0; i<playList.length; i++) {
        			playList[i].addEventListener("click", function(){
        			playIndex = this.getAttribute("data-index");
        			loadMusic(playIndex);
        			playMusic();
        		});
        	};
        	// 위시리스트 추가
        	$("#wish").on("click",function(){
        		if ($("#wish").attr("data-wish")=="false") {
        			$.ajax({
            			url:"/add.wish",
            			type:"get",
            			data:{
            				"musicSeq" : musicList[playIndex].musicSeq
            			}
            		}).done(function(){
            			wishExist();
            		});
        		} else {
        			$.ajax({
            			url:"/del.wish",
            			type:"get",
            			data:{
            				"musicSeq" : musicList[playIndex].musicSeq
            			}
            		}).done(function(){
            			wishExist();
            		});
        		}
        	});
      }
    </script>

  </body>
</html>
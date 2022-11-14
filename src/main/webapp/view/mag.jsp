<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
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
      }
      body {
        width: 100vw;
        height: 100vmax;
        background: var(--sub-background-color);
        color: var(--font-color);
      }
      .container {
        width: 100%;
        padding: 0 50px;
        display: block;
      }

      header {
        margin-top: 50px;
        width: 100%;
        display: inline-block;
        margin-bottom: 10px;
      }

      header h1 {
        width: 100%;
        display: inline-block;
        font-size: 45px;
        font-family: "EliceDigitalBaeum-Bd";
      }

      h3 {
        width: 100%;
        display: inline-block;
        font-size: 30px;
        margin-bottom: 20px;
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

      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }

      ul {
        width: 100%;
        margin-top: 30px;
        display: flex;
        flex-wrap: wrap;
        justify-content: start;
        gap: 0 20px;
      }
      li {
        width:302px;
        margin-bottom: 20px;
        position: relative;
        align-items: center;
        /* text-align: center; */
      }

      li a.playBtn {
        width: 50px;
        height: 50px;
        position: absolute;
        top: 36%;
        left: 2%;
        opacity: 0;
        transition: all 0.5s;
        /* 서서히 나타내는 효과 */
      }

      .playBtn:hover {
        opacity: 1;
      }
      li .material-symbols-outlined {
        font-size: 70px;
        color: white;
        display: inline-block;
      }
      li p {
        display: block;
        color: #fff;
        font-size: 1rem;
        margin: 0 auto;
        margin-top: 5px;
        font-weight: 700;
      }

      li strong {
        display: block;
        color: var(--point-color);
        font-size: 0.9rem;
        margin-bottom: 5px;
      }
      li span {
        color: silver;
      }
      li div {
        width: 100%;
      }

      .banner {
        width: 100%;
        text-align: center;
        display: flex;
        justify-content: start;
      }

      .banner img:nth-child(1) {
        width: 32%;
        display: inline-block;
      }
      .banner img:nth-child(2) {
        width: 68%;
        display: inline-block;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <header>
        <h1>매거진</h1>
      </header>
      <div class="banner">
        <img src="../image/web/main_cover_1.png" alt="" />
        <img src="../image/web/main_cover_2.png" alt="" />
      </div>
      <div class="contents">
        <ul>
          <li>
            <img src="../image/web/cover-1.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>이주의 디깅# 146</p>
            <strong>이찬혁</strong>
            <span
              >악뮤의 이찬혁이 첫 솔로 앨범 Error 를 발표했다. 앨범에는 이찬혁의
              생각의 흐름을 담은 신곡 11곡이 세밀하게 배치되어 있어 그의 고민과
              메시지를 엿볼 수 있으며, 음악 방송 등을 통해 보여준 기묘하고
              독특한 퍼포먼스 역시 큰 관심을 끌고 있다. 이번 앨범을 통해 그가
              말하고자 하는 것은 무엇일지
            </span>
          </li>
          <li>
            <img src="../image/web/cover-2.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>그림 같은 한 해를 만들어낸</p>
            <strong>박장현, 조연호, 이병찬</strong>
            <span
              >살다 보면 가끔 보고도 믿기지 않는 순간들이 있다. 마이크를 쥔
              박장현, 조연호, 이병찬이 무대에서 노래를 했을 때가 그랬다. 빼어난
              보컬과 퍼포먼스 실력을 갖춘 이들이 뿜어내는 흥미로운 에너지는
              앞으로 써갈 새로운 이야기를 기대케 한다
            </span>
          </li>
          <li>
            <img src="../image/web/cover-3.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>쇼미더머니 11</p>
            <strong>화제의 참가자는?</strong>
            <span
              >어김없이 올해도 “쇼미더머니”가 돌아왔다. 한국 오디션 프로그램
              최초로 열한 번째 시즌을 맞이한 <쇼미더머니>는 시즌마다 루키 래퍼
              혹은 랩 스타를 배출해 냈다. 미리 공개된 정보에 의하면 이번 시즌의
              경우에는 기본기가 충실하고, 랩 그 자체에 충실한 참가자들이 등장해
              좋은 모습을 보일 거라고 한다.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-4.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>막을 수 없는 에너지</p>
            <strong>르세라핌</strong>
            <span
              >겁 없이 데뷔한 르세라핌이 기세를 몰아 두 번째 앨범으로 돌아온다.
              어떤 시련이 와도 당당하게 맞서겠다는 한 단계 더 진화한 메시지로
              대담한 길을 걸어가는 르세라핌에게 이 강렬한 에너지가 어디에서
              나오는지 물었다.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-5.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>New Release #115 :</p>
            <strong>테일러 스위프트, (여자) 아이들</strong>
            <span
              >새 앨범으로 폭발적인 반응을 얻고 있는 테일러 스위프트부터
              'Nxde'로 강렬한 메시지와 함께 돌아온 (여자)아이들까지. 지금
              주목해야 할 신곡들을 VIBE 매거진에서 확인하세요.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-6.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>홀로 선</p>
            <strong>백호</strong>
            <span
              >데뷔 11년 만에 처음 내는 솔로 앨범은 백호 자신에게도 팬들에게도
              감격 그 자체다. 우리가 사랑한 백호의 익숙한 매력 그리고 자신도
              낯설만큼 새로운 매력을, 한땀한땀 직접 만든 앨범 속에 터질 듯이 꽉
              채웠다.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-7.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>이주의 디깅 #145</p>
            <strong>(여자) 아이들</strong>
            <span
              >4세대 걸그룹의 시대를 활짝 연 아이들이 미니 앨범으로 돌아왔다.
              역시나 음원과 앨범 차트에서 좋은 성적을 거두며 새로운 기록을 써
              내려가고 있다. 특히 미니 앨범의 타이틀곡 ‘Nxde’는 음악뿐만 아니라
              뮤직비디오까지 마치 뮤지컬 영화를 듣고 보는 듯하다. 그렇다면
              이주의 디깅에서는 아이들과 함께 뮤
            </span>
          </li>
          <li>
            <img src="../image/web/cover-8.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>New Release #116 :</p>
            <strong>방탄소년단 진, 리아나</strong>
            <span
              >L솔로 음악을 발표한 방탄소년단 진, 6년 만에 신작을 내놓은
              리아나까지. 지금 주목해야 할 신곡들을 VIBE 매거진에서 확인하세요.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-9.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>언제나 영화처럼,</p>
            <strong>쎄이의 시네마</strong>
            <span
              >데뷔하자마자 ‘완성형 아티스트’로 불린다는 건 어쩌면 꽤 막중한
              부담일 것이다. 그 무게만큼 많은 고민을 거쳐 4년간 공들여 다듬은
              2번째 정규앨범을 내는 뮤지션 쎄이가 지난 시간을 흑백영화
              장면들처럼 회상했다.
            </span>
          </li>
          <li>
            <img src="../image/web/cover-10.png" alt="" />
            <a href="" class="playBtn">
              <span class="material-symbols-outlined"> play_circle </span>
            </a>
            <p>New Release #117 :</p>
            <strong>셀레나 고메즈, 조지</strong>
            <span
              >투병기가 담긴 다큐 공개 후 새 음악을 발표한 셀레나 고메즈, 정통
              클래식 앨범을 선보이는 젊은 음악가 대니 구까지. 지금 주목해야 할
              신곡들을 VIBE 매거진에서 확인하세요.
            </span>
          </li>
        </ul>
      </div>
    </div>

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    <script type="text/javascript">
      let playBtn = document.getElementById("playBtn");
    </script>
  </body>
</html>

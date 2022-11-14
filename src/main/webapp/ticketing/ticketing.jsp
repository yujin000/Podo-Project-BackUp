<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
 <style>
        /* 기본 Reset css 셋팅입니다 지우지 마세요 */
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
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            width: 100vw;
            background: var(--sub-background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .wrap {
            padding: 0 40px;
            width: 100%;
            height: 100%;
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
            display: none;
            /* Chrome, Safari, Opera*/
        }

.logoName {
	font-weight: bold;
}

.contents {
	max-width: 1610px;
	min-width: 1610px;
	position: relative;
	height: 100%;
	margin: 20px;
}

.contentsTitle {
	display: flex;
	text-align: center;
	margin-top: 30px;
	max-width: 1610px;
	min-width: 1610px;
	flex-wrap: wrap;
	justify-content: left;
	gap: 0px 15px;
}

.perform {
	margin: 0 0 40px 0;
}

.header {
	margin-top: 30px;
}

a {
    color: white;
	text-decoration: none;
}

.nameTop {
	display: flex;
	align-items: center;
	justify-content: space-around;
	margin: 30px 0px 30px 0px;
	height: 80px;
	width: 1574px;
	border-top: 1px solid rgba(255, 255, 255, 0.5);
	border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	font-size: 20px;
}

.listimg {
	display: flex;
}

.imgset {
	margin-right: 20px;
}

.listset {
	width: 595px;
}

.listset1 {
	width: 185px;
}

.flexli {
	display: flex;
	align-items: center;
}

.saleText {
	width: 65px;
	text-align: center;
	border: 1px solid rgba(255, 0, 215);
	/* color: #ff00d7; */
}

.container {
	padding: 0 40px;
	width: 100%;
	height: 100%;
}
</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<h1 class="logoName">
				<p style="color: white;">
					<img src="image/perform/logo-f-b.png" alt="">티켓
				</p>
				<div><a href="/ticketList.perform">예매내역</a></div>
			</h1>
		</div>
		<div class="contents">
			<div class="contentsTitle">

				<div class="imgTop">
					<a href="/performDetail.perform?performSeq=${perform[3].performSeq }"
						style="color: var(- -font-color);"> <img
						src="image/perform/${perform[3].poster }"
						style="width: 308px; height: 420px;">
					</a>
					<p>${perform[3].performTitle }</p>
					<p style="color: lightgray;">허밍어반스테레오, 리소, 밴젝스, 예슬...</p>
				</div>

				<div class="imgTop">
					<a href="/performDetail.perform?performSeq=${perform[11].performSeq }"
						style="color: var(- -font-color);"> <img
						src="image/perform/${perform[11].poster }"
						style="width: 308px; height: 420px;">
					</a>
					<p>${perform[11].performTitle }</p>
					<p style="color: lightgray;">진짜배기 록밴드 동이혼의 폭발!</p>
				</div>
				<div class="imgTop">
					<a href="/performDetail.perform?performSeq=${perform[13].performSeq }"
						style="color: var(- -font-color);"> <img
						src="image/perform/${perform[13].poster }"
						style="width: 308px; height: 420px;">
					</a>
					<p>${perform[13].performTitle }</p>
					<p style="color: lightgray;">새로운 의미를 담은 곡들 대방출!</p>
				</div>
				<div class="imgTop">
					<a href="/performDetail.perform?performSeq=${perform[12].performSeq }"
						style="color: var(- -font-color);"> <img
						src="image/perform/${perform[12].poster }"
						style="width: 308px; height: 420px;">
					</a>
					<p>${perform[12].performTitle }</p>
					<p style="color: lightgray;">PODO티켓 단독 NFT 증정</p>
				</div>
				<div class="imgTop">
					<a href="/performDetail.perform?performSeq=${perform[1].performSeq }"
						style="color: var(- -font-color);"> <img
						src="image/perform/${perform[1].poster }"
						style="width: 308px; height: 420px;">
					</a>
					<p>${perform[1].performTitle }</p>
					<p style="color: lightgray;">회색단지부터 ㅠㅠ까지</p>
				</div>

			</div>
			<div class="nameTop">
				<div style="width: 10px;"></div>
				<div class="nametitle">공연명</div>
				<div style="width: 10px;"></div>
				<div class="nametitle">공연일시</div>
				<div class="nametitle">공연장소</div>
			</div>

			<c:forEach items="${perform }" var="p" begin="0" end="10" step="1">
				<div class="perform1">
					<div class="perform">
						<ul class="listimg">
							<li><a href="/performDetail.perform?performSeq=${p.performSeq }" style="color: var(- -font-color);"> 
							<img src="image/perform/${p.poster }" style="width: 130px; height: 180px;" class="imgset">
							</a></li>

							<li
								style="margin: 20px 0 0 0; max-width: 820px; min-width: 820px;">
								<div class="saleText">판매중</div> <br> 
								<a href="/performDetail.perform?performSeq=${p.performSeq }" style="color: var(- -font-color);">${p.performTitle} </a></li>
							<li class="flexli" style="width: 350px;">
							<fmt:formatDate value="${p.startDate }" pattern="yyyy-MM-dd" /> - 
							<fmt:formatDate value="${p.endDate }" pattern="yyyy-MM-dd" /></li>
							<li class="flexli">${p.theaterName}</li>
						</ul>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
</body>

</html>
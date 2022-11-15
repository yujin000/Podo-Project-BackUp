<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
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
            margin-left: 165px;
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

        .MidContents2 {
            display: flex;
            align-items: center;
            justify-content: end;
            margin: 30px 0px 0px 0px;
            height: 100px;
            width: 1574px;
            border-top: 1px solid rgba(255, 255, 255, 0.5);
            border-bottom: 1px solid rgba(255, 255, 255, 0.5);
            font-size: 20px;
        }

        .BtnCss a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 140px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            border-radius: 5px;
            font-family: "EliceDigitalBaeum-Bd";
            font-size: 20px;
            background-image: linear-gradient(#000, #000),
                linear-gradient(to right, #3e065f 0%, #ff00d7 100%);
            border: 1px solid transparent;
            border-radius: 5px;
            background-origin: border-box;
            background-clip: content-box, border-box;
            margin-bottom: 10px;
        }

        .BtnCss:nth-child(1) a {
            position: relative;
            right: 10%;
            width: 250px;
        }

        .BtnCss a:hover {
            color: #fff;
        }

        .BtnCss a {
            color: silver;
        }

        .seat {
            width: 45px;
            height: 45px;
            margin: 0 10px 10px 0;
        }

        .clicked {
            background-color: red;
            color: white;
        }

        .soldout {
            background-color: #d0a4ed;
        }

        .front {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 15px 0px 10px 90px;
            width: 300px;
            height: 20%;
            background-color: lightgray;
            border-radius: 3px;
            transform: perspective(250px) rotateX(-40deg);
            border: 1px solid;
        }

        .seatContainer {
            background-color: #fff;
            width: 30%;
            margin-left: 3%;
            border: 1px solid rgba(255, 0, 215);
            ;
            border-radius: 5px;
        }

        .headerTitle {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .titleName {
            width: 468px;
            height: 50px;
        }

        .performName {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30%;
            height: 50px;
            font-size: 20px;
            border: 1px solid rgba(255, 0, 215);
            border-radius: 8px;
            margin-left: 27px;
        }

        .seatInfom {
            display: flex;
            justify-content: center;
            padding: 3% 0 3% 0;
            width: 250px;
            height: 250px;
            background-color: #fff;
            color: black;
            margin-top: 2%;
            margin-left: 3%;
            border-radius: 5px;
        }

        .seatPrice {
            display: flex;
            justify-content: center;
            margin-left: 110px;
            width: 10%;
            height: 50px;
            font-size: 20px;
            padding-top: 50px;
        }
        .container {
			    padding: 0 0px 200px 40px;
			width:100%;
			height: 100%;
		}
    </style>
</head>

<body>
	<form action="/payment.perform" id="formSub" method="post">
	<input type="hidden" value="${performSeq }" name="performSeq">
	<input type="hidden" value="${list.performTitle }" name="performTitle">
	<input type="hidden" value="${list.theaterName }" name="theaterName">
	<input type="hidden" value="${list.performPrice }" name="performPrice">
	<input type="hidden" value="${seat.seatNum }" name="seatNum">
	<input type="hidden" value="${list.rating }" name="rating">
    <div class="container">
        <div class="header">
            <h1 class="logoName"><img src="image/perform/logo-f-b.png" alt="">
                티켓</h1>
        </div>
        <div class="contents">
            <div class="headerTitle">
                <div class="titleName" style="font-size: 32px;">좌석 선택</div>
                <div class="performName">${list.performTitle }</div>
                <div class="seatPrice">좌석/공연가격</div>
            </div>
            <div class="contentsTitle">
                <a style="color: var(--font-color);">
                    <div class="imgTop">
                        <img src="image/perform/${list.poster }" style="width: 268px; height: 380px;">
                    </div>
                </a>

                <div class="seatContainer">
                    <div class="front" style="color: black;">Stage</div>
                    <div class="seat-wrapper" id="${performSeq }"></div>
                </div>

                <div class="seatInfom">
                    <div>
                        <ul>
                            <li style="margin-bottom: 5px;">
                                <img src="image/perform/concert.png" alt=""width="20px" height="20px">
                                <a style="margin-left: 5px;">${list.theaterName }</a>
                            </li>
                            <li>
                                <img src="image/perform/gray2.png" alt=""width="20px" height="20px">
                                <a style="margin-left: 5px;">25석 / ${list.performPrice }</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="MidContents2">
                <div class="BtnCss">
                    <a class="payment">결제하기</a>
                </div>
            </div>
        </div>
    </div>
    </form>
    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
</body>
<script>

	let performList = new Array();
	performList.push({
			performSeq : "${performSeq }",
		})
	
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";
    let count = 0;
    for (let i = 0; i < 5; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 5; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            input.idList = performList[0].performSeq;
            
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function (e) {
                if (count < 1) {
                    console.log(e.target.value);
                    //중복방지 함수
                    selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                    //click class가 존재할때(제거해주는 toggle)
                    if (input.classList.contains("clicked")) {
                        input.classList.remove("clicked");
                        clicked = document.querySelectorAll(".clicked");
                        selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                        clicked.forEach((data) => {
                            selectedSeats.push(data.value);
                        });
                        count--
                        //click class가 존재하지 않을때 (추가해주는 toggle)

                    } else {
                        input.classList.add("clicked");
                        clicked = document.querySelectorAll(".clicked");
                        clicked.forEach((data) => {
                            selectedSeats.push(data.value);
                        })
                        count++
                    }
                    console.log(count)
                    console.log(selectedSeats);
                }
                else {
                    alert("최대 1매만 예약 가능합니다.");
                    location.reload();
                }
            })
            
            $(".payment").on("click", function () {
                if (input.classList.contains("clicked")) {
                    input.classList.add("soldout");
                    input.disabled = true;
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                    input.classList.remove("clicked");
                    count = 0;
                    $("#formSub").submit();
                }
            });
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        }
    }
</script>

</html>
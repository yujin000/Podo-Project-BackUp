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
<title>PODO</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="src/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	max-width: 1630px;
	min-width: 1630px;
	position: relative;
	height: 100%;
	margin: 20px;
}

.contentsTitle {
	display: flex;
	text-align: center;
	margin-top: 30px;
	max-width: 1630px;
	min-width: 1630px;
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
	justify-content: start;
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
	height: 25px;
	text-align: center;
	border: 1px solid rgba(255, 0, 215);
	/* color: #ff00d7; */
}

.performance {
	width: 1400px;
}

.TopImg {
	height: 254px;
}

.TopContents {
	display: flex;
	align-items: center;
	justify-content: start;
	font-size: 30px;
	margin-bottom: 60px;
}

.TopTitle {
	text-align: start;
	width: 1000px;
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
	right: 100%;
	width: 370px;
}

.BtnCss a:hover {
	color: #fff;
}

.BtnCss a {
	color: silver;
}

.BtnCss {
	width: 200px;
	margin-left: 250px;
}

.MidContents {
	display: flex;
	justify-content: start;
	width: 100%;
	font-size: 18px;
	margin: 5px 0 0 0;
}

.dbInput {
	display: flex;
	width: 250px;
	margin-left: 30px;
}

.dbInput1 {
	display: flex;
	width: 400px;
	margin-left: 30px;
}

.div1 {
	text-align: left;
	width: 100px;
}

.div2 {
	text-align: left;
	width: 100px;
	margin-left: 60px;
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

.Bottom {
	display: flex;
	align-items: center;
	justify-content: start;
	padding-left: 40px;
	height: 80px;
	width: 1574px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	font-size: 28px;
	font-weight: bold;
}

.circle {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	font-size: 16px;
	text-align: center;
	/*가로정렬*/
	line-height: 200px;
	/*세로 정렬*/
	margin: 0px 10px 0px 10px;
}

.profile {
	display: flex;
	margin-top: 20px;
	width: 1574px;
	height: 150px;
	font-size: 15px;
}

.profileTop {
	font-size: 23px;
	font-weight: 600;
	padding: 30px 0 0 10px;
}

.explanation {
	font-size: 23px;
	font-weight: 600;
	padding: 30px 0 0 10px;
	width: 100%;
	height: 100%;
}

.container {
	padding: 0 0px 200px 40px;
	width: 100%;
	height: 100%;
}

.cast {
	text-align: center;
}

.datepicker {
	width:	647px ;
	margin: 0 0 0 80px;
}

#ticketMenu {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-bottom:25px;
	font-size: 16px;
	font-weight: bold;
	margin: 10px 0 0 140px;
	color: white;
	width: 350px;
	height: 70.8px;
	box-shadow: 0 0 8px rgba(0,0,0,0.3);
	background-color: black;
}

#performTime {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 0 0 140px;
	border: 1px solid black;
	color: black;
	background-color: white;
	width: 350px;
	height: 200px;
	box-shadow: 0 0 8px rgba(0,0,0,0.3);
}
</style>
<script>
        $(() => {
            initCalendar();
            $(".datepicker").datepicker();
            $("#ticketMenu").text($.datepicker.formatDate("mm월 dd일", $(".datepicker").datepicker("getDate")));
        });

        function initCalendar() {
            $.datepicker.setDefaults({
                onSelect: onSelect,
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                showMonthAfterYear: true,
                yearSuffix: '.'
            });
        }

        function onSelect() {
        	let sysdate = $.datepicker.formatDate("mm월dd일", $(".datepicker").datepicker("getDate"));
            $("#ticketMenu").text(sysdate);
            
            let date = $.datepicker.formatDate("yy.mm.dd", $(".datepicker").datepicker("getDate"));
            console.log(date);
            
               
             	if(date == scheduleList[0].scheDate){
            			console.log("같습니다");
            			$("#performTime").text(scheduleList[0].scheTime);	
            			
              } else if(date == scheduleList[1].scheDate){
          				console.log("같습니다");
        				$("#performTime").text(scheduleList[1].scheTime);	 
        				
              } else if(date == scheduleList[2].scheDate){
            			console.log("같습니다");
            			$("#performTime").text(scheduleList[2].scheTime);	 
            			
			  } else if(!(date == scheduleList[0].scheDate)){
        		 		console.log("틀렸습니다");
        				$(function(){
        		        $('#performTime').empty();
        		 		});
        				
        	  } else if(!(date == scheduleList[1].scheDate)){
  		 				console.log("틀렸습니다");
						$(function(){
		        		$('#performTime').empty();
						});
						
	  	 	  } else if(!(date == scheduleList[2].scheDate)){
  		 				console.log("틀렸습니다");
						$(function(){
		        		$('#performTime').empty();
						});
	  		  }
            	
          }
        
        let scheduleList = new Array();
		<c:forEach items="${schedule }" var="s">
		scheduleList.push({
				scheDate : "${s.scheDate}",
				scheTime : "${s.scheTime}"
			})
		</c:forEach>
    </script>
</head>

<body>
	<div class="container">
		<div class="header">
			<h1 class="logoName">
				<img src="image/perform/logo-f-b.png" alt="">티켓
			</h1>
		</div>
		<div class="contents">
			<div class="contentsTitle">
				<div class="TopImg">
					<img src="image/perform/${list.poster }"
						style="width: 180px; height: 254px; margin-right: 20px;">
				</div>

				<div class="performance">
					<div class="saleText">판매중</div>

					<div class="TopContents">
						<div class="TopTitle">${list.performTitle }</div>
						<div class="BtnCss">
							<a href="/list.perform" class="BackBtn">공연 목록</a>
						</div>
					</div>

					<div class="MidContents">
						<div class="div1">공연기간</div>
						<div class="dbInput">
							<fmt:formatDate value="${list.startDate }" pattern="yyyy-MM-dd" />
							-
							<fmt:formatDate value="${list.endDate }" pattern="yyyy-MM-dd" />
						</div>
						<div class="div2">공연장</div>
						<div class="dbInput1">
							<a href="" style="color: white;">${list.theaterName } > </a>
						</div>
					</div>

					<div class="MidContents">
						<div class="div1">관람시간</div>
						<div class="dbInput">${list.showtime }분</div>

						<div class="div2">관람등급</div>
						<div class="dbInput">${list.rating }</div>
					</div>

					<div class="MidContents">
						<div class="div1">장르</div>
						<div style="margin-left: 27px;">${list.genre }</div>
					</div>
				</div>

				<div class="nameTop">
					<div style="width: 500px;">날짜선택</div>
					<div style="width: 1074px;">시간선택</div>
				</div>
			</div>
			<div class="perform">
				<ul class="listimg">
					<li>
						<div class="datepicker" id="calendar"></div>
					</li>

					<li>
						<div id="ticketMenu"></div>
						<div id="performTime"></div>
					</li>
				</ul>
			</div>

			<div class="MidContents2">
				<div class="BtnCss">
					<a class="performTicketing">예매하기</a>
				</div>
			</div>

			<div class="Bottom">상세정보</div>
			<div class="profileTop">출연진</div>

			<div class="profile">
				<c:choose>
					<c:when test="${not empty cast }">
						<c:forEach items="${cast }" var="c">
							<div class="cast">
								<img src="image/cast/${c.castSrc }" alt="" class="circle"><br>${c.castName }
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<div class="explanation">
				<div style="margin-bottom: 50px;">작품설명</div>
				<div style="text-align: center;">
					<img src="image/perform/${list.performPoster }" alt="">
				</div>
			</div>
		</div>
	</div>
	<footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>
    <script>
    $(".performTicketing").on("click", function(){
    	let loginEmail = "${loginEmail }";
       	if(loginEmail){
       		location.href = "seatSelect.perform";
            }else {
           	 alert("로그인 후 이용해주세요");
                return false;
            }
    });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            /* border: 1px solid; */
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
            padding: 0 40px 200px;
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
            max-width: 1580px;
            min-width: 1580px;
            position: relative;
            height: 100%;
            margin: 20px;
        }

        .contentsTitle {
            display: flex;
            text-align: center;
            margin-top: 30px;
            max-width: 1580px;
            min-width: 1580px;
            margin-left: 50px;
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

        .headerTitle {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .titleName {
            width: 468px;
            height: 50px;
        }

        .ticket {
            text-align: center;
            width: 290px;
            height: 420px;
            margin-bottom: 20px;
            background-color: rgba(253, 252, 240);
            color: #000;
            border: 1px solid black;
            border-radius: 15px;
        }
        .rating{
            display: flex;
            justify-content: space-between;
            padding-right: 10px;
            margin-top: 10px;
        }
        .title{
            display: flex;
            align-items: center;
            justify-content: center;
            border-top: 3px solid;
            border-bottom: 3px solid;
            width: 95%;
            height: 12%;
            margin-left: 7px;
        }
        .theater{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .date{
            margin-bottom: 20px;
        }
        .PODO{
            font-size: 25px;
            color: #fff;
            text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;
            font-weight: bold;
        }
        .price{
            margin-bottom: 35px;
        }
        .container{
            padding: 0 0px 200px 40px;
            height: 100%;
        }
        .deleteBtn{
        background-color:transparent;
        border: none;
        font-size: 15px;
        margin: 0 0 0 10px;
        width:20px
        }
    </style>
</head>

<body>
	<form action="/delete.perform" id="formSub" method="post">
    <div class="container">
        <div class="header">
            <h1 class="logoName"><img src="image/perform/logo-f-b.png" alt="">
                티켓</h1>
        </div>

        <div class="contents">

            <div class="headerTitle">
                <div class="titleName" style="font-size: 32px;">예매 내역</div>
            </div>

            <div class="contentsTitle">
            <c:choose>
      			<c:when test="${not empty ticket }">
         			<c:forEach items="${ticket }" var="t">
                <div class="ticket">
                <input type="hidden" value="${t.ticketSeq }" name="ticketSeq">
                <input type="hidden" value="${t.performSeq }" name="performSeq">
                    <P class="rating"><button type="button" class="deleteBtn">X</button> ${t.rating }</P>
                    <div class="title">
                        ${t.performTitle }
                    </div>
                    <div class="theater">
                        ${t.theaterName } / ${t.seatNum }매
                    </div>
                    <div class="date">
                        결제일시<br>
                        <fmt:formatDate value="${t.ticketDate }" pattern="yyyy-MM-dd" /> / <fmt:formatDate value="${t.ticketDate }" type="time" />
                    </div>
                    <div class="price">
                        결제 비용<br>
                        ${t.performPrice }
                    </div>
                    <div class="PODO">
                        PODO티켓
                    </div>
                    <div class="img">
                        <img src="image/perform/barcode.png" style="width:230px; height: 50px;">
                    </div>
                </div>
 					</c:forEach>
     			 </c:when>
   			</c:choose>
            </div>
        </div>
    </div>
    <footer>
            <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
            <br />
            <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
            <p>© PODO Music Corp.</p>
          </footer>
      </form>
    <script>
    $(".deleteBtn").on("click",function(){
    	if (confirm("예매된 티켓을 환불 하시겠습니까?")) {
    		$("#formSub").submit();
            alert("환불완료");
        	} else {
        }
    });
    </script>
</body>

</html>
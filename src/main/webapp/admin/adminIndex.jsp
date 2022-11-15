<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자페이지</title>
<link rel="stylesheet" href="/src/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<style>
 /* ---------- 관리자페이지 세팅 초기값 ---------- */
        /* 관리자페이지 세팅 초기값 */
        @media(min-width:1700px) {
            .html {
                width: 1700px;
            }
        }

        * div:not(#Header) {
            color: black;
        }

        #list,
        .listLi {
            color: #515151;
            height: 50px;
            line-height: 50px;
        }
        
        #listLi1{
        	background-color:#01B9FF;
        }
        
        .listLi:hover {
            cursor: pointer;
            background-color: #01B9FF;
        }

        .loginBtn {
            border-top: 0px;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        body {
            background: #EEEEEE;
        }

        .html {
            overflow: hidden;
        }

        .wrap {
            width: 230px;
            height: 100vh;
            float: left;
        }

        #Header {
            position: fixed !important;
            background-color: #515151;
        }

        .adminContents {
            width: 84%;
            height: 100vh;
            overflow-y: scroll;
            float: left;
        }

        .adminMainHeader {
            width: 85vw;
            height: 13vh;
            background-color: lightgray;
            position: relative;
        }

        .mainText {
            font-size: 30px;
            border: 1px solid silver;
            width: 100%;
            height: 70px;
            background-color: #FFFFFF;
            line-height: 60px;
            padding-left: 20px;
        }

        .adminMainView {
            width: 100%;
            margin: auto;
        }

        .tog {
            top: 130px;
        }
        .mainContents a{
        	color:black;
        }
/*------------------------------------------------*/
        div[id^=mainConArea] {
            width: 100%;
            height: 100%;
        }    
        input,textarea,button,b{
            color:black;
        }
        /* ㅇ*/
        .mainIsland{
            background-color: #ffffff;
            float:left;
            border:1px solid silver;
        }
        .mainContents{
            overflow: hidden;
        }
        .leftArea, .rightArea{
            float:left;
            height:100%;
        }
        .leftArea{
            width:65%;
        }
        .rightArea{
            width:35%;
        }
        #sales{
            width:420px;
            height:300px;
            margin:100px 0px 0px 50px;
        }
        #memberCount{
            width:420px;
            height:300px;
            margin:100px 0px 0px 50px;
        }
        #inquire{
            width:890px;
            height:400px;
            margin:50px 0px 0px 50px;
        }
        #memberArea{
        	margin-top:100px;
            height:750px;
            width:100%;
            overflow-y:scroll;
        }
        /* 문의사항 */
        #listHeader>div, .qnaList>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #qnaSeqHeader, .qnaSeq, #emailHeader {
        	width : 15%;

        }
        #qnaCategoryHeader, .qnaCategory {
        	width : 15%;
        }
        #qnaTitleHeader, .qnaTitle {
       		width : 30%;
        }
        #qnaWriterHeader, .qnaWriter {
        	width : 10%;
        	margin-left:45px;
        }
        #qnaWriteDateHeader, .qnaWriteDate {
        	width : 10%;
        	margin-left:40px;
        }
        #qnaStatusHeader, .qnaStatus {
        	width : 10%;
        }
        .qnaList, #listHeader {
        	height : 30px;
        }
        #listHeader{
        	height : 30px;
            line-height:30px;
        	font-size:12px;
        	background-color:#01B9FF;
        }
        #listHeader>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        }
        #qnaList{
        	margin-top:5px;
        }
        .qnaTitle>a{
            color:black;
            font-weight: bold;
        }
        .qnaList div{
            font-size:10px;
        }
        .islandTitle{
            height:45px;
            line-height:45px;
            font-size:25px;
            font-weight:bold;
            display:inline-block;
            color:black;
        }
        .islandTitle>a:hover{
        	cursor:pointer;
        	color:#ff0505;
        }
        /* 회원 */
        #listHeader2>div, .member>div {
            float : left;
            text-align : center;
            height : 30px;
        }
        #nameHeader, .name {
        	width : 15%;
        	margin-left:20px;
        }
        #nickHeader, .nickname {
        	width : 20%;
        	margin-left:20px;
        }
        #membershipHeader, .membership {
        	width : 10%;
        	margin-left:20px;
        }
        #scribeHeader, .scribeDate {
        	width : 15%;
        	margin-left:20px;
        }
        #joinHeader, .joinDate {
        	width : 15%;
        	margin-left:20px;
        }
        .member, #listHeader2 {
        	height : 30px;
        	font-size:12px;
        }
        .member{
        	overflow-y:scroll;
        }
        #listHeader2{
        	height : 30px;
            line-height:30px;
        	font-size:15px;
        	background-color:#01B9FF;
        	position:fixed;
        	margin-top:45px;
        	width:512px;
        }
        #listHeader2>div{
            color:white !important;
       	}
        #navi {
        	height : 5%;
        	text-align : center;
        }
        #memberList{
        	margin-top:75px;
        }
        #listHr{
        	margin:5px 0px 5px 0px;
        }
        #listMember{
        	position:fixed;
        	width:512px;
        	display:inline;
        	background-color:white;
        }
        /* 통계 */
        .chart{
            width:330px;
            height:130px;
            position: relative;
            overflow: hidden;
            border-left:1px solid black;
            margin:20px 0px 0px 20%;
        }
        div[class^=graph]{
            height:25px;
            margin-top:15px;
            background-color: #01B9FF;
            width:0px;
        }
        #promoNum,#event1Num,#event2Num{
            float:right;
            line-height:25px;
            border:none;
            margin-bottom:10px;
        }
        .proName{
            float:left;
            margin-top:60px;
        }

        #profit{
            font-size:30px;
            font-weight:bold;
            margin:10px 0px 0px 145px;
        }
        #won{
            float:right;
            font-size:30px;
            margin-bottom:30px;
        }
        #countMem{
            text-align: center;
            font-size: 50px;
            margin-top:80px;
            color:#FF0505 !important;
        }
        #memCount{
        	margin-left:25px;
        }
</style>
</head>

<body>
    <div class="html">
	<div class="wrap">
		<div id="Header">
			<h1 id="logo">
                    <a href="/adminMain.adminMain"><img src="/image/web/logo-f-5.png"
                            alt="" /></a>
                </h1>
			<div id="mypage">
				<a class="loginBtn">${loginNickname }</a>
			</div>
			<ul class="tog">
				<li><a href="/start.music">메인페이지로</a></li>
				<li><a href="/logout.member">로그아웃</a></li>
			</ul>
			<div id="GNB">
				<ul>
					<li><a href="/list.notice?cpage=1">공지사항 관리</a></li>
					<li><a href="/allList.music">음원 관리</a></li>
					<li><a href="/adminPerform.perform">공연 관리</a></li>
					<li><a href="/list.member?cpage=1">회원 관리</a></li>
					<li><a href="/goodsList.goods">멤버십 관리</a></li>
					<li><a href="/adminList.board?cpage=1">문의내역 확인</a></li>
				</ul>
			</div>
		</div>
	</div>
    <div class="mainContents">
        <div class="leftArea">
            <div id="graph">
                <div class="mainIsland" id="sales">
                    <div class="islandTitle" id="salesData">판매량 / 매출액</div>
                    <div class="proName">
                            <div class="setting">${promoCode }</div>
                            <div class="setting">${event1Code }</div>
                            <div class="setting">${event2Code }</div>
                    </div>
                        
                    <div class="chart">
                        <div class="graph" id="promo">
                            <div id="promoNum"></div>
                        </div>
                        <div class="graph" id="event1">
                            <div id="event1Num"></div>
                        </div>
                        <div class="graph" id="event2">
                            <div id="event2Num"></div>
                        </div>
                    </div>
                    <div id="profit">0</div>
                </div>
                <div class="mainIsland" id="memberCount">
                    <div class="islandTitle" id="memCount">회원수</div>
                    <div id="countMem">0</div>
                </div>
            </div>
            <div id="qnaArea">
                <div class="mainIsland" id="inquire">
                <div class="islandTitle"><a href="/adminList.board?cpage=1">문의내역</a></div>
                    <div id="listHeader">
                        <div id="qnaSeqHeader">문의 번호</div>
                        <div id="qnaCategoryHeader">문의 유형</div>
                        <div id="qnaTitleHeader">제목</div>
                        <div id="qnaWriterHeader">작성자</div>
                        <div id="qnaWriteDateHeader">문의 날짜</div>
                    </div>
                    <div id="qnaList">
                        <c:choose>
                            <c:when test="${not empty qnaList }">
                                <c:forEach var="i" items="${qnaList }">
                                    <div class="qnaList">
                                        <div class="qnaSeq">${i.qnaSeq }</div>
                                        <div class="qnaCategory">${i.qnaCategory }</div>
                                        <div class="qnaTitle">
                                            <a href="/adminQnaDetail.board?qnaSeq=${i.qnaSeq }">${i.qnaTitle }</a>
                                        </div>
                                        <div class="qnaWriter">${i.qnaWriter }</div>
                                        <div class="qnaWriteDate"><fmt:formatDate value="${i.qnaWriteDate }" pattern="yyyy-MM-dd hh:mm"/></div>
                                        <div class="qnaStatus"></div>
                                    </div>
                                    <hr id="listHr">
                                </c:forEach>                        			
                            </c:when>    
                            <c:otherwise>
                                <div>글이 없습니다.</div>
                            </c:otherwise>                    		
                        </c:choose>
                    </div>   
                </div>        
            </div>
        </div>

        <div class="rightArea">
            <div class="mainIsland" id="memberArea">
            	<div class="islandTitle" id="listMember"><a href="/list.member?cpage=1">회원목록</a></div>
          	        <div id="listHeader2">
                      	<div id="nameHeader">이름</div>
                      	<div id="nickHeader">닉네임</div>
                      	<div id="membershipHeader">멤버십</div>
                      	<div id="scribeHeader">구독일</div>
                      	<div id="joinHeader">가입일</div>
                      </div>
                      <div id="memberList">
                      	<c:choose>
                      		<c:when test="${not empty memberList}">
                      			<c:forEach var="i" items="${memberList }">
                      				<div class="member">
                      				<input type="hidden" value="${i.scribeDate }" id="dummyDate">
                      					<div class="name">${i.name }</div>
                      					<div class="nickname">${i.nickname }</div>
                      					<div class="membership">${i.membership }</div>
                      					<div class="scribeDate"><fmt:formatDate value="${i.scribeDate }" pattern="yyyy-MM-dd"/></div>
                      					<div class="joinDate"><fmt:formatDate value="${i.joinDate }" pattern="yyyy-MM-dd"/></div>
                      				</div>
                      				<hr id="listHr">
                      			</c:forEach>                        			
                      		</c:when>                        		
                      	</c:choose>
                      </div>  
            </div>
        </div>                                          
    </div>
    <input type="hidden" value="${profit }" id="adminProfit">
	<input type="hidden" value="${promoCount }" id="promoCount">
	<input type="hidden" value="${event1Count }" id="event1Count">
	<input type="hidden" value="${event2Count }" id="event2Count">
	<input type="hidden" value="${memberCount }" id="memberCount1">
	
</div>
    <script>
		// 관리자 버튼 토글
		let adminBtn = document.getElementById("mypage");
		$(adminBtn).click(function() {
			$(this).next(".tog").fadeToggle();
		});
        // 그래프 애니메이션
        let proNum = $("#promoCount").val();
        let	eventNum1 = $("#event1Count").val();
        let eventNum2 = $("#event2Count").val();

        $( document ).ready( function() {
            setTimeout(function(){
                $("#promo").animate( {
                    width: proNum*5+"%" 
                } );
            },2000);

            setTimeout(function(){
                $("#promoNum").append(proNum);
            },2500);

            setTimeout(function(){
                $("#event1").animate( {
                    width: eventNum1*5+"%" 
                } );
            },2800);

            setTimeout(function(){
                $("#event1Num").append(eventNum1);
            },3300);

            setTimeout(function(){
                $("#event2").animate( {
                    width: eventNum2*5+"%" 
                } );
            },3600);

            setTimeout(function(){
                $("#event2Num").append(eventNum2);
            },4100);
        } );
		
        // 회원수 효과
        const $counter = document.querySelector("#countMem");
        let countMem = $("#memberCount1").val();

        counter($counter, countMem);
        function counter($counter, max) {
            let now = max;
            const handle = setInterval(() => {
                $counter.innerHTML = Math.ceil(max - now);
                if (now < 1) {
                    clearInterval(handle);
                }
                const step = now / 10;
                now -= step;
            }, 50); 
        }
     	// 회원 포맷
        let myung = "명";
        setTimeout(function(){
            $("#countMem").append(myung);
        },3000);
        
        // 매출액 효과
        const $counter2 = document.querySelector("#profit");
        let profit = $("#adminProfit").val();

        counter($counter2, profit);
        function counter2($counter2, max) {
            let now = max;
            const handle = setInterval(() => {
                $counter2.innerHTML = Math.ceil(max - now);
                if (now < 1) {
                    clearInterval(handle);
                }
                const step = now / 10;
                now -= step;
            }, 50); 
        }

        // 가격 포맷
        let won = "원";
        setTimeout(function(){
            $("#profit").append(won);
        },7000);
	</script>
</body>

</html>
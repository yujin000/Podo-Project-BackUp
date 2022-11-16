<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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

        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            font-family: "EliceDigitalBaeum-Bd";
        }

        /*마이페이지 css */
        .mypage {
            height: 100%;
            margin-top: 8vh;
        }

        .profileDiv {
            width: 10vw;
            min-width: 100px;
            margin-bottom: 1vh;
			height : 182px;
			border: none;
       		border-radius: 50%;
        }

        .profile {
            width: 100%;
            height : 182px;
            min-width: 100px;
            border-radius: 50%;
        }

        .nameText {
            font-size: 25px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
		
		/*버튼 css*/
        .Btn {
            margin-top: 2vh;
    		margin-bottom: 5vh;
    		width: 13vw;
    		height: 50px;
    		text-align: center;
    		border-radius: 5px;
    		font-size: 20px;
    		font-weight: var(--font-weight);
    		border: 1px solid gray;
    		cursor: pointer;
    		background: var(--sub-background-color);
    		color: var(--font-color) 

        }
        .Btn:hover {
            border: 1px solid silver;
        }

        /*프로필 수정 css */
        .modify {
            width: 80%;
            height: 100%;
            margin-top: 6vh;
        }

        table {
            width: 100%;
            font-size: 20px;
            line-height: 45px;
        }

        table thead {
            text-align: left;
            border: 1px solid #fffffd50;
            border-width: 0 0 1px;
        }

        .thName {
            padding-left: 1vw;
            width: 17vw;
        }
		.thVoucher{
			width: 25vw;
		}
        .thStartdate {
            width: 17vw;
        }

        .thEnddate {
            width: 13vw;
        }

        .List div {
            text-align: left;
        }
        .thName {
            padding-left: 1vw;
            width: 17vw;
        }
        .thVoucher{
            width: 25vw;
        }


        /*예매 내역 css */
        .ticketingHistory {
            height: 100%;
            width: 80%;
            margin-top: 8vh;
        }
        .ticketingName {
            padding-left: 1vw;
            width: 42vw;
        }

        .ticketingStartdate {
            width: 19vw;
        }

        .ticketingDetail {
            min-width: 90px;
            width: 5vw;
        }
		
		/*상세보기 버튼*/
        #detailBtn{
    		width: 13vw;
    		height: 50px;
    		text-align: center;
    		border-radius: 5px;
    		font-size: 20px;
    		font-weight: var(--font-weight);
    		cursor: pointer;
    		background: var(--sub-background-color);
    		color: var(--font-color) 
        }

        
		/*프로필 수정 css */
		.membership>div>input{
		background : var(--background-color);
		font-family: "Noto Sans KR", sans-serif;
		color: var(--font-color);
		border: 1px solid silver;
		color: var(--font-color);
		}
		
		/*input disabled css*/
		.notInput{
		color: var(--font-color);
		font-size:18px;
		background: var(--sub-background-color);
		font-weight: bold;
		}
		
		/*프로필 수정 들어가면 버튼들 css*/
		.Btnmodify{
		    margin-top: 1vh;
    		margin-bottom: 1vh;
    		width: 13vw;
    		height: 50px;
    		text-align: center;
    		border-radius: 5px;
    		font-size: 20px;
    		font-weight: var(--font-weight);
    		border: 1px solid gray;
    		cursor: pointer;
    		background: var(--sub-background-color);
    		color: var(--font-color);
		}
		
		/*프로필 사진 업로드 div */
		#uploadBtn{
		float:left;
		margin-right:1vw;
		}
		
		/*프로필 사진 업로드 */
		.Btnmodify label {
    	display: inline-block;
    	line-height: 50px;
    	color: #fff;
    	cursor: pointer;
    	height: 40px;
    	margin-left: 10px;
		}
		.Btnmodify input[type="file"] {
    	position: absolute;
    	width: 0;
    	height: 0;
    	padding: 0;
    	overflow: hidden;
   		border: 0;
		}
		
		/*비밀번호 변경 버튼 css*/
		#pwBtn{
    	margin-top: 1vh;
    	margin-bottom: 1vh;
    	width: 8vw;
    	height: 35px;
    	text-align: center;
    	border-radius: 5px;
    	font-size: 20px;
    	font-weight: var(--font-weight);
    	border: 1px solid gray;
    	cursor: pointer;
    	background: var(--sub-background-color);
    	color: var(--font-color);
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

	<!-- 마이페이지 -->
    <div class="container" id="wrap1">
        <div class="mypage">
        
        	<!-- titleText: 타이틀 제목 -->
            <div class="titleText">마이페이지</div>
            
            <!-- 프로필 이미지(이미지 출력 구현중) -->
            <div class="profileDiv">
                <img src="/profile/${DTO.profileImg }" class="profile">
            </div>
            
            <!-- 닉네임 -->
            <span class="nameText">${DTO.nickname }</span>
            
            <!-- modifyBtn: 프로필 수정 버튼 -->
            <div>
                <button class="Btn" id="modifyBtn">프로필 수정</button>
            </div>
        </div>
		
		<!-- My이용권 -->
        <div class="membership">
        	<!-- titleText: 타이틀 제목 -->
            <div class="titleText">My 이용권</div>
            
            <!-- 이용권 -->
            <div>
                <table>
                    <thead>
                        <tr>
                            <!--  table th의 첫번째 칸(등급) -->
                            <th class="thName">등급</th>
                            <!--  table th의 두번째 칸(이용권) -->
                            <th class="thVoucher">이용중인 이용권</th>
                            <!--  table th의 세번째 칸(멤버십 혜택 기간) -->
                            <th class="thStartdate">멤버십 혜택 기간</th>
                            <!--  table th의 네번째 칸(다음 결제일) -->
                            <th class="thEnddate">다음 결제일</th>
                        </tr>
                    </thead>
                    
                    <!-- 현재 회원의 멤버십 출력 -->
                    <tbody>
                        <tr class="List">
                            <th>
                                <div style="padding-left: 1vw;">${DTO.membership }</div>
                            </th>
                            <td>
                                <div>
									<c:choose>
										<c:when test="${passName != null}">
											${passName }
										</c:when>
										<c:otherwise>
											이용중인 이용권이 없습니다.
										</c:otherwise>
									</c:choose>        
                                </div> 
                            </td>
                            <td>
                                <div><fmt:formatDate value="${DTO.scribeDate}" pattern="yyyy-MM-dd" /></div>
                            </td>
                            <td>
                            	<div>
                            	<c:choose>
                            	<c:when test= "${DTO.scribeDate != null}"><fmt:formatDate value="${DTO.scribeDate}" pattern="yyyy-MM-dd" /></c:when>
                            		<c:otherwise>${DTO.scribeDate}</c:otherwise>
                            		</c:choose>
                            	</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
		
		
		<!-- 예매내역 -->
        <div class="ticketingHistory">
            <div class="titleText">My 예매 내역</div>
            <table>
                <thead>
                    <tr>
                    	<!--  table th의 첫번째 칸(상품명) -->
                        <th class="ticketingName">상품명</th>
                        <!--  table th의 두번째 칸(이용일/매수) -->
                        <th class="ticketingStartdate">이용일/매수</th>
                        <!--  table th의 세번째 칸(상세보기 버튼을 위해 만들었음) -->
                        <th class="ticketingDetail">
                        <!-- detailBtn: 예매내역 상세보기-->
                            <div>
                                <a href="/ticketList.perform" style="color: var(--font-color)" id="detailBtn">상세보기 ></a>
                            </div>
                        </th>
                    </tr>
                </thead>
                
                <!-- 현재 회원의 예매내역 출력 -->
                <tbody>
                	<c:choose>
					<c:when test="${not empty ticket}">
					<c:forEach items="${ticket }" var="t">
                    <tr class="List">
                        <th>
                            <div style="padding-left: 1vw;">
											${t.performTitle }
							</div>
                        </th>
                        <td>
                            <div>
							<fmt:formatDate value="${t.startDate }" pattern="yyyy-MM-dd" /> / 1매
							</div>
                        </td>
                        <td> 
                        </td>
                    </tr>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
					예매한 내역이 없습니다.
					</c:otherwise>
					</c:choose>
                </tbody>
            </table>
        </div>
        <footer>
       <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>© PODO Music Corp.</p>
    	</footer>
    </div>
    
    
    <!-- 프로필 수정(회원정보 변경) -->
    <div class="container" id="wrap2">
    <form action="/informUpdate.member" method="post" enctype="multipart/form-data" id="updateForm">
        
        <div class="mypage">
        	<!-- titleText: 타이틀 제목 -->
            <div class="titleText">프로필 수정</div>
            
            <!-- 프로필 이미지 -->
            <div class="profileDiv">
                <img src="/profile/${DTO.profileImg }" class="profile" id="preview">
            </div>
            
            
            <div style="margin-bottom: 1vh;margin-top: 1vh">
            <!-- 프로필 이미지 업로드 버튼 -->
            <div class="Btnmodify" id="uploadBtn">
            <label for="file">프로필 이미지 업로드</label> 
            <input type="file" id="file" name="file">
            </div>
            
            <!-- 프로필 이미지 삭제 버튼(구현중) -->
            <div>
            <button class="Btnmodify" type="button" id="delImgBtn">프로필 이미지 삭제</button>
            <input type="hidden" value="false" name="delResult">	
            </div>
            
            </div>
            
        </div>
	
		
        <div id="modify">
            <div>
                <div>Email</div>
                <!-- notInput : 수정 불가능한 칸 -->
                <input type="text" value="${loginEmail }" class="notInput" disabled>
            </div>
            
            <div>
                <div style="margin-top : 1vh;">비밀번호</div>
                <button type="button" id="pwBtn">변경</button>
            </div>
            
            <div>
                <div>이름</div>
                <input type="text" value="${loginName }" class="notInput" disabled>
            </div>
            
            <div>
                <div style="margin-top:1vh; font-weight: bold;">닉네임</div>
                <input type="text" style="font-weight: bold;" value="${DTO.nickname }" name="nickname" id="nickname" class="inputAble">
            	<p id="msg"></p>
            </div>
            
            <div>
                <div style="margin-top:1vh; font-weight: bold;">전화번호</div>
                <input type="text" style="font-weight: bold;" value="${DTO.phone }" name="phone" id="phone">
                <p id="msg"></p>
            </div>
		
		
		<div style="margin-bottom: 1vh;margin-top: 1vh">
        <div style="float:left; margin-right: 1vw;">
        	<!-- profileBtn : 프로필 수정 완료(정보 변경 완료) 버튼 -->
             <button type="button" id="completionBtn" class="Btnmodify">수정 완료</button>
        </div>
       
        <div>
        	<!-- deleteBtn : 회원 탈퇴 버튼 -->
            <button type="button" style="color: var(--font-color)" id="deleteBtn" class="Btnmodify">회원 탈퇴</button>  
        </div>
        </div>
        
        </div>
        </form>
        
        <div id=pwDiv>
        <form action="/modifyPw.member" id="modifyPwForm">
                <div>현재 비밀번호</div>
                <input type="text" style="font-weight: bold;" name="pw" id="pw">
                <p id="msg"></p>
                <div>새로운 비밀번호</div>
                <input type="text" style="font-weight: bold;" name="pwChang" id="pwChang" disabled>
                <p id="msg"></p>
                <div>비밀번호 확인</div>
                <input type="text" style="font-weight: bold;" name="pwCheck" id="pwCheck" disabled>
                <p id="msg"></p>
                
                <div>
                <!-- modifyPwBtn : 수정 완료 버튼 -->
        	    <button type="button" id="modifyPwBtn" class="Btn" style="margin-right: 1vw; float: left;">수정 완료</button>
        	    <!-- backBtn : 뒤로가기 버튼 -->
        	    <button type="button" id="backBtn" class="Btn">뒤로가기</button>
        		</div>
       </form>
       </div>
       
       <footer>
       <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>© PODO Music Corp.</p>
    	</footer>
    	
    </div>

    <script>
    let pwOk = false; //현재 비밀번호 일치할 시
	let pwResult = false; //비밀번호 유효성검사 등등 다 통과 시
	let pwCheckResult = false; //비밀번호 확인
	let nickNameResult = false; //닉네임 유효성검사 등등 다 통과 시
	let phoneResult = false; //전화번호 유효성검사 등등 다 통과 시
	
    
    window.onload = function() {
		
    	//이미지 미리보기
    	$(document).ready(function () {
            $("#file").on("change", readURL);
        });
    	
    	function readURL(e) {
    	    var files = e.target.files;
    	    var filesArr = Array.prototype.slice.call(files);
    		filesArr.forEach(function (f) {
    			sel_file=f;
    			let reader = new FileReader();
    			reader.onload = function(e){
    				$("#preview").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
    		});
    	}
		//
		
		//시작하자마자 wrap2(프로필 수정 페이지) 꺼짐
    	$('#wrap2').css("display","none"); 
    	$('#pwDiv').css("display", "none");
    	
        let pwRegex = /^([A-Za-z\d\!|\@|\#|\$|\%]){7,20}$/;
        let nicknameRegex = /^[가-힣a-zA-z\d]{1,10}$/;
        let phoneRegex = /(\d{3}).*(\d{3}).*(\d{4})/;
    
    //현재 비밀번호
    $('#pw').on("input", function() {
    	let pw = $("#pw").val();
    	if (pw.length == 0) {
            $("#pw").next("#msg").html("");
            pwOk = false;
    	}else{
    		$.ajax({
                url: "/pwSelect.member",
                data: {"pw" : pw},
                error: function () {
                  alert("요청실패");
                }
    	}).done(function(resp){
        	let result = resp;
        	 if (result =="true") {
        		 $("#pw")
                 .next("#msg")
                 .html("일치합니다.")
                 .css("color", "#888");
        		 $("#pwChang").attr("disabled", false);
        		 $("#pwCheck").attr("disabled", false);
        		 pwOk = true;
        		 console.log(pwOk);
        		 console.log(result);
             } else { 
                 $("#pw").next("#msg").html("일치하지 않습니다.").css("color", "#888");
                 $("#pwChang").attr("disabled", true);
        		 $("#pwCheck").attr("disabled", true);
                 pwOk = false;
             }
        });
      }
    });
    
    //비밀번호 재설정
    $("#pwChang").keyup(function () {
        let result = pwRegex.test($(this).val());
        if($(this).val() == ""){
        	pwResult = false;
        	pwCheckResult = false;
        }
        if ($(this).val() !== "" && !result) {
        	$(this).next("#msg").css("color", "#888").text("대문자, 소문자, 숫자, !@#$% 만 사용 가능합니다. ");
        	$("#pwCheck").next("#msg").text("");
        	pwResult = false;
        	pwCheckResult = false;
        	console.log("pwChang / if : "+pwResult);
        } 
        else{
        	pwResult = true;
        	$("#pwChang").next("#msg").text("");
        	$("#pwCheck").next("#msg").text("");
        	if($(this).val()=== $("#pwCheck").val() && $(this).val()!=="" 
        		&& $("#pwCheck").val()!=="" ) {
        	$("#pwCheck").next("#msg").text("비밀번호가 일치합니다");
        	pwResult = true;
        	pwCheckResult = true;
        	console.log("true : "+pwResult);
        } else if($(this).val()==""||$("#pwCheck").val()=="") {
          $(this).next("#msg").text("");
          pwResult = false;
          pwCheckResult = false;
        } else {
        	$("#pwCheck").next("#msg").text("비밀번호가 일치하지 않습니다.");
        	pwResult = false;
        	pwCheckResult = false;
		}
        }
      });
	  
      //비밀번호 재설정 확인
      $("#pwCheck").keyup(function () {
        let result = $(this).val() === $("#pwChang").val();
        
        if(!result){
        	$(this).next("#msg").css("color", "#888").text("비밀번호가 일치하지 않습니다!");
        	pwCheckResult = false;
        	pwResult = false;
        }else{
        	$("#pwCheck").next("#msg").text("");
        	if($(this).val()=== $("#pwChang").val() && $(this).val()!=="" 
        		&& $("#pwChang").val()!=="") {
        	$(this).next("#msg").text("비밀번호가 일치합니다");
        	pwCheckResult = true;
        	pwResult = true;
        } else if($(this).val()==""||$("#pwChang").val()=="") {
          $(this).next("#msg").text("");
          pwCheckResult = false;
          pwResult = false;
        } else {
        	$("#pwCheck").next("#msg").text("비밀번호가 일치하지 않습니다.");
        	pwCheckResult = false;
        	pwResult = false;
		}
        	
        }
      });
      
      //닉네임
      $("#nickname").keyup(function () {
          let result = nicknameRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
            nickNameResult=false;
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("한글,영문,숫자 10자 만 사용 가능 합니다 ");
              nickNameResult=false;
          } else {
            $(this).next("#msg").text("");
            nickNameResult=true;
          }
        });
		
      //전화번호
      $("#phone").keyup(function () {
          let result = phoneRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
            phoneResult=false;
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("올바른 전화번호 형식을 입력해주세요");
              phoneResult=false;
          } else {
            $(this).next("#msg").text("");
            phoneResult=true;
          }
        });
    }
    
    
    let modify = document.getElementById("modifyBtn");
	let completion = document.getElementById("completionBtn");
	let memberDelete = document.getElementById("deleteBtn");
	
	//프로필 수정 버튼을 누르면 wrap1(마이페이지) 꺼지고 wrap2(프로필 수정페이지) 켜짐
	$(modify).click(function() {
		$('#wrap1').fadeOut(450).css("display", "none");
		$('#wrap2').css("display", "block");
	});
	
	//비밀번호 변경 버튼 누르면 비밀번호 변경 얘들이 켜짐
	$("#pwBtn").click(function() {
		$('#modify').fadeOut(450).css("display", "none");
		$('#pwDiv').css("display", "block");
	});
	
	
	//프로필 수정 완료(정보 변경 완료) 
	completion.addEventListener("click", function() { 
		if($("#nickname").val()== "${DTO.nickname }"){
			nickNameResult=true;
		}
		
		if($("#phone").val()== "${DTO.phone }"){
			phoneResult=true;
		}
		
		if(!nickNameResult){
			alert("닉네임을 확인해주세요.")
			return false;
		}
		if(!phoneResult){
			alert("전화번호를 확인해주세요.")
			return false;
		}
		document.getElementById("updateForm").submit();
		
	});
	
	//비밀번호 수정 완료
	document.getElementById("modifyPwBtn").addEventListener("click", function() {
		if(document.getElementById("pw")=="" || !pwOk){
			   alert("현재 비밀번호를 확인해주세요.");
			   return false;
		}
		if(pwOk){
			if(!pwResult){
				alert("변경하실 비밀번호를 확인해주세요(pwResult)");
				return false;
			}
			if(!pwCheckResult){
				alert("변경하실 비밀번호를 확인해주세요(pwCheckResult)");
				return false;
			}
		}
		document.getElementById("modifyPwForm").submit();
	});
	
	
	//회원 탈퇴
	memberDelete.addEventListener("click", function() {
		if (confirm("정말 회원 탈퇴를 하시겠습니까?")) {
			window.parent.location.href = "/delete.member"
			alert("회원 탈퇴 완료");
		} else {
		}
	});
	
	//프로필 이미지 삭제
	$("#delImgBtn").on("click", function(){
		$("#preview").attr('src','/profile/profile-default.jpg');
  		$('input[name=delResult]').attr('value',"true");
	});
	
	//뒤로가기
	document.getElementById("backBtn").addEventListener("click",function(){
		location.href = "/mypage.member"
    })
    </script>
</body>

</html>
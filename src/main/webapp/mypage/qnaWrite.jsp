<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
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
    		margin-bottom:200px;
        }
		
		/*1:1문의*/
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
        }

        /*qna css */
        .qna {
            height: 100%;
            margin-top: 8vh;
        }
		
		/*틀*/
        .qnalist {
            width: 100%;
            height: 51vh;
            margin-top: 5vh;
        }
		
		/*문의 유형 css */
        #category {
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 0.5vh;
        }
        
        /*문의 유형 카테고리 css */
		#categoryList{
			width: 165px;
		    height: 30px;
		    margin-left: 1.5vw;
    		font-family: "Noto Sans KR", sans-serif;
    		font-weight: bold;
    		background: var(--sub-background-color);
    		color: #fff;
    		border: 1px solid;
		}
		
		/*제목 css */
        #title {
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 0.5vh;
        }
        
        /* 제목 input css */
        #qnaTitle{
        	width: 330px;
		    height: 30px;
		    margin-left: 3.7vw;
    		font-family: "Noto Sans KR", sans-serif;
    		font-weight: bold;
    		background: var(--sub-background-color);
    		color: #fff;
    		border: 1px solid;
        }
        
        /*문의내용 css*/
        #contents{
            width: 100%;
            font-size: 20px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        
        /*textareaDiv css*/
        #textareaDiv{
        	height: 34vh;
    		border: 1px solid;
        }
        
        /*textarea css*/
        #qnaContents{
          	background: var(--sub-background-color);
          	width:100%;
          	height:100%;
          	font-size:20px;
          	font-weight: var(--font-weight);
          	color: var(--font-color);
          	resize: none;
        }
        
        /*목록, 작성완료 버튼 css */
        #writeBtn, #listBtn {
            margin-top: 2vh;
            margin-right: 0.5vw;
            width: 6vw;
            height: 40px;
            text-align: center;
            border-radius: 5px;
            font-size: 18px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            border: 1px solid gray;
            cursor: pointer;
            background: var(--sub-background-color);
            color: var(--font-color);
        }

        #writeBtn,#listBtn:hover {
            border: 1px solid silver;
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
    <form action="/insert.board" id="insertForm" method="post" enctype="multipart/form-data">
        <div class="qna">
            <div class="titleText">1:1 문의</div>
            <div class="qnalist">
            
					<div id="category">
						문의유형
						
						<select id="categoryList">
							<option selected>가입/결제/인증</option>
							<option>위시리스트</option>
							<option>정보 수정/음원/가사등록</option>
							<option>장애/오류</option>
							<option>기타</option>
						</select>
						
						<input type="hidden" id="qnaCategory" name="qnaCategory">
					</div>
					
					<div id="title">제목
                        <input type="text" placeholder="제목을 입력하세요" name="qnaTitle" id="qnaTitle">
                    </div>
                    
                    <div id="contents">문의 내용
                    	<div id="textareaDiv">
                        <textarea placeholder="내용을 입력해주세요 (영문, 숫자, 일반 특수문자 : 400글자 / 한글, 한자, 기타 특수문자 : 200글자 )" name="qnaContents" 
                         id="qnaContents"></textarea>
                        </div>
                    </div>
                    
            </div>
            
            <!-- 첨부파일 -->
            <div>
            <input type="file" name="file">
            </div>
            
            <!-- 버튼들 -->
            <div style="float:right;">
              <button type="button" id="listBtn">목록으로</button>
              <button type="button" id="writeBtn">작성완료</button>
            </div>
            
        </div>
        </form>
        
        <footer>
       <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>© PODO Music Corp.</p>
    	</footer>
    	
    </div>
    <script>
    //값 비었을때
    document.getElementById("writeBtn").addEventListener("click", function() {
    	if($("#qnaTitle").val()=="" || $("#qnaTitle").val()==null){
    		alert("제목을 입력해주세요.");
			return false;
    	};
    	if($("#qnaContents").val()=="" || $("#qnaTitle").val()==null){
    		alert("문의 내용을 입력해주세요.");
			return false;
    	};
    	//최대 한글 25자 영어 50자
    	if(!maxLengthCheck("qnaTitle", "제목","50")){
            return false;
        }
    	//최대 한글 200글자 영어 400글자
    	if(!maxLengthCheck("qnaContents", "문의 내용")){
            return false;
        }
    	document.getElementById("insertForm").submit();
    })
    
    //목록 버튼 이벤트
    document.getElementById("listBtn").addEventListener("click",function(){
    	history.back();
    })
    
    //문의 유형 선택
    $(function() {
    	let selectedText = $(":selected").text();
    	$('#qnaCategory').val(selectedText);
    	
            // 콤보박스가 변경될 때
            $('#categoryList').change(function () {
                // 드롭다운리스트에서 선택된 값을 텍스트박스에 출력
                let selectedText = $(":selected").text();
                $('#qnaCategory').val(selectedText);
            });

        });
    
    
    //글자수 제한 함수
    function maxLengthCheck(id, title, maxLength){
        let obj = $("#"+id);
        if(maxLength == null) {
            maxLength = obj.attr("maxLength") != null ? obj.attr("maxLength") : 400;
        }
        
        if(Number(byteCheck(obj)) > Number(maxLength)) {
            alert(title + " 입력 가능 문자 수를 초과하였습니다.\n(영문, 숫자, 일반 특수문자 : " + maxLength + " / 한글, 한자, 기타 특수문자 : " + parseInt(maxLength/2, 10) + ").");
            obj.focus();
            return false;
        } else {
            return true;
       }
   }
    //글자수 제한 함수
    function byteCheck(el){
        let codeByte = 0;
        for (let idx = 0; idx < el.val().length; idx++) {
            let oneChar = escape(el.val().charAt(idx));
            if ( oneChar.length == 1 ) {
                codeByte ++;
            } else if (oneChar.indexOf("%u") != -1) {
                codeByte += 2;
            } else if (oneChar.indexOf("%") != -1) {
                codeByte ++;
            }
        }
        return codeByte;
    }

    </script>
</body>
</html>
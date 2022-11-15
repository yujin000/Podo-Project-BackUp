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
            --background-color: #111;
            --sub-background-color: #333;
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

/*         div { */
/*             border: 1px solid #fff; */
/*         } */

        body {
            width: 100vw;
            background: var(--background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            padding: 0 75px;
            height: 100%;
/*             background-color: bisque; */
/*             width: 100vw; */
    		margin-bottom:200px;
        }

        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
/*             background-color: #00000d50; */
        }

        /*qna css */
        .qna {
            height: 100%;
            margin-top: 8vh;
/*             background-color: lightgray; */
        }
		
		/*틀*/
        .qnalist {
            width: 100%;
            height: 51vh;
            margin-top: 5vh;
/*             background-color: #00000d80; */
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
    		background-color: #111;
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
    		background-color: #111;
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
          	background: var(--background-color);
          	width:100%;
          	height:100%;
          	font-size:15px;
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
            background: var(--background-color);
            color: var(--font-color);
/*             background-color: #00000d50; */
        }

        #writeBtn,#listBtn:hover {
            border: 1px solid silver;
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
                        <textarea placeholder="내용을 입력해주세요" name="qnaContents" 
                         id="qnaContents"></textarea>
                        </div>
                    </div>
            </div>
            <div>
            <input type="file" name="file">
            </div>
            <div style="float:right;">
              <button type="button" id="listBtn">목록으로</button>
              <button type="button" id="writeBtn">작성완료</button>
            </div>
            
        </div>
        </form>
    </div>
    <script>
    document.getElementById("writeBtn").addEventListener("click", function() {
    	if($("#qnaTitle").val()=="" || $("#qnaTitle").val()==null){
    		alert("제목을 입력해주세요.");
			return false;
    	};
    	if($("#qnaContents").val()=="" || $("#qnaTitle").val()==null){
    		alert("문의 내용을 입력해주세요.");
			return false;
    	};
    	if(!maxLengthCheck("qnaTitle", "제목","50")){
            return false;
        }
    	if(!maxLengthCheck("qnaContents", "문의 내용")){
            return false;
        }
    	document.getElementById("insertForm").submit();
    })
    document.getElementById("listBtn").addEventListener("click",function(){
    	history.back();
    })
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
    
    function maxLengthCheck(id, title, maxLength){
        let obj = $("#"+id);
        if(maxLength == null) {
            maxLength = obj.attr("maxLength") != null ? obj.attr("maxLength") : 200;
        }
        
        if(Number(byteCheck(obj)) > Number(maxLength)) {
            alert(title + " 입력 가능 문자 수를 초과하였습니다.\n(영문, 숫자, 일반 특수문자 : " + maxLength + " / 한글, 한자, 기타 특수문자 : " + parseInt(maxLength/2, 10) + ").");
            obj.focus();
            return false;
        } else {
            return true;
       }
   }
    
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
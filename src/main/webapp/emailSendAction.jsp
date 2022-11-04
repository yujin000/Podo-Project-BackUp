<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="DAO.MemberDAO"%>
<%@ page import="Util.SHA256"%>
<%@ page import="Util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<% 

	MemberDAO dao = new MemberDAO();
	String userEmail = null;
	if(session.getAttribute("userEmail") != null){
		userEmail = (String) session.getAttribute("userEmail");
	}
	if(userEmail == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("loaction.href ='InputFom.jsp'");
		script.println("</script>");
		script.close();
		return;
	}


	request.setCharacterEncoding("UTF-8");
	String userEmail = null;
	String userPassword = null;

	if(request.getParameter("userEmail")!=null){
		userEmail = request.getParameter("userEamil");
	}
	if(request.getParameter("userPassword")!=null){
		userPassword = request.getParameter("userPassword");
	}
	if( userEmail == null || userPassword == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}
	
	MemberDAO dao = new MemberDAO();
	int result = dao.signup(new MemberDTO(userEmail,userPassword,null,null,null,null,null,null,null,SHA256.getSHA256(userEmail),false));
	/* userEmail, userPassword, SHA256.getSHA256(userEmail),false */
	if(result == -1) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else {
		session.setAttribute("userEmail", userEmail);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'eamilSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<%@ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.MemberDAO;
import DTO.MemberDTO;

@WebServlet("*.member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();   
		try {
			if (uri.equals("/signup.member")) {
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String nickname = request.getParameter("nickname");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.signup(email, pw, nickname, name, phone);
				dao.signupMail(email, nickname); // 회원가입 시 축하 메일 전송
				response.sendRedirect("/index.jsp");
			} else if (uri.equals("/login.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");

				boolean result = dao.login(email, pw); 

				if (result) {
					MemberDTO dto = dao.getMypage(email);	
					
					request.getSession().setAttribute("loginEmail", dto.getEamil());
					request.getSession().setAttribute("loginPw", dto.getPw());
					request.getSession().setAttribute("loginProfileimg", dto.getProfileImg());
					request.getSession().setAttribute("loginNickname", dto.getNickname());
					request.getSession().setAttribute("loginName", dto.getName());
					request.getSession().setAttribute("loginPhone", dto.getPhone());
					request.getSession().setAttribute("scribDate", dto.getScribeDate());
					
					response.sendRedirect("/chart.music");
				} 
					 else {
					  
					 response.setContentType("text/html; charset=UTF-8"); 
					 PrintWriter out = response.getWriter(); 
					 out.println("<script language='javascript'>");
					 out.println("alert('회원정보가 존재하지 않습니다.')");
					 out.println("location.href='/member/loginForm.jsp'"); 
					 out.println("</script>");
					 out.flush(); 
					 
					 }
				}
				
			 else if (uri.equals("/logout.member")) {
				 // 로그아웃
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			} else if (uri.equals("/mypage.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				MemberDTO dto = dao.getMypage(request.getSession().getAttribute("loginEmail").toString());
				request.setAttribute("DTO", dto);
				request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);
			} else if(uri.equals("/informUpdate.member")) {

				int maxSize = 1024 * 1024 * 10;
				String savePath = request.getServletContext().getRealPath("/profile");
				System.out.println(savePath);
				File fileSavePath = new File(savePath);
				if (!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());	
				
				String sysName = multi.getFilesystemName("file");
				
				String email=request.getSession().getAttribute("loginEmail").toString();
				String pw =multi.getParameter("pw");
				String nickname = multi.getParameter("nickname");
				String phone = multi.getParameter("phone");
				MemberDAO dao = MemberDAO.getInstance();
				if (pw==null) {
					pw=request.getSession().getAttribute("loginPw").toString();
				}else {
					pw = multi.getParameter("pw");
				}
				if (nickname==null) {
					nickname=request.getSession().getAttribute("loginNickname").toString();
				}else {
					nickname = multi.getParameter("nickname");
				}
				if (phone==null) {
					phone=request.getSession().getAttribute("loginPhone").toString();
				}else {
					phone = multi.getParameter("phone");
				}
				MemberDTO dto = new MemberDTO(email,pw,null,null,null,sysName,nickname,null,phone);
				dao.update(dto);
				System.out.println(dto);
				request.getRequestDispatcher("/mypage.member").forward(request, response);
			}
			else if(uri.equals("/emailDupleCheck.member")) {
				String email = request.getParameter("email");
				MemberDAO dao = new MemberDAO();
				boolean result = dao.emailDupleCheck(email);
				PrintWriter out = response.getWriter();
				out.print(result);
			}
			else if(uri.equals("/MailSender.member")) {
				String email = request.getParameter("email");
				MemberDAO dao = new MemberDAO();
				String result = dao.MailSender(email);
				
				Gson g = new Gson();
		          String jsonString = g.toJson(result);
		          response.getWriter().append(jsonString);
			}
			//ifream 문제로 인해 창이 2개가 생김
			else if(uri.equals("/delete.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.delete(request.getSession().getAttribute("loginEmail").toString());
				System.out.println(result);
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");
			} 
			else if(uri.equals("/adminMain.member")) {
				String nickName = request.getParameter("nickname");
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request, response);
			}
			else if(uri.equals("/find.member")) {
				// 비밀번호 찾기 시 이메일이 존재하는지 체크 후, 해당 이메일로 인증번호 전송
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("email");
				boolean result = dao.emailDupleCheck(email);
				
				if(result) {
					// 이메일이 회원정보에 존재할 시 
					String key = dao.MailSender(email); // 인증번호 전송
					Gson g = new Gson();
			          String jsonString = g.toJson(key); // 인증번호 호출 
			          response.getWriter().append(jsonString);
				}else{
					 // 이메일이 회원정보에 없을때
				}
			}else if(uri.equals("/updatePw.member")) { 
				// 임시비밀번호로 회원정보 수정 
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("email");
				String pw = dao.newPassword(email);				
				dao.updatePw(email, pw);
				response.sendRedirect("/member/loginForm.jsp");
				
			}else if(uri.equals("/stratMembership.member")) {
				// 멤버쉽 결제 시 멤버쉽 등급 수정
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("email");
				dao.startMemberShip(email);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

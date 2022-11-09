package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				System.out.println(email + pw + nickname + name + phone);
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.signup(email, pw, nickname, name, phone);
				response.sendRedirect("/index.jsp");
			} else if (uri.equals("/login.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");

				boolean result = dao.login(email, pw);
				System.out.println(result);

				if (result) {
					MemberDTO dto = dao.getMypage(email);	
					
					request.getSession().setAttribute("loginEmail", dto.getEamil());
					request.getSession().setAttribute("loginName", dto.getName());
					request.getSession().setAttribute("loginNickname", dto.getNickname());
					request.getSession().setAttribute("loginPw", dto.getPw());
					response.sendRedirect("/index.jsp");
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
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			} else if (uri.equals("/mypage.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				MemberDTO dto = dao.getMypage(request.getSession().getAttribute("loginEmail").toString());
				request.setAttribute("DTO", dto);
				request.getRequestDispatcher("mypage.jsp").forward(request, response);
			} else if(uri.equals("/informUpdate.member")) {
				String email=request.getSession().getAttribute("loginEmail").toString();
				String pw = request.getParameter("pw");
				String profileimg = request.getParameter("profileimg");
				String nickname = request.getParameter("nickname");
				String phone = request.getParameter("phone");
				MemberDAO dao = MemberDAO.getInstance();
				if (pw=="") {
					pw=request.getSession().getAttribute("loginPw").toString();
				}else {
					pw = request.getParameter("pw");
				}
				MemberDTO dto = new MemberDTO(email,pw,null,null,null,profileimg,nickname,null,phone);
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
			else if(uri.equals("/naverMailSend.member")) {
				String email = request.getParameter("email");
				MemberDAO dao = new MemberDAO();
				String result = dao.naverMailSend(email);
				request.setAttribute("key", result);
				System.out.println(result);
				request.getRequestDispatcher("/emailCheck.jsp").forward(request, response);
			}
			else if(uri.equals("/adminMain.member")) {
				String nickName = request.getParameter("nickname");
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request, response);
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

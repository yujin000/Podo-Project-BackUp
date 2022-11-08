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
		// post 방식으로 보낼때, 한글 깨지는 것을 방지

		String uri = request.getRequestURI();
		System.out.println(uri);

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

				if (result) {
					
					String nickname = dao.getNick(email);
					String name = dao.getName(email);
					request.getSession().setAttribute("loginEmail", email);
					request.getSession().setAttribute("loginName", name);
					request.getSession().setAttribute("loginNickname", nickname);
					request.getSession().setAttribute("loginPw", pw);
					response.sendRedirect("/index.jsp");
				} else {

					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script language='javascript'>");
					out.println("alert('회원정보가 존재하지 않습니다.')");
					out.println("</script>");
					out.flush();
					response.sendRedirect("error.jsp");

				}
			} else if (uri.equals("/logout.member")) {
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			} else if (uri.equals("/mypage.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				MemberDTO dto = dao.getMypage(request.getSession().getAttribute("loginEmail").toString());
				request.setAttribute("DTO", dto);
				request.getRequestDispatcher("/mypage.jsp").forward(request, response);
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
				MemberDTO dto = new MemberDTO(email,pw,null,null,null,profileimg,nickname,null,phone,null,true);
				dao.update(dto);
				request.getRequestDispatcher("/mypage.member").forward(request, response);
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

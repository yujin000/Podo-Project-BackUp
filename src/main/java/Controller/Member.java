package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// post 방식으로 보낼때, 한글 깨지는 것을 방지

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

				if (result) {
					MemberDTO dto = dao.getMypage(email);	
					
					request.getSession().setAttribute("loginEmail", dto.getEamil());
					request.getSession().setAttribute("loginPw", dto.getPw());
					request.getSession().setAttribute("loginProfileimg", dto.getProfileImg());
					request.getSession().setAttribute("loginNickname", dto.getNickname());
					request.getSession().setAttribute("loginName", dto.getName());
					request.getSession().setAttribute("loginPhone", dto.getPhone());
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
				request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);
			} else if(uri.equals("/informUpdate.member")) {

				int maxSize = 1024 * 1024 * 10;
				String savePath = request.getServletContext().getRealPath("/files");
				File fileSavePath = new File(savePath);
				if (!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());	
				
				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
				
				String email=request.getSession().getAttribute("loginEmail").toString();
				String pw =multi.getParameter("pw");
				String profileimg =multi.getParameter("profileimg");
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
			else if(uri.equals("/naverMailSend.member")) {
				String email = request.getParameter("email");
				MemberDAO dao = new MemberDAO();
				String result = dao.naverMailSend(email);
				request.setAttribute("key", result);
				System.out.println(result);
				request.getRequestDispatcher("/emailCheck.jsp").forward(request, response);
			}
			//ifream 문제로 인해 창이 2개가 생김
			else if(uri.equals("/delete.member")) {
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.delete(request.getSession().getAttribute("loginEmail").toString());
				System.out.println(result);
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");
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

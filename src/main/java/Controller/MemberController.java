package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); 
		//post 방식으로 보낼때, 한글 깨지는 것을 방지

		String uri = request.getRequestURI();
		System.out.println(uri);
		
		try {
			if(uri.equals("/signup.member")) {
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String nickname = request.getParameter("nickname");
				String name = request.getParameter("name");
				int phone = Integer.parseInt(request.getParameter("phone"));
				System.out.println(email+pw+nickname+name+phone);
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.signup(email,pw,nickname, name, phone);
				response.sendRedirect("/index.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

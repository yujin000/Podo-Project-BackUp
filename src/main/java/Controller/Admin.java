package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.admin")
public class Admin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		try {
			if(uri.equals("/adminMain.admin")) {
				String nickName = request.getParameter("nickname");
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request, response);
			}else if(uri.equals("/adminMemship.admin")) {
				response.sendRedirect("/admin/adminMembership.jsp");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

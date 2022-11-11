package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.WishDAO;
import DTO.WishDTO;

@WebServlet("*.wish")
public class Wish extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); // post의 한글깨짐현상을 처리하기 위한 로직
		
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/add.wish")) {
				
				String WishEmail = request.getSession().getAttribute("loginEmail").toString();
				String parentMusicSeq = request.getParameter("musicSeq"); // 위시리스트에 추가할 음원 번호
				WishDTO dto = new WishDTO(WishEmail, parentMusicSeq);
				
				int result = WishDAO.getInstance().addWish(dto);
			} else if (uri.equals("/exist.wish")) {
				System.out.println(uri);
				String WishEmail = request.getSession().getAttribute("loginEmail").toString();
				String parentMusicSeq = request.getParameter("musicSeq"); // 위시리스트 음원 번호
				WishDTO dto = new WishDTO(WishEmail, parentMusicSeq);
				boolean isExist = WishDAO.getInstance().isExist(dto);
				Gson g = new Gson();
				String jsonString = g.toJson(String.valueOf(isExist));
				response.getWriter().append(jsonString);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

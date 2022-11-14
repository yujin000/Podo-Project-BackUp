package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.MusicDAO;
import DAO.WishDAO;
import DTO.MusicDTO;
import DTO.WishDTO;

@WebServlet("*.wish")
public class Wish extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); // post의 한글깨짐현상을 처리하기 위한 로직
		
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/add.wish")) {
				
				String WishEmail = request.getSession().getAttribute("loginEmail").toString();
				int parentMusicSeq = Integer.parseInt(request.getParameter("musicSeq")); // 위시리스트 음원 번호
				WishDTO dto = new WishDTO(WishEmail, parentMusicSeq);				
				int result = WishDAO.getInstance().addWish(dto);
				
			} else if (uri.equals("/exist.wish")) {
				
				String wishEmail = request.getSession().getAttribute("loginEmail").toString();
				int parentMusicSeq = Integer.parseInt(request.getParameter("musicSeq")); // 위시리스트 음원 번호
				WishDTO dto = new WishDTO(wishEmail, parentMusicSeq);
				boolean isExist = WishDAO.getInstance().isExist(dto);
				Gson g = new Gson();
				String jsonString = g.toJson(String.valueOf(isExist));
				response.getWriter().append(jsonString);
				
			} else if (uri.equals("/del.wish")) {
				
				String WishEmail = request.getSession().getAttribute("loginEmail").toString();
				int parentMusicSeq = Integer.parseInt(request.getParameter("musicSeq")); // 위시리스트 음원 번호
				WishDTO dto = new WishDTO(WishEmail, parentMusicSeq);
				int result = WishDAO.getInstance().delWish(dto);
				
			}else if (uri.equals("/list.wish")) {
				MusicDAO dao = MusicDAO.getInstance();
				String WishEmail = request.getSession().getAttribute("loginEmail").toString();
				List<MusicDTO> dtoWish = dao.selectAll(WishEmail);
				request.setAttribute("wish", dtoWish);
				request.getRequestDispatcher("/mypage/wishList.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

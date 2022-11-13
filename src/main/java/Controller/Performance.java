package Controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PerformanceDAO;
import DTO.PerformanceDTO;

@WebServlet("*.perform")
public class Performance extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		// post 방식으로 보낼때, 한글 깨지는 것을 방지

		String uri = request.getRequestURI();
		try {
			if(uri.equals("/list.perform")) {
				PerformanceDAO dao = PerformanceDAO.getInstance();
				List<PerformanceDTO> perform = dao.selectPerform();
				request.getSession().setAttribute("perform", perform);
				request.getRequestDispatcher("/ticketing/ticketing.jsp").forward(request, response);
				
			}else if(uri.equals("/adminPerform.perform")) {
				PerformanceDAO dao = PerformanceDAO.getInstance();
				List<PerformanceDTO> perform = dao.selectAllPerform();
				request.getSession().setAttribute("perform", perform);
				
				String loginNickname = request.getSession().getAttribute("loginNickname").toString();
				request.getSession().setAttribute("loginNickname", loginNickname);
				request.getRequestDispatcher("/admin/adminPerformance.jsp").forward(request, response);
			}else if(uri.equals("/deletePerform.perform")) {
				PerformanceDAO dao = PerformanceDAO.getInstance();
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deletePerform(seq);
				response.sendRedirect("/adminPerform.perform");
			}else if(uri.equals("/addPerform.perform")) {
				PerformanceDAO dao = PerformanceDAO.getInstance();
				
				String theaterName = request.getParameter("theaterName");
				String performTitle = request.getParameter("performTitle");
				String poster = request.getParameter("posterFile");
				int showtime = Integer.parseInt(request.getParameter("showtime"));
				String getStartDate = request.getParameter("startDate")+" 00:00:00";
				Timestamp startDate = Timestamp.valueOf(getStartDate);
				String getEndDate = request.getParameter("endDate")+" 00:00:00";
				Timestamp endDate = Timestamp.valueOf(getEndDate);
				String performPrice = request.getParameter("performPrice");
				String rating = request.getParameter("rating");
				String genre = request.getParameter("genre");
				String performPoster = request.getParameter("performPoster");
				
				PerformanceDTO dto = new PerformanceDTO(0,0,theaterName,performTitle,poster,showtime,startDate,endDate,performPrice,rating,genre,performPoster);
				dao.addPerform(dto);
				response.sendRedirect("/adminPerform.perform");
			}else if(uri.equals("/updPerform.perform")) {
				PerformanceDAO dao = PerformanceDAO.getInstance();
				
				int seq = Integer.parseInt(request.getParameter("pSeq"));
				
				String theaterName = request.getParameter("theaterName");
				String performTitle = request.getParameter("performTitle");
				int showtime = Integer.parseInt(request.getParameter("showtime"));
				String getStartDate = request.getParameter("startDate")+" 00:00:00";
				Timestamp startDate = Timestamp.valueOf(getStartDate);

				String getEndDate = request.getParameter("endDate")+" 00:00:00";
				Timestamp endDate = Timestamp.valueOf(getEndDate);

				String performPrice = request.getParameter("performPrice");
				String rating = request.getParameter("rating");
				String genre = request.getParameter("genre");
				//System.out.println("con : "+theaterName+performTitle+showtime+startDate+endDate+performPrice+rating+genre+seq);
				dao.updatePerform(theaterName, performTitle, showtime, startDate, endDate, performPrice, rating, genre, seq);
				response.sendRedirect("/adminPerform.perform");
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

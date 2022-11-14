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

import DAO.CastDAO;
import DAO.PerformanceDAO;
import DAO.ScheduleDAO;
import DAO.SeatDAO;
import DAO.TheaterDAO;
import DAO.TicketingDAO;
import DTO.CastDTO;
import DTO.PerformanceDTO;
import DTO.ScheduleDTO;
import DTO.SeatDTO;
import DTO.TheaterDTO;
import DTO.TicketingDTO;

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
				String nickName = request.getSession().getAttribute("loginNickname").toString();
				request.getSession().setAttribute("nickName", nickName);
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
			}else if(uri.equals("/performDetail.perform")){
				int performSeq = Integer.parseInt(request.getParameter("performSeq"));
				PerformanceDAO dao = PerformanceDAO.getInstance();
				CastDAO dao1 = CastDAO.getInstance();
				ScheduleDAO dao2 = ScheduleDAO.getInstance();
				
				PerformanceDTO list = dao.selectDetail(performSeq);
				List<CastDTO> cast = dao1.selectCast(performSeq);
				List<ScheduleDTO> schedule = dao2.selectSchedule(performSeq);
				
				request.setAttribute("list", list);
				request.setAttribute("cast", cast);
				request.setAttribute("schedule", schedule);
				request.getSession().setAttribute("performSeq", performSeq);
				request.getRequestDispatcher("/ticketing/performDetail.jsp").forward(request, response);
				
			} else if(uri.equals("/seatSelect.perform")) {
				int performSeq = Integer.parseInt(request.getSession().getAttribute("performSeq").toString());
				String scheDate = request.getParameter("scheDate");
				TheaterDAO dao = TheaterDAO.getInstance();
				PerformanceDAO dao1 = PerformanceDAO.getInstance();
				TheaterDTO the = dao.selectSeat(performSeq);
				PerformanceDTO list = dao1.selectDetail(performSeq);
				SeatDAO dao2 = SeatDAO.getInstance();
				
				SeatDTO seat = dao2.seatDetail(performSeq);
				
				request.setAttribute("the", the);
				request.setAttribute("list", list);
				request.setAttribute("seat", seat);
				request.getSession().setAttribute("scheDate", scheDate);
				request.getRequestDispatcher("/ticketing/seatSelect.jsp").forward(request, response);
				
			}else if(uri.equals("/payment.perform")) {
				
				TicketingDAO dao = TicketingDAO.getInstance();
				
				String email = request.getSession().getAttribute("loginEmail").toString();
				int performSeq = Integer.parseInt(request.getParameter("performSeq"));
				int seatNum = Integer.parseInt(request.getParameter("seatNum"));
				String performTitle = request.getParameter("performTitle");
				String theaterName = request.getParameter("theaterName");
				String performPrice = request.getParameter("performPrice");
				
				TicketingDTO dto = new TicketingDTO(0,email,performSeq,performTitle,theaterName, performPrice, seatNum, null);
				dao.ticketing(dto);
				request.getRequestDispatcher("/ticketing/payment.jsp").forward(request, response);

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
package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CastDAO;
import DAO.PerformanceDAO;
import DAO.ScheduleDAO;
import DAO.TheaterDAO;
import DTO.CastDTO;
import DTO.PerformanceDTO;
import DTO.ScheduleDTO;
import DTO.TheaterDTO;

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
				TheaterDAO dao = TheaterDAO.getInstance();
				PerformanceDAO dao1 = PerformanceDAO.getInstance();
				TheaterDTO the = dao.selectSeat(performSeq);
				PerformanceDTO list = dao1.selectDetail(performSeq);
				
				request.setAttribute("the", the);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/ticketing/seatSelect.jsp").forward(request, response);
				
			}else if(uri.equals("/payment.perform")) {
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
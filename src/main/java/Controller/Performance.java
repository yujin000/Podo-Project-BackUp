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
import DTO.CastDTO;
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
				
			}else if(uri.equals("/performDetail.perform")){
				int performSeq = Integer.parseInt(request.getParameter("performSeq"));
				CastDAO dao1 = CastDAO.getInstance();
				PerformanceDAO dao = PerformanceDAO.getInstance();
				
				List<CastDTO> cast = dao1.selectCast(performSeq);
				PerformanceDTO list = dao.selectDetail(performSeq);
				request.setAttribute("list", list);
				request.setAttribute("cast", cast);
				request.getRequestDispatcher("/ticketing/performDetail.jsp").forward(request, response);
				
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
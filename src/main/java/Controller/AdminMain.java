package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DAO.MusicDAO;
import DAO.NoticeBoardDAO;
import DAO.QnaBoardDAO;
import DTO.MemberDTO;
import DTO.MusicDTO;
import DTO.NoticeBoardDTO;
import DTO.QnaBoardDTO;

// 관리자 메인페이지 출력용 서블릿
@WebServlet("*.admin")
public class AdminMain extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		request.setCharacterEncoding("utf8");
		
		if (uri.equals("/adminMain.adminMain")) {
			try {
				List<MemberDTO> memberList = MemberDAO.getInstance().selectAllMember(1, 10);
				List<NoticeBoardDTO> noticeList = NoticeBoardDAO.getInstance().selectNotice(1, 10);
				List<QnaBoardDTO> qnaList = QnaBoardDAO.getInstance().selectAll(1, 10);
				List<MusicDTO> chartList = MusicDAO.getInstance().musicChartList();
				
				request.setAttribute("memberList", memberList);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("qnaList", qnaList);
				request.setAttribute("chartList", chartList);
				
				request.getRequestDispatcher("/admin/adminIndex.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

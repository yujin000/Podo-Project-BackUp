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
import DAO.PayGoodsDAO;
import DAO.QnaBoardDAO;
import DTO.MemberDTO;
import DTO.MusicDTO;
import DTO.NoticeBoardDTO;
import DTO.QnaBoardDTO;

// 관리자 메인페이지 출력용 서블릿
@WebServlet("*.adminMain")
public class AdminMain extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf8");
		
		if (uri.equals("/adminMain.adminMain")) {
			try {
				List<MemberDTO> memberList = MemberDAO.getInstance().selectAllMember(1,50);
				List<NoticeBoardDTO> noticeList = NoticeBoardDAO.getInstance().selectNotice(1, 10);
				List<QnaBoardDTO> qnaList = QnaBoardDAO.getInstance().selectAll(1, 10);
				List<MusicDTO> chartList = MusicDAO.getInstance().musicChartList();
				
				int memberCount = MemberDAO.getInstance().memberCount();

				PayGoodsDAO dao = PayGoodsDAO.getInstance();
				int promoCode = dao.promoCode();
				int promoPrice = dao.promoPrice();
				int promoCount = dao.promoCount();
				int event1Code = dao.event1Code();
				int event1Price = dao.event1Price();
				int event1Count= dao.event1Count();
				int event2Code = dao.event2Code();
				int event2Price = dao.event2Price();
				int event2Count = dao.event2Count();
				
				int profit = (promoCount*promoPrice)+(event1Price*event1Count)+(event2Price*event2Count);

				request.setAttribute("profit", profit);
				request.setAttribute("promoCode", promoCode);
				request.setAttribute("event1Code", event1Code);
				request.setAttribute("event2Code", event2Code);
				request.setAttribute("promoCount", promoCount);
				request.setAttribute("event1Count", event1Count);
				request.setAttribute("event2Count", event2Count);
				
				request.setAttribute("memberList", memberList);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("qnaList", qnaList);
				request.setAttribute("chartList", chartList);
				request.setAttribute("memberCount", memberCount);
				
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

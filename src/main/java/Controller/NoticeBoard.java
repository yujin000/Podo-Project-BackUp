package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NoticeBoardDAO;
import DTO.NoticeBoardDTO;

@WebServlet("*.notice")
public class NoticeBoard extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		// post의 한글깨짐현상을 처리하기 위한 로직
		
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/write.notice")) {
				NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
				String noticeWriter = request.getSession().getAttribute("loginNickname").toString();
				String noticeTitle = request.getParameter("noticeTitle");
				String noticeContents = request.getParameter("noticeContents");
				String noticeCategory = request.getParameter("noticeCategory");
								
				NoticeBoardDTO dto = new NoticeBoardDTO(0, noticeWriter, noticeTitle, noticeContents, null, noticeCategory);
				int result = dao.writeNoticeBoard(dto);
				response.sendRedirect("/list.notice");
			} else if (uri.equals("/list.notice")) {
				NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
				List<NoticeBoardDTO> noticeBoardList = dao.selectNotice();
				request.setAttribute("noticeBoardList", noticeBoardList);
				request.getRequestDispatcher("/admin/adminNotice/adminNotice.jsp");				
			}
		} catch (Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

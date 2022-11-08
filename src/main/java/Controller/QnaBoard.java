package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QnaBoardDAO;
import DTO.QnaBoardDTO;

@WebServlet("*.board")
public class QnaBoard extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/list.board")) {
				int cpage=Integer.parseInt(request.getParameter("cpage"));
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				List<QnaBoardDTO> qna = dao.selectByRange(cpage*5-4,cpage*5);
				
				String navi=dao.getPageNavi(cpage);
				request.setAttribute("qna", qna);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/mypage/myInquiry.jsp").forward(request, response);
			}else if(uri.equals("/insert.board")) {
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				String qnaWriter = request.getSession().getAttribute("loginEmail").toString();
				String qnaTitle=request.getParameter("qnaTitle");
				String qnaContents=request.getParameter("qnaContents");
				String qnaCategory="a";
				int qnaSeq = dao.getSeq();
				int result = dao.insert(new QnaBoardDTO(qnaSeq, qnaWriter, qnaTitle, qnaContents, null, qnaCategory));
				response.sendRedirect("/list.board?cpage=1");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

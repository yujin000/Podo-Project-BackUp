package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QnaCommentDAO;
import DTO.QnaCommentDTO;

/**
 * Servlet implementation class QnaComment
 */
@WebServlet("*.qnaC")
public class QnaComment extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf8");
		
		if (uri.equals("/write.qnaC")) {
			String qnaCWriter = request.getSession().getAttribute("loginNickname").toString();
			String qnaCContents = request.getParameter("comment");
			int parentSeq = Integer.parseInt(request.getParameter("qnaSeq"));
			
			QnaCommentDTO dto = new QnaCommentDTO(0, qnaCWriter, qnaCContents, null, parentSeq);
			try {
				int result = QnaCommentDAO.getInstance().insertC(dto);
				response.sendRedirect("/adminQnaDetail.board?qnaSeq="+parentSeq);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

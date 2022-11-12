package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.BoardFilesDAO;
import DAO.NoticeBoardDAO;
import DTO.BoardFilesDTO;
import DTO.NoticeBoardDTO;

@WebServlet("*.notice")
public class NoticeBoard extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		// post의 한글깨짐현상을 처리하기 위한 로직
		
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/write.notice")) {
				
				int maxSize = 1024 * 1024 * 10;
				String savePath = request.getServletContext().getRealPath("/files");
				File fileSavePath = new File(savePath);
				if (!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
								
				NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
				String noticeWriter = request.getSession().getAttribute("loginNickname").toString();
				String noticeTitle = multi.getParameter("noticeTitle");
				String noticeContents = multi.getParameter("noticeContents");
				String noticeCategory = multi.getParameter("noticeCategory");
				
				int noticeSeq = dao.getSeq();
				
				NoticeBoardDTO dto = new NoticeBoardDTO(noticeSeq, noticeWriter, noticeTitle, noticeContents, null, noticeCategory);
				int result = dao.writeNoticeBoard(dto);
				
				if (oriName==null) {
					response.sendRedirect("/list.notice?cpage=1");
				} else {
					BoardFilesDAO.getInstance().insert(new BoardFilesDTO(0, oriName, sysName, noticeSeq, null));
					response.sendRedirect("/list.notice?cpage=1");
				}
				
				
				
			} else if (uri.equals("/list.notice")) {
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int rcpp = 10;
				int ncpp = 10;
				NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
				List<NoticeBoardDTO> noticeBoardList = dao.selectNotice(cpage * rcpp - (rcpp-1), cpage * rcpp);
				String navi = dao.getPageNavi(cpage, rcpp, ncpp);
				
				request.setAttribute("navi", navi);
				request.setAttribute("noticeBoardList", noticeBoardList);
				request.getRequestDispatcher("/admin/adminNotice/adminNotice.jsp").forward(request, response);		
				
			} else if (uri.equals("/detail.notice")) {
				
				int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
				NoticeBoardDTO noticeDto = NoticeBoardDAO.getInstance().noticeDetail(noticeSeq);
				BoardFilesDTO filesDto = BoardFilesDAO.getInstance().selectNotice(noticeSeq);
				
				request.setAttribute("noticeDetail", noticeDto);
				request.setAttribute("noticeDetailFile", filesDto);
				request.getRequestDispatcher("/admin/adminNotice/noticeDetail.jsp").forward(request, response);
				
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

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

import DAO.MusicDAO;
import DTO.MusicDTO;

@WebServlet("*.music")
public class Music extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); // post의 한글깨짐현상을 처리하기 위한 로직

		String uri = request.getRequestURI();
		try {
			if (uri.equals("/start.music")) {
				MusicDAO dao = MusicDAO.getInstance();
				List<MusicDTO> musicList = dao.musicAllList();
				request.setAttribute("musicList", musicList);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				
			}
			// chart 목록 출력
			else if (uri.equals("/chart.music")) {
				MusicDAO dao = MusicDAO.getInstance();
				List<MusicDTO> list = dao.musicChartList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/view/chart.jsp").forward(request, response);
			}
			// main chart list 출력
			else if (uri.equals("/mainList.music")) {
				MusicDAO dao = MusicDAO.getInstance();
				List<MusicDTO> list = dao.musicChartList();
				request.setAttribute("mainList", list);
				request.getRequestDispatcher("/view/main.jsp").forward(request, response);
			}
			
			else if (uri.equals("/allList.music")) {
				MusicDAO dao = MusicDAO.getInstance();
				List<MusicDTO> musicList = dao.musicAllList();
				String nickName = request.getSession().getAttribute("loginNickname").toString();
				request.setAttribute("list", musicList);
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminMusic.jsp").forward(request, response);
				
			}else if(uri.equals("/adminMusic.music")) {
				String nickName = request.getParameter("nickname");
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminMusic.jsp").forward(request, response);
				
			}else if(uri.equals("/addMusic.music")) {
				// 파일등록
				int maxSize = 1024*1024*10;
				String savePath = request.getServletContext().getRealPath("/audio");
				File fileSavePath = new File(savePath);

				if(!fileSavePath.exists()){
					fileSavePath.mkdir(); 
				}

				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				int getSeq = MusicDAO.getInstance().getSeq();

				String musicName = multi.getParameter("musicName");
				String musicArtist = multi.getParameter("musicArtist");
				String musicAlbum = multi.getParameter("musicAlbum");
				String musicGenre = multi.getParameter("musicGenre");
				int musicChart = Integer.parseInt(multi.getParameter("musicChart"));
				String musicLylics = multi.getParameter("musicLylics");
				MusicDAO dao = MusicDAO.getInstance();

				String imgSysName = multi.getFilesystemName("imgFile");
				String mp3SysName = multi.getFilesystemName("mp3File");

				MusicDTO dto = new MusicDTO(getSeq,musicName,musicArtist,musicAlbum,imgSysName,mp3SysName,musicChart,musicGenre,musicLylics);
				dao.addMusic(dto);
				response.sendRedirect("/allList.music");

			}else if(uri.equals("/deleteMusic.music")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				MusicDAO dao = MusicDAO.getInstance();
				dao.deleteMusic(seq);
				response.sendRedirect("/allList.music");
				
			}else if(uri.equals("/update.music")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String musicName = request.getParameter("musicName");
				String musicArtist = request.getParameter("musicArtist");
				String musicAlbum = request.getParameter("musicAlbum");
				String musicGenre = request.getParameter("musicGenre");
				String musicLylics = request.getParameter("musicLylics");
				
				MusicDAO dao = MusicDAO.getInstance();
				dao.updateMusic(musicName, musicArtist, musicAlbum, musicGenre,musicLylics, seq);
				response.sendRedirect("/allList.music");
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

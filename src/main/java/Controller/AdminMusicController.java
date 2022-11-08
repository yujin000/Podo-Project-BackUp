package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.AdminMusicDAO;
import DTO.MusicDTO;

@WebServlet("*.admusic")
public class AdminMusicController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		System.out.println(uri);

		try {
			if(uri.equals("/adminMusic.admusic")) {
				String nickName = request.getParameter("nickname");
				request.setAttribute("nickname", nickName);
				request.getRequestDispatcher("/admin/adminMusic.jsp").forward(request, response);
			}else if(uri.equals("/addMusic.admusic")) {
				// 파일등록
				int maxSize = 1024*1024*10;
				String savePath = request.getServletContext().getRealPath("/image/albumImg");
				File fileSavePath = new File(savePath);

				if(!fileSavePath.exists()){
					fileSavePath.mkdir(); 
				}

				MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());

				int getSeq = AdminMusicDAO.getInstance().getSeq();

				String musicName = multi.getParameter("musicName");
				String musicArtist = multi.getParameter("musicArtist");
				String musicAlbum = multi.getParameter("musicAlbum");
				String musicGenre = multi.getParameter("musicGenre");
				int musicChart = Integer.parseInt(multi.getParameter("musicChart"));
				String musicLylics = multi.getParameter("musicLylics");
				AdminMusicDAO dao = AdminMusicDAO.getInstance();

				String imgSysName = multi.getFilesystemName("imgFile");
				String mp3SysName = multi.getFilesystemName("mp3File");

				MusicDTO dto = new MusicDTO(getSeq,musicName,musicArtist,musicAlbum,imgSysName,mp3SysName,musicChart,musicGenre,musicLylics);
				dao.addMusic(dto);

				response.sendRedirect("/allList.music");

			}else if(uri.equals("/deleteMusic.admusic")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				AdminMusicDAO dao = AdminMusicDAO.getInstance();
				dao.deleteMusic(seq);
				response.sendRedirect("/allList.music");
			}else if(uri.equals("/update.admusic")) {
				int seq = Integer.parseInt(request.getParameter("modifySeq"));
				String musicName = request.getParameter("updateName");
				String musicArtist = request.getParameter("updateArtist");
				String musicAlbum = request.getParameter("updateAlbum");
				String musicGenre = request.getParameter("updateGenre");
				
				AdminMusicDAO dao = AdminMusicDAO.getInstance();
				dao.updateMusic(musicName, musicArtist, musicAlbum, musicGenre, seq);
				response.sendRedirect("/allList.music");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

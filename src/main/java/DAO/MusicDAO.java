package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MusicDTO;

public class MusicDAO {
	private static MusicDAO instance = null;
	
	public static MusicDAO getInstance() {
		if (instance==null) {
			instance = new MusicDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<MusicDTO> musicChartList() throws Exception { // TOP25 차트 재생목록을 불러오는 매소드
		String sql = "select * from music where musicChart >= 1 and musicChart <= 25";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			List <MusicDTO> musicChartList = new ArrayList<>();
			
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setMusicSeq(rs.getInt("musicSeq"));
				dto.setMusicName(rs.getString("musicName"));
				dto.setMusicArtist(rs.getString("musicArtist"));
				dto.setMusicAlbum(rs.getString("musicAlbum"));
				dto.setMusicImg(rs.getString("musicImg"));
				dto.setMusicMp3(rs.getString("musicMp3"));
				dto.setMusicChart(rs.getInt("musicChart"));
				dto.setMusicGenre(rs.getString("musicGenre"));
				dto.setMusicLylics(rs.getString("musicLylics"));
				musicChartList.add(dto);
			}
			
			return musicChartList;
		}
	}
	
	public List<MusicDTO> musicAllList() throws Exception { 
		String sql = "select * from music";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			List <MusicDTO> musicChartList = new ArrayList<>();
			while (rs.next()) {
				MusicDTO dto = new MusicDTO();
				dto.setMusicSeq(rs.getInt("musicSeq"));
				dto.setMusicName(rs.getString("musicName"));
				dto.setMusicArtist(rs.getString("musicArtist"));
				dto.setMusicAlbum(rs.getString("musicAlbum"));
				dto.setMusicImg(rs.getString("musicImg"));
				dto.setMusicMp3(rs.getString("musicMp3"));
				dto.setMusicChart(rs.getInt("musicChart"));
				dto.setMusicGenre(rs.getString("musicGenre"));
				dto.setMusicLylics(rs.getString("musicLylics"));
				musicChartList.add(dto);
			}

			return musicChartList;
		}
	}
	
}

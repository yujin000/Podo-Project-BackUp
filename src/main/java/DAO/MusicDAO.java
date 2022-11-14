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
import DTO.SelectWishDTO;

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
		String sql = "select * from music where musicChart >= 1 and musicChart <= 30";
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
			List <MusicDTO> musicAllList = new ArrayList<>();
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
				musicAllList.add(dto);
			}

			return musicAllList;
		}
	}
	
	public int addMusic(MusicDTO dto) throws Exception {
		String sql = "insert into music values(?,?,?,?,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, dto.getMusicSeq());
			pstat.setString(2, dto.getMusicName());
			pstat.setString(3, dto.getMusicArtist());
			pstat.setString(4, dto.getMusicAlbum());
			pstat.setString(5, dto.getMusicImg());
			pstat.setString(6, dto.getMusicMp3());
			pstat.setInt(7, dto.getMusicChart());
			pstat.setString(8, dto.getMusicGenre());
			pstat.setString(9, dto.getMusicLylics());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int deleteMusic(int seq) throws Exception {
		String sql = "delete from music where musicseq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int deleteImg(int seq) throws Exception {
		String sql = "delete from albumImg where musicseq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int updateMusic(String musicName, String musicArtist, String musicAlbum, String musicGenre,String musicLylics, int seq)
			throws Exception {
		String sql = "update music set musicname = ?, musicartist = ?, musicalbum = ?, musicgenre = ?,musicLylics=? where musicseq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, musicName);
			pstat.setString(2, musicArtist);
			pstat.setString(3, musicAlbum);
			pstat.setString(4, musicGenre);
			pstat.setString(5, musicLylics);
			pstat.setInt(6, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int getSeq() throws Exception {
		String sql = "select musicSeq.nextval from dual";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
	
	public List<SelectWishDTO> selectAll(String wishEmail) throws Exception {
		String sql = "select * from music inner join wishList on musicSeq=parentmusicSeq where wishEmail=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, wishEmail);
			try (ResultSet rs = pstat.executeQuery();) {
				List<SelectWishDTO> dtoWish = new ArrayList<>();
				while (rs.next()) {
					SelectWishDTO dto = new SelectWishDTO();
					dto.setMusicName(rs.getString("musicName"));
					dto.setMusicArtist(rs.getString("musicArtist"));
					dto.setMusicAlbum(rs.getString("musicAlbum"));
					dtoWish.add(dto);
				}
				return dtoWish;
			}
		}
	}
	
}

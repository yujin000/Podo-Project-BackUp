package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MusicDTO;

public class AdminMusicDAO {
	private static AdminMusicDAO instance = null;

	public static AdminMusicDAO getInstance() {
		if (instance == null) {
			instance = new AdminMusicDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
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

	public int updateMusic(String musicName, String musicArtist, String musicAlbum, String musicGenre, int seq)
			throws Exception {
		String sql = "update music set musicname = ?, musicartist = ?, musicalbum = ?, musicgenre = ? where musicseq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, musicName);
			pstat.setString(2, musicArtist);
			pstat.setString(3, musicAlbum);
			pstat.setString(4, musicGenre);
			pstat.setInt(5, seq);
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

}

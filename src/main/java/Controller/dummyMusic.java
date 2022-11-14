package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class dummyMusic {
	public static void main(String[] args) throws Exception {
		
		
Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "kh";
		String pw = "kh";
		
		String sql = "insert into music values(musicseq.nextval, ? , ? , ? , ?, ? , ? , ? , ?)";
		
		Connection con = DriverManager.getConnection(url,id,pw);
		PreparedStatement pstat = con.prepareStatement(sql);
		
		for(int i = 1;i < 30 ;i++) {
			pstat.setString(1, "title"+i);
			pstat.setString(2, "artist"+i);
			pstat.setString(3, "album"+i);
			pstat.setString(4, "img"+i);
			pstat.setString(5, "mp3"+i);
			pstat.setInt(6, i);
			pstat.setString(7, "genre"+i);
			pstat.setInt(8, i);
			pstat.executeUpdate();
			Thread.sleep((long)(Math.random()*(700-200+1)+200));
			System.out.println(i + " 번째 데이터 : Test" + i);
		}
		con.commit();
		con.close();
		
	}
}

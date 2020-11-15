package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Score;
import util.MySQLConnection;

public class ScoreDAO {
	public static ArrayList<Score> getScoreByID(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM diemthi WHERE mssv = '" + mssv + "' ");
		ResultSet rs = ps.executeQuery();
		
		ArrayList<Score> list = new ArrayList<Score>();

		while (rs.next()) {
			Score score = new Score();
			score.setMssv(rs.getString("mssv"));
			score.setTenmonhoc(rs.getString("tenmonhoc"));
			score.setSotinchi(rs.getString("sotinchi"));
			score.setDiembaitap(rs.getString("diembaitap"));
			score.setDiemgiuaky(rs.getString("diemgiuaky"));
			score.setDiemcuoiky(rs.getString("diemcuoiky"));
			score.setDiemthang4(rs.getString("diemthang4"));
			score.setDiemchu(rs.getString("diemchu"));
			
			list.add(score);
		}

		return list;
	}
}

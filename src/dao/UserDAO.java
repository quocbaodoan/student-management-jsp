package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import util.MySQLConnection;

public class UserDAO {

	public static User getUser(String username, String password) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement(
				"SELECT * FROM sinhvien WHERE mssv = ? AND matkhau = ?");
		ps.setString(1, username);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		User user = new User();

		while (rs.next()) {
			user.setUsername(rs.getString("mssv"));
			user.setPassword(rs.getString("matkhau"));
		}
		return user;
	}

	public static void insert(User user) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("INSERT INTO sinhvien(mssv, matkhau) VALUES(?, ?)");
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());

		ps.execute();
	}

}

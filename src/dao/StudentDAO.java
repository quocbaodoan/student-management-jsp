package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Student;
import util.MySQLConnection;

public class StudentDAO {

	public static ArrayList<Student> getAllStudent() throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT mssv, tensinhvien, sdt, date_format(ngaysinh, \"%d/%m/%Y\") as ngaysinh, email, gioitinh, diachi FROM sinhvien LIMIT 1, 10");
		ResultSet rs = ps.executeQuery();
		ArrayList<Student> list = new ArrayList<Student>();

		while (rs.next()) {
			Student Student = new Student();
			Student.setMssv(rs.getString("mssv"));
			Student.setTensinhvien(rs.getString("tensinhvien"));
			Student.setSdt(rs.getString("sdt"));
			Student.setNgaysinh(rs.getString("ngaysinh"));
			Student.setEmail(rs.getString("email"));
			Student.setGioitinh(rs.getString("gioitinh"));
			Student.setDiachi(rs.getString("diachi"));

			list.add(Student);
		}

		return list;
	}
	
	public static ArrayList<Student> getSearchStudent(String search) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT mssv, tensinhvien, sdt, date_format(ngaysinh, \"%d/%m/%Y\") as ngaysinh, email, gioitinh, diachi FROM sinhvien WHERE mssv NOT IN('100') AND (mssv LIKE '%"+search+"%' OR tensinhvien LIKE '%"+search+"%' OR gioitinh LIKE '%"+search+"%' OR ngaysinh LIKE '%"+search+"%' OR diachi LIKE '%"+search+"%')");
		ResultSet rs = ps.executeQuery();
		ArrayList<Student> list = new ArrayList<Student>();

		while (rs.next()) {
			Student Student = new Student();
			Student.setMssv(rs.getString("mssv"));
			Student.setTensinhvien(rs.getString("tensinhvien"));
			Student.setSdt(rs.getString("sdt"));
			Student.setNgaysinh(rs.getString("ngaysinh"));
			Student.setEmail(rs.getString("email"));
			Student.setGioitinh(rs.getString("gioitinh"));
			Student.setDiachi(rs.getString("diachi"));

			list.add(Student);
		}

		return list;
	}
	
//	public static ArrayList<Student> getStudentByMSSV(String mssv) throws SQLException {
//
//		Connection conn = MySQLConnection.connect();
//		PreparedStatement ps = conn.prepareStatement("SELECT * FROM sinhvien WHERE mssv = ?");
//		ps.setString(1, mssv);
//		ResultSet rs = ps.executeQuery();
//		ArrayList<Student> list = new ArrayList<Student>();
//
//		while (rs.next()) {
//			Student Student = new Student();
//			Student.setMssv(rs.getString("mssv"));
//			Student.setTensinhvien(rs.getString("tensinhvien"));
//			Student.setSdt(rs.getString("sdt"));
//			Student.setNgaysinh(rs.getString("ngaysinh"));
//			Student.setEmail(rs.getString("email"));
//			Student.setGioitinh(rs.getString("gioitinh"));
//			Student.setDiachi(rs.getString("diachi"));
//
//			list.add(Student);
//		}
//
//		return list;
//	}

	public static Student getStudentByID(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM sinhvien WHERE mssv = '" + mssv + "' ");
		ResultSet rs = ps.executeQuery();
		Student Student = new Student();

		while (rs.next()) {
			Student.setMssv(rs.getString("mssv"));
			Student.setTensinhvien(rs.getString("tensinhvien"));
			Student.setSdt(rs.getString("sdt"));
			Student.setNgaysinh(rs.getString("ngaysinh"));
			Student.setEmail(rs.getString("email"));
			Student.setGioitinh(rs.getString("gioitinh"));
			Student.setDiachi(rs.getString("diachi"));
			Student.setMatkhau(rs.getString("matkhau"));
		}

		return Student;
	}
	
	public static Student getStudentInfo(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT mssv, tensinhvien, sdt, date_format(ngaysinh, \"%d/%m/%Y\") as ngaysinh, email, gioitinh, diachi, matkhau FROM sinhvien WHERE mssv = '" + mssv + "' ");
		ResultSet rs = ps.executeQuery();
		Student Student = new Student();

		while (rs.next()) {
			Student.setMssv(rs.getString("mssv"));
			Student.setTensinhvien(rs.getString("tensinhvien"));
			Student.setSdt(rs.getString("sdt"));
			Student.setNgaysinh(rs.getString("ngaysinh"));
			Student.setEmail(rs.getString("email"));
			Student.setGioitinh(rs.getString("gioitinh"));
			Student.setDiachi(rs.getString("diachi"));
			Student.setMatkhau(rs.getString("matkhau"));
		}

		return Student;
	}
	
	public static Student getAdmin() throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT matkhau FROM sinhvien WHERE mssv = '100'");
		ResultSet rs = ps.executeQuery();
		Student Student = new Student();

		while (rs.next()) {
			Student.setMatkhau(rs.getString("matkhau"));
		}

		return Student;
	}

	public static void insert(Student Student) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn
				.prepareStatement("INSERT INTO sinhvien(mssv, tensinhvien, email, sdt, diachi, ngaysinh, gioitinh, matkhau) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
		ps.setString(1, Student.getMssv());
		ps.setString(2, Student.getTensinhvien());
		ps.setString(3, Student.getEmail());
		ps.setString(4, Student.getSdt());
		ps.setString(5, Student.getDiachi());
		ps.setString(6, Student.getNgaysinh());
		ps.setString(7, Student.getGioitinh());
		ps.setString(8, Student.getMatkhau());

		ps.execute();
	}

	public static void update(Student student) throws SQLException {
		
		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("UPDATE sinhvien SET tensinhvien=?,gioitinh=?,ngaysinh=?,diachi=?,email=?,sdt=?,matkhau=? WHERE mssv=?");
		ps.setString(1, student.getTensinhvien());
		ps.setString(2, student.getGioitinh());
		ps.setString(3, student.getNgaysinh());
		ps.setString(4, student.getDiachi());
		ps.setString(5, student.getEmail());
		ps.setString(6, student.getSdt());
		ps.setString(7, student.getMatkhau());
		ps.setString(8, student.getMssv());

		ps.executeUpdate();
	}
	
	public static void updateadmin(Student admin) throws SQLException {
		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("UPDATE sinhvien SET matkhau=? WHERE mssv='100'");
		ps.setString(1, admin.getMatkhau());
		ps.executeUpdate();
	}

	public static void delete(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("DELETE FROM lichhoc WHERE mssv=?");
		ps.setString(1, mssv);
		ps.executeUpdate();
		
		Connection conn2 = MySQLConnection.connect();
		PreparedStatement ps2 = conn2.prepareStatement("DELETE FROM sinhvien WHERE mssv=?");
		ps2.setString(1, mssv);
		ps2.executeUpdate();
	}


	public static void deleteAll() throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("TRUNCATE lichhoc");
		ps.executeUpdate();
		
		Connection conn2 = MySQLConnection.connect();
		PreparedStatement ps2 = conn2.prepareStatement("DELETE FROM sinhvien WHERE mssv NOT IN('100')");
		ps2.executeUpdate();
	}

}

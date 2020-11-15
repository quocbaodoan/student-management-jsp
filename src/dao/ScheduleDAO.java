package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import model.Schedule;
import model.Student;
import util.MySQLConnection;

public class ScheduleDAO {
	private static final char[] SOURCE_CHARACTERS = {'À', 'Á', 'Â', 'Ã', 'È', 'É',
            'Ê', 'Ì', 'Í', 'Ò', 'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â',
            'ã', 'è', 'é', 'ê', 'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý',
            'Ă', 'ă', 'Đ', 'đ', 'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ',
            'ạ', 'Ả', 'ả', 'Ấ', 'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ',
            'Ắ', 'ắ', 'Ằ', 'ằ', 'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ',
            'ẻ', 'Ẽ', 'ẽ', 'Ế', 'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ',
            'Ỉ', 'ỉ', 'Ị', 'ị', 'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ',
            'ổ', 'Ỗ', 'ỗ', 'Ộ', 'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ',
            'Ợ', 'ợ', 'Ụ', 'ụ', 'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ',
            'ữ', 'Ự', 'ự',};

    private static final char[] DESTINATION_CHARACTERS = {'A', 'A', 'A', 'A', 'E',
            'E', 'E', 'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a',
            'a', 'a', 'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u',
            'y', 'A', 'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u',
            'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
            'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e',
            'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E',
            'e', 'I', 'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
            'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
            'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
            'U', 'u', 'U', 'u',};

    public static char removeAccent(char ch){
        int index = Arrays.binarySearch(SOURCE_CHARACTERS, ch);
        if (index >= 0) {
            ch = DESTINATION_CHARACTERS[index];
        }
        return ch;
    }

    public static String removeAccent(String str) {
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            sb.setCharAt(i, removeAccent(sb.charAt(i)));
        }
        String res = sb.toString();
        res = res.toLowerCase();
        res = res.replaceAll("\\s+", "");
        return res;
    }
	
	public static ArrayList<Schedule> getScheduleByID(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM lichhoc WHERE mssv = '" + mssv + "' ");
		ResultSet rs = ps.executeQuery();
		ArrayList<Schedule> list = new ArrayList<Schedule>();

		while (rs.next()) {
			Schedule schedule = new Schedule();
			schedule.setMssv(rs.getString("mssv"));
			schedule.setTenmonhoc(rs.getString("tenmonhoc"));
			schedule.setSotinchi(rs.getString("sotinchi"));
			schedule.setGiangvien(rs.getString("giangvien"));
			schedule.setThoikhoabieu(rs.getString("thoikhoabieu"));
			schedule.setTuanhoc(rs.getString("tuanhoc"));
			schedule.setMamonhoc(rs.getString("mamonhoc"));
			list.add(schedule);
		}
		return list;
	}
	
	public static Schedule getScheduleByMMH(String mamonhoc) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM lichhoc WHERE mamonhoc = '" + mamonhoc + "' ");
		ResultSet rs = ps.executeQuery();
		Schedule schedule = new Schedule();
		
		while (rs.next()) {
			schedule.setMssv(rs.getString("mssv"));
			schedule.setTenmonhoc(rs.getString("tenmonhoc"));
			schedule.setSotinchi(rs.getString("sotinchi"));
			schedule.setGiangvien(rs.getString("giangvien"));
			schedule.setThoikhoabieu(rs.getString("thoikhoabieu"));
			schedule.setTuanhoc(rs.getString("tuanhoc"));
		}
		
		return schedule;
	}
	
	public static void insert(Schedule schedule) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn
				.prepareStatement("INSERT INTO lichhoc(mssv, tenmonhoc, sotinchi, giangvien, thoikhoabieu, tuanhoc, mamonhoc) VALUES(?, ?, ?, ?, ?, ?, ?)");
		ps.setString(1, schedule.getMssv());
		ps.setString(2, schedule.getTenmonhoc());
		ps.setString(3, schedule.getSotinchi());
		ps.setString(4, schedule.getGiangvien());
		ps.setString(5, schedule.getThoikhoabieu());
		ps.setString(6, schedule.getTuanhoc());
		ps.setString(7, schedule.getMamonhoc());
		ps.execute();
	}
	
	public static void update(Schedule schedule) throws SQLException {
		
		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("UPDATE lichhoc SET tenmonhoc=?,sotinchi=?,giangvien=?,thoikhoabieu=?,tuanhoc=? WHERE mamonhoc=? AND mssv=?");
		ps.setString(1, schedule.getTenmonhoc());
		ps.setString(2, schedule.getSotinchi());
		ps.setString(3, schedule.getGiangvien());
		ps.setString(4, schedule.getThoikhoabieu());
		ps.setString(5, schedule.getTuanhoc());
		ps.setString(6, schedule.getMamonhoc());
		System.out.println(schedule.getMamonhoc());
		ps.setString(7, schedule.getMssv());
		ps.executeUpdate();
		
		String mamonhoc = removeAccent(schedule.getTenmonhoc());
		System.out.println(mamonhoc);
		Connection conn2 = MySQLConnection.connect();
		PreparedStatement ps2 = conn2.prepareStatement("UPDATE lichhoc SET mamonhoc=? WHERE tenmonhoc=? AND mssv=?");
		ps2.setString(1, mamonhoc);
		ps2.setString(2, schedule.getTenmonhoc());
		ps2.setString(3, schedule.getMssv());
		ps2.executeUpdate();
	}
	
	public static void delete(String mssv, String mamonhoc) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("DELETE FROM lichhoc WHERE mssv=? AND mamonhoc=?");
		ps.setString(1, mssv);
		ps.setString(2, mamonhoc);

		ps.executeUpdate();
	}
	
	public static void deleteAll(String mssv) throws SQLException {

		Connection conn = MySQLConnection.connect();
		PreparedStatement ps = conn.prepareStatement("DELETE FROM lichhoc WHERE mssv = '"+ mssv +"'");
		ps.executeUpdate();
	}
}

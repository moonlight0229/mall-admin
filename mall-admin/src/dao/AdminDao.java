package dao;
import vo.Admin;
import java.sql.*;

import commons.DBUtil;

public class AdminDao {
	public Admin login(Admin admin) throws Exception {
		Admin returnAdmin = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select admin_id from admin where admin_id=? and admin_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getString("admin_id"));
		}
		return returnAdmin; // null이면 로그인 실패, null이 아니면 로그인 성공
	}
}

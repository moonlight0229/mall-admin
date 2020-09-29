package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

// admin_MemberDao
public class MemberDao {
	// 회원정보 리스트 출력 메소드
	public ArrayList<Member> selectMemberList() throws Exception {
		ArrayList<Member> memberlist = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email, member_pw, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
			memberlist.add(member);		
		}
		conn.close();
		return memberlist;
	}
	// 회원탈퇴시 해당 회원정보 출력
	public Member memberOne(String memberEmail) throws Exception {
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();

		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
		}
		conn.close();
		return member;
	}
	// 회원탈퇴 메소드
	public void deleteMember(String memberEmail) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		System.out.println(memberEmail+" <--memberEmail");
		stmt.executeUpdate();
		conn.close();
	}
}

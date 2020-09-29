package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

// admin_NoticeDao
public class NoticeDao {
	// 전체 공지사항을 출력하는 메소드
	public ArrayList<Notice> selectNoticeList() throws Exception {
		ArrayList<Notice> noticelist = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
			noticelist.add(notice);
		}
		conn.close();
		return noticelist;
	}
	
	// 공지사항 작성 메소드
	public void insertNotice(Notice notice) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.executeUpdate();
		conn.close();
	}
	
	// 공지사항 상세정보 출력 메소드
	public Notice noticeOne(int noticeId) throws Exception {
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();

		if(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		conn.close();
		return notice;
	}
	// 공지사항을 수정하는 메소드
	public void updateNotice(int noticeId, String noticeTitle, String noticeContent) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update notice set notice_title=?, notice_content=? where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, noticeTitle);
		stmt.setString(2, noticeContent);
		stmt.setInt(3, noticeId);
		System.out.println(noticeTitle+" <--noticeTitle");
		System.out.println(noticeContent+" <--noticeContent");
		System.out.println(noticeId+" <--noticeId");
		stmt.executeUpdate();
		conn.close();
	}
	
	// 공지사항 삭제하는 메소드
	public void deleteNotice(int noticeId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		System.out.println(noticeId+" <--noticeId");
		stmt.executeUpdate();
		conn.close();
	}
}

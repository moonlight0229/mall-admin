package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

// admin_CategoryDao
public class CategoryDao {
	// 카테고리 목록을 출력하는 메소드
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> categorylist = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			categorylist.add(category);		
		}
		conn.close();
		return categorylist;
	}
	
	// 카테고리를 추가하는 메소드
	public void insertCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.executeUpdate();
		conn.close();
	}
	
	// 카테고리를 수정,삭제 시 정보를 출력하는 메소드
	public Category CategoryOne(int categoryId) throws Exception {
		Category category = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();

		if(rs.next()) {
			category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
		}
		conn.close();
		return category;
	}
	
	// 카테고리를 수정하는 메소드
	public void updateCategory(int categoryId, String categoryName) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update category set category_name=? where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		stmt.setInt(2, categoryId);
		System.out.println(categoryName+" <--categoryName");
		System.out.println(categoryId+" <--categoryid");
		stmt.executeUpdate();
		conn.close();
	}
	
	// 카테고리를 삭제하는 메소드
	public void deleteCategory(int categoryId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from category where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		System.out.println(categoryId+" <--categoryId");
		stmt.executeUpdate();
		conn.close();
	}
}

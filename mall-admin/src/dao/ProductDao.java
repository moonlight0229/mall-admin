package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

// admin_ProductDao
public class ProductDao {
	// 전체 상품 목록을 출력하는 메소드
	public ArrayList<Product> selectProductList() throws Exception {
		ArrayList<Product> productList = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout, product_pic from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
			productList.add(product);
		}
		conn.close();
		return productList;
	}
	
	// 선택한 카테고리에 속한 상품 목록만 출력하는 메소드
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception { 
		ArrayList<Product> productList = new ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout, product_pic from product where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
			productList.add(product);
		}
		
		conn.close();
		return productList;
	}

	// 상품 상세보기 
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();	
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setProductPic(rs.getString("product_pic"));
		}
		conn.close();
		return product;
	}
	
	// 상품을 추가하는 메소드
	public void insertProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		conn.close();
	}
	
	// 상품정보를 수정하는 메소드
	public void updateProduct(int productId, String productName, int productPrice, String productContent) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_name=?, product_price=?, product_content=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, productName);
		stmt.setInt(2, productPrice);
		stmt.setString(3, productContent);
		stmt.setInt(4, productId);
		System.out.println(productId+" <--productId");
		System.out.println(productName+" <--productName");
		System.out.println(productPrice+" <--productPrice");
		System.out.println(productContent+" <--productContent");
		stmt.executeUpdate();
		conn.close();
	}
	
	// 상품의 품절여부를 변경하는 메소드
	public void modifyProductSoldout(int productId, String productSoldout) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_soldout=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
		} else {
			stmt.setString(1, "Y");
		}
		stmt.setInt(2, productId);
		int row = stmt.executeUpdate();
		System.out.println(row+"행 수정");
		
		conn.close();
	}
	
	// 상품의 사진을 수정하는 메소드
	public void updateProductPic(int productId, String productPic) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update product set product_pic=? where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, productPic);
		stmt.setInt(2, productId);
		System.out.println(productId+" <--productId");
		System.out.println(productPic+" <--productPic");
		stmt.executeUpdate();
		conn.close();
	}
	
	// 상품을 삭제하는 메소드
	public void deleteProduct(int productId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "delete from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		System.out.println(productId+" <--productId");
		stmt.executeUpdate();
		
		conn.close();
	}
}
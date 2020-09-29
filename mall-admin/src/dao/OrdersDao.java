package dao;
import vo.*;
import java.util.*;
import java.sql.*;
import commons.DBUtil;

public class OrdersDao {
	// 전체 주문 리스트를 출력하는 메소드
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception {
		ArrayList<OrdersAndProduct> ordersList = new ArrayList<OrdersAndProduct>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
				
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct(); // oap는 ordersAndProduct의 줄임
			oap.orders = new Orders();
			oap.product = new Product();			
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			oap.product.setProductName(rs.getString("p.product_name"));
			ordersList.add(oap);
		}
		conn.close();
		return ordersList;
	}

	// 주문상태 종류를 불러오는 메소드
	public ArrayList<String> selectOrdersStateList() throws Exception {
		ArrayList<String> ordersStateList = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select distinct orders_state from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			ordersStateList.add(rs.getString("orders_state"));
		}
		conn.close();
		return ordersStateList;
	}
	
	// 선택한 주문상태 리스트만 출력하는 메소드
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception {
		ArrayList<OrdersAndProduct> ordersList = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id=p.product_id where orders_state=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct(); // oap는 ordersAndProduct의 줄임
			oap.orders= new Orders();
			oap.product = new Product();			
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			oap.product.setProductName(rs.getString("p.product_name"));
			ordersList.add(oap);
		}
		conn.close();
		return ordersList;
	}
	
	// 주문상태 수정 시 정보를 출력하는 메소드
	public OrdersAndProduct ordersOne(int ordersId) throws Exception {
		OrdersAndProduct oap = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id=p.product_id where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordersId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			oap = new OrdersAndProduct();
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			oap.product.setProductName(rs.getString("p.product_name"));
		}
		conn.close();
		return oap;	
	}
	
	// 주문상태를 수정하는 메소드
	public void modifyOrdersState(int ordersId, String ordersState) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update orders set orders_state=? where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		stmt.setInt(2, ordersId);
		
		int row = stmt.executeUpdate();
		System.out.println(row+"행 수정");
		
		conn.close();
	}
}

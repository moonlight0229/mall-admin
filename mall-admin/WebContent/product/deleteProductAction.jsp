<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//deleteProductAction
	
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(productId);
	
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp");
%>
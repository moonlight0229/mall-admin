<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//updateProductAction
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	System.out.println(productId+" <--productId");
	System.out.println(productName+" <--productName");
	System.out.println(productPrice+" <--productPrice");
	System.out.println(productContent+" <--productContent");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(productId, productName, productPrice, productContent);
	
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+ productId);
%>
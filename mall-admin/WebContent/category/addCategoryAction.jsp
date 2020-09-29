<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//addCategoryAction
	
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");

	String categoryName = request.getParameter("categoryName");
	
	Category category = new Category();
	category.setCategoryName(categoryName);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>
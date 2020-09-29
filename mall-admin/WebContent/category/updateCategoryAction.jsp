<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//updateCategoryAction
	
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String categoryName = request.getParameter("categoryName");
	
	Category category = new Category();
	category.setCategoryId(categoryId);
	category.setCategoryName(categoryName);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(categoryId, categoryName);
	
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	// deleteCategoryAction
	request.setCharacterEncoding("UTF-8");

	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(categoryId);
	
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>
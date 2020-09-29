<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	// deleteNoticeAction
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(noticeId);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>
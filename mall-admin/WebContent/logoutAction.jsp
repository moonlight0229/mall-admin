<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// adminLogoutAction
	session.invalidate();
	response.sendRedirect("/mall-admin/login.jsp");
%>
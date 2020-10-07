<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//admin_deleteMemberAction
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");

	String memberEmail = request.getParameter("memberEmail");
	
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(memberEmail);
	
	response.sendRedirect(request.getContextPath()+"/member/memberList.jsp");
%>
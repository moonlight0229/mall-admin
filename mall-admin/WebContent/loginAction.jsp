<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	//adminLoginAction
	request.setCharacterEncoding("UTF-8");

	if(session.getAttribute("loginAdminId") != null) {
		System.out.println("이미 로그인 되어있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	Admin paramAdmin = new Admin();
	paramAdmin.setAdminId(adminId);
	paramAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paramAdmin);
	
	if(loginAdmin == null) {
		System.out.println("로그인 실패");
		response.sendRedirect("/mall-admin/login.jsp");
	} else {
		System.out.println("로그인 성공");
		// 로그인 정보를 sesseion에 저장한다.(page < request < session < application 순)
		session.setAttribute("loginAdminId", loginAdmin.getAdminId()); // 세션에 변수 만드는 방법
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>	
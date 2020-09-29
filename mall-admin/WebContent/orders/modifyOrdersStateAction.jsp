<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//modifyOrdersStateAction
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	System.out.println(ordersId+" <--ordersId");
	System.out.println(ordersState+" <--ordersState");
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.modifyOrdersState(ordersId, ordersState);
	
	response.sendRedirect("request.getContextPath()/orders/ordersList.jsp?ordersId=" + ordersId);
%>
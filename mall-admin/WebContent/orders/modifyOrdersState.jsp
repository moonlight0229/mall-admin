<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrdersState</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	System.out.println(ordersId + " <--ordersId");
	OrdersDao ordersDao = new OrdersDao();
	OrdersAndProduct oap = ordersDao.ordersOne(ordersId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1 class="display-4">주문 관리</h1>
	<form method="post" action="<%=request.getContextPath()%>/orders/modifyOrdersStateAction.jsp?ordersId=<%=oap.orders.getOrdersId()%>">
	<div class="input-group">
		<select class="form-control" name="ordersState">
			<option value="주문완료">주문완료</option>
			<option value="배송준비중">배송준비중</option>
			<option value="배송중">배송중</option>
			<option value="배송완료">배송완료</option>
			<option value="주문취소">주문취소</option>
		</select>
	</div>
		<button type="submit" class="btn btn-light" style="float: right;">수정</button>
	</form>
</div>
</body>
</html>
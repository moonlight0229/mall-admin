<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 목록</title>
		
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
			
			String ordersState = "";
			
			if(request.getParameter("ordersState") != null) {
				ordersState = request.getParameter("ordersState");
			}
			OrdersDao ordersDao = new OrdersDao();
			ArrayList<OrdersAndProduct> ordersList = null;
			if(ordersState.equals("")) {
				ordersList = ordersDao.selectOrdersList();
			} else {
				ordersList = ordersDao.selectOrdersListByState(ordersState);
			}
			ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">주문 목록</h1>
			
			<div class="d-flex justify-content-end input-group mb-3">
				<form method="post" action="<%=request.getContextPath()%>/orders/ordersList.jsp">
					<div class="input-group">
						<select class="form-control" name="ordersState">
							<option value="">전체</option>
								<%
									for(String s : ordersStateList) { // s = state
										if (s.equals(ordersState)) {
								%>
											<option value="<%=s%>" selected="selected"><%=s%></option>
								<%
										} else {
								%>
											<option value="<%=s%>"><%=s%></option>
								<%
										}
									}
								%>
								
						</select>
						<div class="input-group-append">
							<button type="submit" class="btn btn-success">
								보기
							</button>
						</div>
					</div>
				</form>
			</div>
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>상품명</th>
						<th>주문개수</th>
						<th>배송지</th>
						<th>주문상태</th>
						<th>주문일시</th>
						<th>주문관리</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(OrdersAndProduct oap : ordersList) { // oap = order and Product
					%>
							<tr class="clickable-row" data-href="">
								<td><%=oap.getOrders().getOrdersId()%></td>
								<td><%=oap.getProduct().getProductName()%></td>
								<td><%=oap.getOrders().getOrdersAmount()%></td>
								<td><%=oap.getOrders().getOrdersAddr()%></td>
								<td><%=oap.getOrders().getOrdersState()%></td>
								<td><%=oap.getOrders().getOrdersDate()%></td>
								<td>
									<a class="btn btn-primary" href="<%=request.getContextPath()%>/orders/modifyOrdersState.jsp?ordersId=<%=oap.getOrders().getOrdersId()%>">
										관리
									</a>
								</td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>
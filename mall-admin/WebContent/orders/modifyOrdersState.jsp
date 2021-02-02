<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문정보</title>
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
			OrdersAndProduct oap = ordersDao.selectOrdersOne(ordersId);
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">주문 관리</h1>
			
			<form method="post" action="<%=request.getContextPath()%>/orders/modifyOrdersStateAction.jsp?ordersId=<%=oap.getOrders().getOrdersId()%>">
				<table class="table table-hover">
					<tr>
						<th>주문번호</th>
						<td><%=oap.getOrders().getOrdersId()%></td>
					</tr>
					<tr>
						<th>상품번호</th>
						<td><%=oap.getOrders().getProductId()%></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><%=oap.getProduct().getProductName()%></td>
					</tr>
					<tr>
						<th>주문개수</th>
						<td><%=oap.getOrders().getOrdersAmount()%></td>
					</tr>
					<tr>
						<th>주문금액</th>
						<td><%=oap.getOrders().getOrdersPrice()%></td>
					</tr>
					<tr>
						<th>배송지</th>
						<td><%=oap.getOrders().getOrdersAddr()%></td>
					</tr>
					<tr>
						<th>주문상태</th>
						<td>
							<div class="input-group">
								<select class="form-control" name="ordersState">
									<%
										if (oap.getOrders().getOrdersState().equals("주문완료")) {
									%>
											<option value="주문완료" selected="selected">주문완료</option>
											<option value="배송준비중">배송준비중</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
											<option value="주문취소">주문취소</option>
											
									<%
										} else if (oap.getOrders().getOrdersState().equals("배송준비중")) {
									%>
											<option value="주문완료">주문완료</option>
											<option value="배송준비중" selected="selected">배송준비중</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
											<option value="주문취소">주문취소</option>
									<%
										} else if (oap.getOrders().getOrdersState().equals("배송중")) {
									%>
											<option value="주문완료">주문완료</option>
											<option value="배송준비중">배송준비중</option>
											<option value="배송중" selected="selected">배송중</option>
											<option value="배송완료">배송완료</option>
											<option value="주문취소">주문취소</option>
									<%
										} else if (oap.getOrders().getOrdersState().equals("배송완료")) {
									%>
											<option value="주문완료">주문완료</option>
											<option value="배송준비중">배송준비중</option>
											<option value="배송중">배송중</option>
											<option value="배송완료" selected="selected">배송완료</option>
											<option value="주문취소">주문취소</option>
									<%
										} else if (oap.getOrders().getOrdersState().equals("주문취소")) {
									%>
											<option value="주문완료">주문완료</option>
											<option value="배송준비중">배송준비중</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
											<option value="주문취소" selected="selected">주문취소</option>
									<%
										}
									%>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>주문일시</th>
						<td><%=oap.getOrders().getOrdersDate()%></td>
					</tr>
				</table>
				
				<div class="d-flex justify-content-end input-group">
					<button type="submit" class="btn btn-success">
						수정
					</button>
				</div>
			</form>
		</div>
	</body>
</html>
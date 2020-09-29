<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>admin_productOne</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	// 비로그인시 접근 불가
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId + " <--productId");
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">상품 상세보기</h1>
	<div>
		<a class="btn btn-danger" style="float: right;" href="<%=request.getContextPath()%>/product/deleteProductAction.jsp?productId=<%=product.getProductId()%>">삭제</a>
		<a class="btn btn-light" style="float: right;" href="<%=request.getContextPath()%>/product/updateProduct.jsp?productId=<%=product.getProductId()%>">수정</a>
	</div>
	<table class="table table-hover">
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/<%=product.getProductPic()%>" class="rounded">
			</td>
			<td>
				<a href="<%=request.getContextPath()%>/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>">이미지 수정</a>
			</td>
		</tr>
		<tr>
			<td>상품ID</td>
			<td><%=product.getProductId()%></td>
		</tr>
		<tr>
			<td>카테고리ID</td>
			<td><%=product.getCategoryId()%></td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><%=product.getProductName()%></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td><%=product.getProductPrice()%></td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td><%=product.getProductContent()%></td>
		</tr>
		<tr>
			<td>상품 품절여부</td>
			<td>
				<%
					if(product.getProductSoldout().equals("Y")) {
				%>
						<a class="btn btn-light" href="<%=request.getContextPath()%>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">품절</a>
				<%	
					} else {
				%>
						<a class="btn btn-light" href="<%=request.getContextPath()%>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">판매중</a>
				<%		
					}
				%>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
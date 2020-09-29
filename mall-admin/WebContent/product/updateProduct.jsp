<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateProduct</title>
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

	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+" <--productId");
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">상품정보 수정</h1>
	
	<form method="post" action="<%=request.getContextPath()%>/product/updateProductAction.jsp?productId=<%=product.getProductId()%>">
		<table class="table table-hover">
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" class="form-control" name="productName" value="<%=product.getProductName()%>">
				</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" class="form-control" name="productPrice" value="<%=product.getProductPrice()%>">
				</td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td>
					<input type="text" class="form-control" name="productContent" value="<%=product.getProductContent()%>">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-light" style="float: right;">수정</button>
	</form>
</div>
</body>
</html>
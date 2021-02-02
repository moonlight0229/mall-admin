<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateProduct</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 유효성 검사
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#productName").val().length<1){
					alert("상품명을 입력하세요");
					$("#productName").focus(); // 입력 포커스를 productName 입력창으로
					return;
				} else if($("#productPrice").val().length<1){
					alert("상품가격을 입력하세요");
					$("#productPrice").focus(); // 입력 포커스를 productPrice 입력창으로
					return;
				} else if($("#productContent").val().length<1){
					alert("상품 설명을 입력하세요");
					$("#productContent").focus(); // 입력 포커스를 productContent 입력창으로
					return;
				}			
				$("#updateProductForm").submit();
			});
		});
	</script>
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
	
	<h1 class="display-4 mt-3 mb-3">상품정보 수정</h1>
	
	<form method="post" action="<%=request.getContextPath()%>/product/updateProductAction.jsp?productId=<%=product.getProductId()%>" id=updateProductForm>
		<table class="table table-hover">
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" class="form-control" name="productName" id="productName" value="<%=product.getProductName()%>">
				</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" class="form-control" name="productPrice" id="productPrice" value="<%=product.getProductPrice()%>">
				</td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td>
					<input type="text" class="form-control" name="productContent" id="productContent" value="<%=product.getProductContent()%>">
				</td>
			</tr>
		</table>
		<button type="button" id="btn" class="btn btn-light" style="float: right;">수정</button>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminProductList</title>
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
	int categoryId = -1;
	if(request.getParameter("categoryId") != null) {
		categoryId = Integer.parseInt(request.getParameter("categoryId"));
	}
		
	ProductDao productDao = new ProductDao();
	ArrayList<Product> productList = null;
	if(categoryId == -1) {
		productList = productDao.selectProductList();
	} else {
		productList = productDao.selectProductListByCategoryId(categoryId);
	}
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">상품 목록</h1>
    
    <!-- 카테고리 별 상품목록 출력하기 -->
	<div class="btn-group" role="group">
		<a class="btn btn-light" href="<%=request.getContextPath()%>/product/productList.jsp">전체</a>
			<%
				for(Category category : categoryList) {
			%>
					<a class="btn btn-light" href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=category.getCategoryId()%>">
						<%=category.getCategoryName()%>
					</a>
			<%
				}
			%>
	</div>
	
	<a class="btn btn-light" style="float: right;" href="<%=request.getContextPath()%>/product/addProduct.jsp">상품 추가</a>
		
	<table class="table table-hover">
		<thead>
			<tr>
				<th>상품ID</th>
				<th>카테고리ID</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>상품 품절여부</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product product : productList) {
					if(product.getProductSoldout().equals("Y")) {
			%>
						<tr>
							<td>
								<del>
									<a class="btn btn-light" href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=product.getProductId()%>">
										<%=product.getProductId()%>
									</a>
								</del>
							</td>
							<td><del><%=product.getCategoryId()%></del></td>
							<td><del><%=product.getProductName()%></del></td>
							<td><del><%=product.getProductPrice()%>원</del></td>
							<td><del>품절</del></td>
						</tr>
			<%
					} else {
			%>
						<tr>
							<td>
								<a class="btn btn-light" href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=product.getProductId()%>">
									<%=product.getProductId()%>
								</a>
							</td>
							<td><%=product.getCategoryId()%></td>
							<td><%=product.getProductName()%></td>
							<td><%=product.getProductPrice()%>원</td>
							<td>판매중</td>
						</tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>
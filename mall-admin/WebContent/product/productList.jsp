<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 목록</title>
		
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
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">상품 목록</h1>
		    
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
			
			<a class="btn btn-success mb-3" style="float: right;" href="<%=request.getContextPath()%>/product/addProduct.jsp">
				추가
			</a>
				
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No.</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>가격</th>
						<th>품절여부</th>
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
											<%=product.getProductId()%>
										</del>
									</td>
									<td>
										<del>
											<%=product.getCategoryId()%>
										</del>
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=product.getProductId()%>">
											<del>
												<%=product.getProductName()%>
											</del>
										</a>	
									</td>
									<td>
										<del>
											<%=product.getProductPrice()%>원
										</del>
									</td>
									<td>
										<del>품절</del>
									</td>
								</tr>
					<%
							} else {
					%>
								<tr>
									<td>
										<%=product.getProductId()%>
									</td>
									<td>
										<%=product.getCategoryId()%>
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=product.getProductId()%>">
											<%=product.getProductName()%>
										</a>
									</td>
									<td>
										<%=product.getProductPrice()%>원
									</td>
									<td>
										판매중
									</td>
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
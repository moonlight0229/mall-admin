<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addProduct</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 유효성 검사
		$(document).ready(function(){
			$("#btn").click(function(){
				// console.log($("#categoryId").val());
				if($("#categoryId").val() == ""){
					alert("카테고리를 선택하세요");
					return;
				} if($("#productName").val().length<1){
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
				} if($(':radio[name="productSoldout"]:checked').val() == undefined){
					alert("품절여부를 선택하세요");
					return;
				}
				$("#addProductForm").submit();
			});
		});
	</script>
</head>
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	
	// 상품 추가 시 카테고리 선택을 위해 카테고리 목록을 불러오는 코드
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">상품 추가</h1>
	
	<form method="post" action="<%=request.getContextPath()%>/product/addProductAction.jsp" id="addProductForm">
		<table class="table table-hover">
			<tr>
				<td>카테고리ID</td>
				<td>
					<select class="form-control" name="categoryId" id="categoryId">
						<option value="">카테고리 선택</option>
					<%
						for(Category c : categoryList) {
					%>
							<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
					<%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>
					<input type="text" class="form-control" name="productName" id="productName">
				</td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td>
					<input type="text" class="form-control" name="productPrice" id="productPrice">
				</td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td>
					<textarea class="form-control" rows="5" cols="80" name="productContent" id="productContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>상품 품절여부</td>
				<td>
					<input type="radio" class="form-check-input" name="productSoldout" value="N" class="productSoldout">품절 아님 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="form-check-input" name="productSoldout" value="Y" class="productSoldout">품절
				</td>
			</tr>
		</table>
		<button type="button" id="btn" class="btn btn-success" style="float: right;">상품 추가</button>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 수정</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		// 유효성 검사
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#categoryName").val().length<1){
					alert("카테고리 이름을 입력하세요");
					$("#categoryName").focus(); // 입력 포커스를 categoryName 입력창으로
					return;
				}
				$("#updateCategory").submit();
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
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	System.out.println(categoryId + " <--categoryId");
	CategoryDao categoryDao = new CategoryDao();
	Category category = categoryDao.CategoryOne(categoryId);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1 class="display-4">카테고리 수정</h1>
	<form method="post" action="<%=request.getContextPath()%>/category/updateCategoryAction.jsp?categoryId=<%=category.getCategoryId()%>" id="updateCategory">
		<table class="table table-hover">
			<tr>
				<td>카테고리 이름</td>
				<td>
					<input type="text" class="form-control" name="categoryName" id="categoryName" value="<%=category.getCategoryName()%>">
				</td>
			</tr>
		</table>
		<button type="button" id="btn" class="btn btn-light" style="float: right;">수정</button>
	</form>
</div>
</body>
</html>
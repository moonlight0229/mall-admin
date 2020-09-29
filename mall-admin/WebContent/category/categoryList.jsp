<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>categoryList</title>
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
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">카테고리 목록</h1>

	<div>
		<a class="btn btn-light" style="float: right;" href="<%=request.getContextPath()%>/category/addCategory.jsp" >카테고리 추가</a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>카테고리ID</th>
				<th>카테고리 이름</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category category : categoryList) {
			%>
					<tr>
						<td><%=category.getCategoryId()%></td>
						<td><%=category.getCategoryName()%></td>
						<td>
							<a class="btn btn-light" href="<%=request.getContextPath()%>/category/updateCategory.jsp?categoryId=<%=category.getCategoryId()%>&categoryName=<%=category.getCategoryName()%>">
								수정
							</a>
						</td>
						<td>
							<a class="btn btn-danger" href="<%=request.getContextPath()%>/category/deleteCategory.jsp?categoryId=<%=category.getCategoryId()%>&categoryName=<%=category.getCategoryName()%>">
								삭제
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
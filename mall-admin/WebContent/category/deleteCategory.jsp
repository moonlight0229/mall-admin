<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>카테고리 삭제</title>
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
		
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			System.out.println(categoryId + " <--categoryId");
			CategoryDao categoryDao = new CategoryDao();
			Category category = categoryDao.CategoryOne(categoryId);
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">카테고리 삭제</h1>
			
			<form method="post" action="<%=request.getContextPath()%>/category/deleteCategoryAction.jsp?categoryId=<%=category.getCategoryId()%>">
				<div class="mb-3 d-flex justify-content-center">
					선택한 <%=category.getCategoryName()%> 카테고리를 정말로 삭제 하시겠습니까?
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-danger">
						삭제
					</button>
				</div>
			</form>
		</div>
	</body>
</html>
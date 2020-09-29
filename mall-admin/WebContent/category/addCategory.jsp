<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addCategory</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">카테고리 추가</h1>
	
	<form method="post" action="/mall-admin/category/addCategoryAction.jsp">
		<table class="table table-hover">
			<tr>
				<td>카테고리 이름</td>
				<td><input type="text" class="form-control" name="categoryName"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success" style="float: right;">카테고리 추가</button>
	</form>
</div>
</body>
</html>
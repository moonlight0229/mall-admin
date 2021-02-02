<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>카테고리 추가</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<script>
		// 유효성 검사
			$(document).ready(function(){
				$("#btn").click(function(){
					if($("#categoryName").val().length<1){
						alert("카테고리 이름을 입력하세요");
						$("#categoryName").focus(); // 입력 포커스를 categoryName 입력창으로
						return;
					}
					$("#addCategoryForm").submit();
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
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">			
			<h1 class="display-4 mt-3 mb-3">카테고리 추가</h1>
			
			<form method="post" action="/mall-admin/category/addCategoryAction.jsp" id="addCategoryForm">
				<table class="table table-hover">
					<tr>
						<td>카테고리 이름</td>
						<td><input type="text" class="form-control" name="categoryName" id="categoryName"></td>
					</tr>
				</table>
				<button type="button" id="btn" class="btn btn-success" style="float: right;">카테고리 추가</button>
			</form>
		</div>
	</body>
</html>
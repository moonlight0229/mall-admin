<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminLogin</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	if(session.getAttribute("loginAdminId") != null) {
		System.out.println("이미 로그인 되어있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<div class="container">
	<h1 class="display-4">관리자 로그인</h1>
	<form method="post" action="/mall-admin/loginAction.jsp">
		<table class="table table-hover">
			<tr>
				<td>관리자 ID</td>
				<td><input type="text" class="form-control" name="adminId"></td>
			</tr>
			<tr>
				<td>관리자 PW</td>
				<td><input type="password" class="form-control" name="adminPw"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success" style="float: right;">로그인</button>
	</form>
</div>
</body>
</html>
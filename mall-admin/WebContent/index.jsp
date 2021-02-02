<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인 페이지</title>
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
		%>
		
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">관리자 메인 페이지</h1>
			
			<p>
				<%=session.getAttribute("loginAdminId")%>님 반갑습니다.
			</p>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addNotice</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
</head>
<body>
<%	
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1 class="display-4">공지사항 작성</h1>
	
	<form method="post" action="<%=request.getContextPath()%>/notice/addNoticeAction.jsp">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" class="form-control" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="5" cols="80" name="noticeContent"></textarea></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success" style="float: right;">작성</button>
	</form>
</div>
</body>
</html>	
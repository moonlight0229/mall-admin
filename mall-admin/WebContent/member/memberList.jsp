<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>회원 목록</title>
		
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
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> memberList = memberDao.selectMemberList();
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">회원 목록</h1>
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Email</th>
						<th>이름</th>
						<th>회원가입 일자</th>
						<th>회원탈퇴</th>
					</tr>
				</thead>
				
				<tbody>
					<%
						for(Member member : memberList) {
					%>
							<tr>
								<td><%=member.getMemberEmail()%></td>
								<td><%=member.getMemberName()%></td>
								<td><%=member.getMemberDate()%></td>
								<td><a class="btn btn-danger" href="<%=request.getContextPath()%>/member/deleteMember.jsp?memberEmail=<%=member.getMemberEmail()%>">탈퇴</a></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		
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
		
			String memberEmail = request.getParameter("memberEmail");
			System.out.println(memberEmail + " <--memberEmail");
			MemberDao memberDao = new MemberDao();
			Member member = memberDao.memberOne(memberEmail);
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<div align="center">
				<h1 class="display-4 mt-3 mb-3">회원 탈퇴</h1>
				
				<form method="post" action="<%=request.getContextPath()%>/member/deleteMemberAction.jsp?memberEmail=<%=member.getMemberEmail()%>">
					선택한 <%=member.getMemberEmail()%> 회원을 정말로 탈퇴시키겠습니까?
					<div>
						<button type="submit" class="btn btn-danger mt-3">탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
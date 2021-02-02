<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>adminLogin</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script>
			// 유효성 검사
			$(document).ready(function(){
				$("#btn").click(function(){
					if($("#adminId").val().length<1){
						alert("ID를 입력하세요");
						$("#adminId").focus(); // 입력 포커스를 adminId 입력창으로
						return;
					} else if($("#adminPw").val().length<1){
						alert("비밀번호를 입력하세요");
						$("#adminPw").focus(); // 입력 포커스를 adminPw 입력창으로
						return;
					}
					$("#loginForm").submit();
				});
			});
		</script>
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
			<div align="center">
				<h1 class="display-4 mt-3 mb-3">관리자 로그인</h1>
				
				<form method="post" action="/mall-admin/loginAction.jsp" id="loginForm">
					<table style="margin-top: 30px">
						<tr>
							<th>ID&nbsp;</th>
							<td><input type="text" class="form-control" name="adminId" id="adminId" value="admin@goodee.com"></td>
						</tr>
						<tr>
							<th>PW&nbsp;</th>
							<td><input type="password" class="form-control" name="adminPw" id="adminPw" value="1234"></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 20px">
								<button type="button" id= "btn" class="btn btn-success btn-block">로그인</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>
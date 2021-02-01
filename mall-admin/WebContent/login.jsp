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
		
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-4">관리자 로그인</h1>
			</div>
		</div>
		
		<div class="container">
			<form method="post" action="/mall-admin/loginAction.jsp" id="loginForm">
				<div align="center">
					<table style="margin-top: 30px">
						<tr>
							<td>ID&nbsp;</td>
							<td><input type="text" class="form-control" name="adminId" id="adminId" value="admin@goodee.com"></td>
						</tr>
						<tr>
							<td>PW&nbsp;</td>
							<td><input type="password" class="form-control" name="adminPw" id="adminPw" value=""></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 20px">
								<button type="button" id= "btn" class="btn btn-success">로그인</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>
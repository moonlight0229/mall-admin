<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<script>
			// 유효성 검사
			$(document).ready(function(){
				$("#btn").click(function(){
					if($("#noticeTitle").val() == ""){
						alert("제목을 입력하세요");
						$("#noticeTitle").focus(); // 입력 포커스를 noticeTitle 입력창으로
						return;
					} else if($("#noticeContent").val() == ""){
						alert("내용을 입력하세요");
						$("#noticeContent").focus(); // 입력 포커스를 noticeContent 입력창으로
						return;
					}
					$("#updateNoticeForm").submit();
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
			request.setCharacterEncoding("UTF-8");
			
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			System.out.println(noticeId+" <--noticeId");
			NoticeDao noticeDao = new NoticeDao();
			Notice notice = noticeDao.noticeOne(noticeId);
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
		
			<h1 class="display-4 mt-3 mb-3">공지사항 수정</h1>
			
			<form method="post" action="<%=request.getContextPath()%>/notice/updateNoticeAction.jsp?noticeId=<%=notice.getNoticeId()%>" id="updateNoticeForm">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="<%=notice.getNoticeTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea class="form-control" rows="5" cols="80" name="noticeContent" id="noticeContent"><%=notice.getNoticeContent()%></textarea>
						</td>
					</tr>
				</table>
				<button type="button" id="btn" class="btn btn-success" style="float: right;">수정</button>
			</form>
		</div>
	</body>
</html>
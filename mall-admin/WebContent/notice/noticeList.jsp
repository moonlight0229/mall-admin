<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		
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
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		
		<div class="container">
			<h1 class="display-4 mt-3 mb-3">공지사항 목록</h1>
			
			<a class="btn btn-light mb-3" style="float: right;" href="<%=request.getContextPath()%>/notice/addNotice.jsp">
				작성
			</a>
			
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice notice : noticeList) {
					%>
						<tr>
							<td>
								<%=notice.getNoticeId()%>
							</td>
							<td>
								<a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=notice.getNoticeId()%>">
									<%=notice.getNoticeTitle()%>
								</a>
							</td>
							<td><%=notice.getNoticeDate()%></td>
						</tr>
					<%		
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>
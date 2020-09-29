<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	// updateNoticeAction
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	System.out.println(noticeId+" <--noticeId");
	System.out.println(noticeTitle+" <--noticeTitle");
	System.out.println(noticeContent+" <--noticeContent");
	
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(noticeId, noticeTitle, noticeContent);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeId="+noticeId);
%>
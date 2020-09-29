<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<h2>관리자 메뉴</h2>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/index.jsp">홈으로</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/category/categoryList.jsp">카테고리 관리</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/product/productList.jsp">상품 관리</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/orders/ordersList.jsp">주문 관리</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/notice/noticeList.jsp">공지 관리</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/mall-admin/member/memberList.jsp">회원 관리</a>
			</li>
		</ul>
		<a class="btn btn-danger" style="float: right;" href="/mall-admin/logoutAction.jsp">로그아웃</a>
	</div>
</nav>

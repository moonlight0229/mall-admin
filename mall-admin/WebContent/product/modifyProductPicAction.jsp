<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	// 1. 상품아이디와 이미지 파일 받기
	// 2. 이미지파일을 서버/images 폴더에 새로운 이름으로 저장
	// 3. 저장된 이미지의 이름을 상품테이블에서 수정 ex) default.jpg를 새로운 이름으로 변경
	
	/* <form enctype="multipart/form-data"> 기존방식 사용불가
	String productId = request.getParameter("productId");
	String productPic = request.getParameter("productPic");
	System.out.println(productId+" <--productId");
	System.out.println(productPic+" <--productPic");
	*/
	
	// cos.jar 외부 라이브러리 사용
	int size = 1024 * 1024 * 100; // 100MB
	String path = application.getRealPath("images");
	DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", dfp);
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(productId+" <--productId");
	// System.out.println(multi.getOriginalFileName("productPic")+"<-- 파일 원본이름");
	System.out.println(multi.getFilesystemName("productPic")+"<-- 변경된 파일이름");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(productId, productPic);
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId=" + productId);
%>
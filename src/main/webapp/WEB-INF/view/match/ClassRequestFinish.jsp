<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SwithMe</title>
	<link href="../resources/css/submitbutton.css" rel="stylesheet">
</head>
<body id="page-top">
	<%@ include file="../include/main_header.jsp" %>
	
	<section class="page-section">
		<div class="container">
		</div>
	</section>
	
	<section class="page-section">
		<div class="container text-center">
			<h2>${name } 선생님께 수업이 요청되었습니다.</h2>
			<br>
			<button class="sbtn sbtn-4 sbtn-4a" onclick="location.href='<c:url value='/main/class'/>'">홈으로</button>
		</div>
	</section>
	
	<section class="page-section">
		<div class="container">
		</div>
	</section>
	
	<section class="page-section">
		<div class="container">
		</div>
	</section>
	
	<%@ include file="../include/main_footer.jsp" %>
</body>
</html>
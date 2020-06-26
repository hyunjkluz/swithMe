<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Upload Post</title>
</head>
<body>
<div>
<%@ include file="../include/main_header.jsp" %>
</div>
<div class="container">
<section id="page-section">
<form:form modelAttribute="boardForm" enctype="multipart/form-data" action='/swithMe/connection/${connectionId}/board' >
	<form:select path="type" items="${boardTypes}" />
	<br>
	제목: <form:input path="title" type="text" name="title" /><br/>
	내용: <form:textarea path="content" name="content"></form:textarea><br/>
	첨부파일: <form:input path="upload" type="file" name="upload"/>
	<br>
	<input type="submit" value="저장"/>
	<a href="<c:url value='/connection/${connectionId}/board/main' />">취소</a>
</form:form>
</section>
</div>
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
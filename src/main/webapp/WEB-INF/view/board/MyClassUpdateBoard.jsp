<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<form:form modelAttribute="board" action="/swithMe/connection/${connectionId}/board/${board.boardId}" enctype="multipart/form-data">
	<!-- <input type="hidden" name="_method" value="PUT" /> -->
	<form:select path="boardForm.type" items="${boardTypes}" />
	<br>
	제목: <form:input path="boardForm.title" type="text" name="title" /><br/>
	내용: <form:textarea path="boardForm.content" name="content"/> <br/>
	첨부파일: ${board.boardForm.upload} <br/>
	<form:input path="boardForm.uploadFile" type="file" name="uploadFile" />
	<br>
	<input type="submit" value="수정"/>
	<a href="<c:url value='/connection/${connectionId}/board/?category=' />${board.boardForm.type}">취소</a>
</form:form>
</section>
</div>
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
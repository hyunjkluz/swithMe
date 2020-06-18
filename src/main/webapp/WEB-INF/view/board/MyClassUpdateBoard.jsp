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
<form:form modelAttribute="board" enctype="mutipart/form-data"  action="/swithMe/connection/${connectionId}/board/${board.boardId}">
	<input type="hidden" name="_method" value="put" />
	<form:select path="boardForm.type" items="${boardTypes}" />
	<br>
	제목: <input type="text" name="title" value="${board.boardForm.title}"/><br/>
	내용: <textarea name="content">${board.boardForm.content}</textarea><br/>
	<input type="file" name="file">
	<br>
	<input type="submit" value="수정"/>
	<a href="<c:url value='/connection/${connectionId}/board/main' />">취소</a>
</form:form>
</section>
</div>
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
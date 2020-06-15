<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<form:form modelAttribute="boardForm" enctype="mutipart/form-data" action="/swithMe/connection/1/board">
	<form:select path="type" items="${boardTypes}" />
	<br>
	제목: <input type="text" name="title" /><br/>
	내용: <textarea name="content"></textarea><br/>
	<input type="file" name="upload">
	<br>
	<input type="submit" value="등록"/>
	<a href="<c:url value='/connection/1/board/main' />">취소</a>
</form:form>

</div>
</body>
</html>
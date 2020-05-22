<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Upload Post</title>
</head>
<body>
<div>
<form:form commandName="boardForm" enctype="mutipart/form-data">
	<form:select path="boardType" items="${boardTypes}" />
	<br>
	제목: <input type="text" name="title" /><br/>
	내용: <textarea name="content"></textarea><br/>
	<input type="file" name="file">
	<br>
	<input type="submit" value="등록"/>
	<input type="reset" value="취소"/>
</form:form>
</div>
</body>
</html>
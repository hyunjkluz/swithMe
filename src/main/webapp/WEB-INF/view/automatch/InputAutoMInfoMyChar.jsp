<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>자동 매칭</title>
</head>
<body>
<form method="post" action="/swithMe/student/match/step3">
	<p>유형 선택 : 5번 반복</p>
	<input type="radio" name="type" value="t1">타입1
	<input type="radio" name="type" value="t2">타입2
	
	<a href="<c:url value='/student/match/step2'/>">이전 단계로</a>
	<input type="submit" value="다음">
</form>
</body>
</html>
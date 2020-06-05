<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP2</title>
</head>
<body>

	<h2>선생님 매칭 정보 작성 - 수업 정보 선택</h2>

	<form method="post" action="/swithMe/teacher/match/step3">
		<c:forEach var="i" items="${tmInfo.level}">
		<div>
		<p>수업 가능한 난이도 선택</p>
			<c:out value="${i.subject}"/>
			<input type="checkbox" name="level" value="3">상 
			<input type="checkbox" name="level" value="2" >중 
			<input type="checkbox" name="level" value="1" >하 <br>
		</div> 
		</c:forEach>
		
		<a href="<c:url value='/swithMe/teacher/match/step1'/>">이전 단계로</a> 
		<input type="submit" value="다음">

	</form>

</body>
</html>
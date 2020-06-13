<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP5</title>
</head>
<body>
	<form:form modelAttribute="tmInfo" method="post" action="/swithMe/teacher/match/step5">

		<h2>선생님 매칭 정보 작성 - 유형 선택</h2>

		<form:radiobuttons items="${char1}" itemValue="id" itemLabel="name" path="ch1" /><br>
			<form:errors path="ch1"/>
		<br><br>

		<form:radiobuttons items="${char2}" itemValue="id" itemLabel="name" path="ch2" /><br>
			<form:errors path="ch2"/>
		<br><br>

		<form:radiobuttons items="${char3}" itemValue="id" itemLabel="name" path="ch3" /><br>
			<form:errors path="ch3"/>
		<br><br>

		<form:radiobuttons items="${char4}" itemValue="id" itemLabel="name" path="ch4" /><br>
			<form:errors path="ch4"/>
		<br><br>

		<form:radiobuttons items="${char5}" itemValue="id" itemLabel="name" path="ch5" /><br>
			<form:errors path="ch5"/>
		<br><br>

		<a href="<c:url value='/swithMe/teacher/match/step3'/>">이전 단계로</a> 
		<input type="submit" value="다음" />

	</form:form>
</body>
</html>
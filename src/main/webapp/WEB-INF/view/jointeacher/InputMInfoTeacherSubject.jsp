<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP1</title>
</head>
<body>

	<h2>선생님 매칭 정보 작성 - 과목 선택</h2>

	<form:form modelAttribute="tmInfo" method="post" action="/swithMe/teacher/match/step2">
	
		<form:errors path="subjectName" />
		<form:select path="subjectName" multiple="false">
			<form:options items="${subjects}" itemValue="name" itemLabel="name" />
		</form:select>
		
		<br><br>
		
		<p>수업 가능한 학생 성별 선택</p>
		<form:errors path="gender" />
		<form:radiobuttons items="${genders}" itemValue="stringVal"
			itemLabel="name" path="gender" />
		
		<br><br>
		<input type="submit" value="다음">
		
	</form:form>
</body>
</html>
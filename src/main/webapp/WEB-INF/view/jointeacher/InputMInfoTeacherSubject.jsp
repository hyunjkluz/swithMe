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

	<form modelAttribute="tmInfo" method="post" action="/swithMe/teacher/match/step2">
	
		<p>과목</p>
		<form:errors path="subjectId" />
		<form:select path="subjectId" multiple="false">
			<form:options items="${subjects }" itemValue="id" itemLabel="name" />
		</form:select>
		<br>
		
		<br><br>
		
		<p>수업 가능한 학생 선별 선택</p>
		<input type="checkbox" name="gender" value="either" >성별 무관 
		<input type="checkbox" name="gender" value="female">여자 
		<input type="checkbox" name="gender" value="male" >남자 
		
		<br><br>
		<input type="submit" value="다음">
		
	</form>
</body>
</html>
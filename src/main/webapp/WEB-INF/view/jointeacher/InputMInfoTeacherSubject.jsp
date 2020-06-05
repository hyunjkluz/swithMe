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
	
		<input type="checkbox" name="subject" value="korean">국어 
		<input type="checkbox" name="subject" value="math1">수학1 
		<input type="checkbox" name="subject" value="math2">수학2 
		<input type="checkbox" name="subject" value="midmath">중등수학 
		<input type="checkbox" name="subject" value="elemath">초등수학 
		<input type="checkbox" name="subject" value="english">영어 
		
		<br><br>
		
		<p>수업 가능한 학생 선별 선택</p>
		<input type="checkbox" name="gender" value="either" >성별 무관 
		<input type="checkbox" name="gender" value="female">여자 
		<input type="checkbox" name="gender" value="male" >남자 
		
		<br><br>
		<input type="submit" value="다음">
		
	</form:form>
</body>
</html>
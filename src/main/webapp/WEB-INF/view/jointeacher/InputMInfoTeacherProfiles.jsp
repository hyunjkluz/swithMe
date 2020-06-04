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
	<form method="post" action="/swithMe/teacher/match/fin">

		<h2>선생님 매칭 정보 작성 - 자기소개서 작성</h2>

		<p>Q1. 자기소개를 해주세요.</p>
		<br>
		<textarea name="introduction1" rows="10" cols="40" autofocus required
			wrap="hard" placeholder="학생들에게 선생님을 자유롭게 소개해주세요."></textarea>

		<p>Q2. 어떤 방식으로 수업을 진행하시는지 소개해주세요.</p>
		<br>
		<textarea name="introduction2" rows="10" cols="40" autofocus required
			wrap="hard"
			placeholder="EX)자체 제작 문법 교재로 기초부터 심화까지 문제풀이 위주의 수업을 진행합니다."></textarea>

		<br>
		<a href="<c:url value='/swithMe/teacher/match/step4'/>">이전 단계로</a>  
		<input type="submit" value="다음">

	</form>
</body>
</html>
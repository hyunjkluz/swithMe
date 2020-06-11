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
<spring:hasBindErrors name="studentMatchForm" />
<form:form modelAttribute="studentMatchForm" method="post" action="/swithMe/student/match/step4">
	<h2>추가 정보 정보 입력</h2>

	<p>선택한 과목의 실력을 입증할 수 있는 객관적 자료를 입력해주세요.</p>	
	<form:textarea path="memo" cols="40" rows="10" wrap="hard" placeholder="해당 과목의 모의고사, 중간고사, 기말고사 등의 성적을 입력해주세요." />
	<form:errors path="memo"/>
	
	<p>선생님에게 하고싶은 말</p>
	<form:textarea path="toTeacher" cols="40" rows="10" wrap="hard" placeholder="선택한 선생님께 전달하고싶은 말을 작성해주세요."/>
	
	<a href="<c:url value='/student/match/step3'/>">이전 단계로</a>
	<input type="submit" value="매칭결과 보기">
</form:form>
</body>
</html>
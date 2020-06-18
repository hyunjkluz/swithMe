<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP5</title>
</head>
<style>
.form {
	text-align: center;
	padding-top: 120px;
	padding-bottom: 30px;
}
.input {
	margin: auto;
	padding-top: 30px;
	padding-down: 30px;
	width: 800px;
	border: 3px solid #FFF9B1;
	width: 800px;
}
</style>
<body>
	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<div class="stepimage">
			<img src="../../resources/assets/Teacher_Step_5.png" />
		</div>
		<div class="input">
		<form:form modelAttribute="tmInfo" method="post"
			action="/swithMe/teacher/match/fin">

			<h5 class="text-muted">Q7. 자기 소개를 해주세요.</h5>
			<br>
			<form:textarea class="form-control" name="introduction1" rows="10" cols="40"
			path="intro1"
			placeholder="학생들에게 선생님을 자유롭게 소개해주세요."/>
			<br><br>
			<h5 class="text-muted">Q8. 어떤 방식으로 수업을 진행하시는지 알려주세요.</h5>
			<br>
			<form:textarea class="form-control" name="introduction2" rows="10" cols="40" 
			path="intro2"
			placeholder="EX)자체 제작 문법 교재로 기초부터 심화까지 문제풀이 위주의 수업을 진행합니다."/>

			<br><br>
			<button class="btn btn-outline-warning cc_pointer" type="button"
				onclick="location.href='/swithMe/teacher/match/step4'">이전
				단계로</button>
			<button class="btn btn-outline-warning cc_pointer">다음</button>
			<br>
			<br>

		</form:form>
		</div>
	</div>
</body>
</html>
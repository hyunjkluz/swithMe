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
			<h5 class="text-muted">Q8. 수업 경력 혹은 관련 경험이 있으신가요 ?</h5>
			<br>
			<form:textarea class="form-control" name="introduction2" rows="10" cols="40" 
			path="intro2"
			placeholder="EX) 중학생 영어 과외 경험이 있으며, 방학 중에는 초등학생 교육봉사를 꾸준히 하고 있습니다."/>

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
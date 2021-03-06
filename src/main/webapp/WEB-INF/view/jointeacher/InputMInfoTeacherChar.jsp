<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP4</title>
<link rel="stylesheet" href="../../resources/css/theme.css" />
</head>
<style>
.form {
	text-align: center;
	padding-top: 120px;
}

.stepimage {
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
			<img src="../../resources/assets/Teacher_Step_4.png" />
		</div>

		<div class="input">
			<spring:hasBindErrors name="tmInfo" />
			<form:form modelAttribute="tmInfo" method="post"
				action="/swithMe/teacher/match/step5">

				<h5 class="text-muted">Q6. 수업 유형을 알려주세요.</h5>
				<br>

				<form:radiobuttons items="${char1}" itemValue="id" itemLabel="name"
					path="ch1" />
				<br>
				<form:errors path="ch1" />
				<br>
				<br>

				<form:radiobuttons items="${char2}" itemValue="id" itemLabel="name"
					path="ch2" />
				<br>
				<form:errors path="ch2" />
				<br>
				<br>

				<form:radiobuttons items="${char3}" itemValue="id" itemLabel="name"
					path="ch3" />
				<br>
				<form:errors path="ch3" />
				<br>
				<br>

				<form:radiobuttons items="${char4}" itemValue="id" itemLabel="name"
					path="ch4" />
				<br>
				<form:errors path="ch4" />
				<br>
				<br>

				<form:radiobuttons items="${char5}" itemValue="id" itemLabel="name"
					path="ch5" />
				<br>
				<form:errors path="ch5" />
				<br>
				<br>

				<button class="btn btn-outline-warning cc_pointer" type="button"
					onclick="location.href='/swithMe/teacher/match/step3'">이전
					단계로</button>
				<button class="btn btn-outline-warning cc_pointer">다음</button>
				<br><br>

			</form:form>
		</div>
	</div>
</body>
</html>
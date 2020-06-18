<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP2</title>
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
	text-align: center;
	margin: auto;
	padding-top: 40px;
	padding-down: 10px;
	width: 800px;
	border: 3px solid #FFF9B1;
	width: 800px;
}

.submit {
	border: 0px;
	background: #FFFFFF;
}

</style>
<body>
	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<div class="stepimage">

			<img src="../../resources/assets/Teacher_Step_2.png" />
		</div>
		<div class="input">
			<h4 class="text-muted">
				선택하신 과목 :
				<c:out value="${tmInfo.subjectName}" />
			</h4>
			<br>
			<h5 class="text-muted">Q3. 해당 과목의 수업 가능 난이도를 선택해주세요.</h5>

			<form:form modelAttribute="tmInfo" method="post"
				action="/swithMe/teacher/match/step3">
				<div>
					<br> <br>
					<form:errors path="level" />
					<form:radiobuttons items="${levels}" itemValue="intVal"
						itemLabel="name" path="level" />
				</div>


				<br>
				<button class="btn btn-outline-warning cc_pointer" type="button"
					onclick="location.href='/swithMe/teacher/match/step1'">이전
					단계로</button>
				<button class="btn btn-outline-warning cc_pointer">다음</button>
				<br><br>

			</form:form>
		</div>
	</div>

</body>
</html>
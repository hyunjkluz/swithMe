<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Student Match STEP4</title>
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
			<img src="../../resources/assets/Student_Step_4.png" />
		</div>
		<div class="input">
			<spring:hasBindErrors name="studentMatchForm" />
			<form:form modelAttribute="studentMatchForm" method="post"
				action="/swithMe/student/match/step4">
				<h5 class="text-muted">Q7. 선택한 과목의 실력을 입증할 수 있는 객관적 자료를 입력해주세요.</h5>
				<br>
				<form:textarea class="form-control" path="memo" cols="40" rows="10" wrap="hard"
					placeholder="해당 과목의 모의고사, 중간고사, 기말고사 등의 성적을 입력해주세요." />
				<form:errors path="memo" />
				<br>
				<h5 class="text-muted">Q8. 선생님에게 하고싶은 말이 있나요? </h5>
				<br>
				<form:textarea class="form-control" path="toTeacher" cols="40" rows="10" wrap="hard"
					placeholder="선택한 선생님께 전달하고 싶은 말을 작성해주세요." />

				<br><br>
			<button class="btn btn-outline-warning cc_pointer" type="button"
				onclick="location.href='/swithMe/student/match/step3'">이전
				단계로</button>
			<button class="btn btn-outline-warning cc_pointer">다음</button>
			<br>
			<br>

		</form:form>
		</div>
	</div>
</body>
</html>
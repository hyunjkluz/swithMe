<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Student Match STEP2</title>
<link rel="stylesheet" href="../../resources/css/theme.css" />
</head>
<style>
.form {
	text-align: center;
	padding-top: 120px;
}

.input {
	margin: auto;
	padding-top: 30px;
	padding-down: 30px;
	width: 800px;
	border: 3px solid #FFF9B1;
	width: 800px;
}

table {
	width: 800px;
	margin: auto;
	text-align: center;
	border: 3px solid #FFF9B1;
}
</style>
<body>
	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<div class="stepimage">
			<img src="../../resources/assets/Student_Step_2.png" />
		</div>
		<form:form modelAttribute="studentMatchForm" method="post"
			action="/swithMe/student/match/step2">
			<table>
				<c:forEach items="${studentMatchForm.subjectTest}" var="st"
					varStatus="s">
					<tr class="table-warning">
						<td><p>${st.studentTestPaper.question}</p></td>

						<td width="600px" rowspan="2">
						<form:textarea
								class="form-control"
								path="subjectTest[${s.index}].studentAnswer" cols="40" rows="10"
								placeholder="문제에 대한 답을 작성해주세요." /></td>

					</tr>
					<tr>
						<td><h5 class="text-muted">LV
								${st.studentTestPaper.ability }</h5></td>
					</tr>
				</c:forEach>
			</table>
	<br>
	<br>
	<button class="btn btn-outline-warning cc_pointer" type="button"
		onclick="location.href='/swithMe/student/match/step1'">이전 단계로</button>
	<button class="btn btn-outline-warning cc_pointer">다음</button>
	</form:form>
	</div>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>자동 매칭</title>
<!-- Remember to include jQuery :) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.teacherClassCard {
	background-color: #fffab5;
	margin: 10px;
	text-align: center;
	float: left;
}
</style>
</head>
<body>
	<spring:hasBindErrors name="studentMatchForm" />
	<form:form modelAttribute="studentMatchForm" method="post"
		action="/swithMe/student/match/fin">
		<div>
			선생님 사징 + 간단한 학과 정보
			<p>
				<a href="#ex1" rel="modal:open">Open Modal</a>
			</p>
		</div>

		<div id="ex1" class="modal">
			<p>구체적인 선생님 프로필 보여주기.</p>
			<a href="#" rel="modal:close">Close</a>
		</div>

		<input type="submit" value="선생님 선택">
		<br>
		<br>

		<form:errors path="teacherId" />

		<c:forEach items="${classCardList }" var="cc" varStatus="i">
			<div class="teacherClassCard">
				<form:radiobutton path="teacherId" value="${cc.teacher.id }" />
				<h1>${ cc.teacher.name}(${ cc.teacherInfo.entranceYear})</h1>
				<h3>${cc.teacherInfo.university.name }/
					${cc.teacherInfo.major.name }</h3>
			</div>
		</c:forEach>
	</form:form>
</body>
</html>
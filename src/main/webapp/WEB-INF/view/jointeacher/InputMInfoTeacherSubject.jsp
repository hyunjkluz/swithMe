<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<title>Teacher Join STEP1</title>
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

.select {
	width: 200px;
	margin: auto;
}

.btn {
	border: none;
	font-family: inherit;
	font-size: inherit;
	color: #fff;
	background: #fff362;
	cursor: pointer;
	padding: 25px 80px;
	display: inline-block;
	margin: 15px 30px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	outline: none;
	position: relative;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
}

input[type='radio'] {
	padding-left:10px;
	
}
</style>

<body>
	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<div class="stepimage">
			<img src="../../resources/assets/Teacher_Step_1.png">
		</div>


		<div class="input">
			<form:form modelAttribute="tmInfo" method="post"
				action="/swithMe/teacher/match/step2">
				
				<h5 class="text-muted">Q1. 수업 가능한 과목을 선택해주세요.</h5>
				<div class="select btn btn-primary">
					<form:errors class="dropdown-item" path="subjectName" />
					<form:select class="dropdown-item" path="subjectName" multiple="false">
						<form:options items="${subjects}" itemValue="name" itemLabel="name"/>
					</form:select>
				</div>
				<br>
				<br>
				<h5 class="text-muted">Q2. 수업 가능한 학생 성별을 선택해주세요.</h5><br>
					<form:errors path="gender" />
					<form:radiobuttons class="custom-custom-radio" items="${genders}" itemValue="stringVal"
						itemLabel="name" path="gender"/>
				<br>
				<br>
				
				<button class="btn btn-outline-warning cc_pointer">다음</button>
			</form:form>
		</div>
	</div>
</body>


</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join Finish</title>
</head>
<style>
.form {
	text-align: center;
	padding-top: 200px;
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
.check {
	background: #fff9b1;
	width: 200px;
	height: 30px;
	margin: auto;
	padding-top: 15px;
}
</style>
<body>

	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>

	<div class="form">

		<img src="../../resources/assets/Teacher_Step_Fin.png" />
		<h4 class="text-muted">매칭 정보를 전부 작성해주셔서 감사합니다 !</h4>
		<br>
		<h4 class="text-muted">과외 매칭 서비스에 자동 등록 되셨습니다.</h4>
		<br> <br>
		
		<hr style="border: solid 2px #fff9b1; width: 40%">
		
		<br> <br>

		<img src="../../resources/assets/Teacher_Step_Fin_2.png">
		
		<br> <br>
		<h3 class="check">
			<a href="<c:url value='/main'/>">확인하러가기</a>
		</h3>
	</div>

</body>
</html>
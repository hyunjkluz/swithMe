<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP2</title>
</head>
<body>

	<h2>선생님 매칭 정보 작성 - 수업 정보 선택</h2>

	<form:form modelAttribute="tmInfo" method="post"
		action="/swithMe/teacher/match/step3">
		<div>
			<p>수업 가능한 난이도 선택</p>
			<c:out value="${tmInfo.subjectName}" />
			<br>
			<form:errors path="level" />
			<form:radiobuttons items="${levels}" itemValue="intVal"
				itemLabel="name" path="level" />
		</div>

		<a href="<c:url value='/swithMe/teacher/match/step1'/>">이전 단계로</a>
		<input type="submit" value="다음">

	</form:form>

</body>
</html>
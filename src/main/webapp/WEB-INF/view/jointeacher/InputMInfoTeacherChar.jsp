<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP5</title>
</head>
<body>
	<form method="post" action="/swithMe/teacher/match/step5">

		<h2>선생님 매칭 정보 작성 - 유형 선택</h2>

		<input type="radio" name="teachertype1" value="type1_1">유형1_1
		<input type="radio" name="teachertype1" value="type1_2">유형1_2
		
		<br>

		<input type="radio" name="teachertype2" value="type2_1">유형2_1
		<input type="radio" name="teachertype2" value="type2_2">유형2_2

		<br>
		
		<input type="radio" name="teachertype3" value="type3_1">유형3_1
		<input type="radio" name="teachertype3" value="type3_2">유형3_2

		<br>

		<input type="radio" name="teachertype4" value="type4_1">유형4_1
		<input type="radio" name="teachertype4" value="type4_2">유형4_2

		<br>

		<a href="<c:url value='/swithMe/teacher/match/step3'/>">이전 단계로</a> 
		<input type="submit" value="다음" />

	</form>
</body>
</html>
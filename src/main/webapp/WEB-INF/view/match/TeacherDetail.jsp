<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
</head>
<body>
	<form:form modelAttribute="detail" method="post"
		action="/swithMe/class/${detail.classId}/request">
		<div>선생님 사진 보여주기</div>
		<table border="1">
			<tr>
				<td>이름</td>
				<td>${detail.teacher.name}(${detail.teacherInfo.entranceYear}/${detail.teacherInfo.teacherGender == "WOMEN" ? "여자" : "남자"})</td>
			</tr>
			<tr>
				<td>학력</td>
				<td>${detail.teacherInfo.university.name }
					${detail.teacherInfo.major.name }</td>
			</tr>
			<tr>
				<td>과목 정보 (난이도)</td>
				<td>${detail.subject.name }(${detail.ability == 1 ? "하" : detail.ability == 2 ? "중" : "상"})</td>
			</tr>
			<tr>
				<td>수업 가능한 지역</td>
				<td>지역 블록 반복</td>
			</tr>
		</table>

		<br>
		<input type="submit" value="수업 신청하기" />
		<br>
		<br>

		<table border="1">
			<tr>
				<td>과목이름 (평점)</td>
			</tr>
			<tr>
				<td>평가내용</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
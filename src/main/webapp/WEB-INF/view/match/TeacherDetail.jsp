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
	<form method="post" action="/swithMe/class/1/request">
		<div>선생님 사진 보여주기</div>
		<table border="1">
			<tr>
				<td>이름 (나이/성별)</td>
				<td>김현진 (24/여)</td>
			</tr>
			<tr>
				<td>학력</td>
				<td>동덕여자대학교 컴퓨터학과</td>
			</tr>
			<tr>
				<td>과목 정보 (난이도)</td>
				<td>수학(중)</td>
			</tr>
			<tr>
				<td>수업 가능한 지역</td>
				<td>지역 블록 반복</td>
			</tr>
		</table>

		<br> <input type="submit" value="수업 신청하기" /> <br> <br>

		<table border="1">
			<tr>
				<td>과목이름 (평점)</td>
			</tr>
			<tr>
				<td>평가내용</td>
			</tr>
		</table>
	</form>
</body>
</html>
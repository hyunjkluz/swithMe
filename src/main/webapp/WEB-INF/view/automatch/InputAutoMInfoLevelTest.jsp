<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>자동 매칭</title>
</head>
<body>
<form method="post" action="/swithMe/student/match/step2">
	<table>
		<tr>
			<td>문제 이미지 삽입</td>
			<td>
				<textarea name="answer1" cols="40" rows="10" autofocus required wrap="hard" placeholder="문제 1번에 대한 답을 작성해주세요"></textarea>
			</td>
		</tr>
		<tr>
			<td>문제 이미지 삽입</td>
			<td>
				<textarea name="answer2" cols="40" rows="10" autofocus required wrap="hard" placeholder="문제 2번에 대한 답을 작성해주세요"></textarea>
			</td>
		</tr>
		<tr>
			<td>문제 이미지 삽입</td>
			<td>
				<textarea name="answer3" cols="40" rows="10" autofocus required wrap="hard" placeholder="문제 3번에 대한 답을 작성해주세요"></textarea>
			</td>
		</tr>
	</table>
	<a href="<c:url value='/student/match/step1'/>">이전 단계로</a>
	<input type="submit" value="다음">
</form>
</body>
</html>
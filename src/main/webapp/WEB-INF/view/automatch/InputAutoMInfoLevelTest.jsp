<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>자동 매칭</title>
</head>
<body>
	<form:form modelAttribute="studentMatchForm" method="post"
		action="/swithMe/student/match/step2">
		<table>
			<c:forEach items="${studentMatchForm.subjectTest}" var="st" varStatus="s">
				<tr>
					<td><p>${st.studentTestPaper.question }</p></td>


					<td rowspan="2"><form:textarea path="subjectTest[${s.index}].studentAnswer" cols="40" rows="10"
							placeholder="문제에 대한 답을 작성해주세요"/>
					</td>
				</tr>
				<tr>
					<td>난이도: ${st.studentTestPaper.ability }</td>
				</tr>
			</c:forEach>

		</table>
		<a href="<c:url value='/student/match/step1'/>">이전 단계로</a>
		<input type="submit" value="다음">
	</form:form>
</body>
</html>
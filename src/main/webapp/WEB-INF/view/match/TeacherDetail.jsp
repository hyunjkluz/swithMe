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
		<div>${detail.teacherInfo.profileImg }</div>

		<h2>${detail.teacher.name}(${detail.teacherInfo.entranceYear}/${detail.teacherInfo.teacherGender == "WOMEN" ? "여자" : "남자"})</h2>
		<table border="1">
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
				<td>수업 희망 학생 성별</td>
				<td>${detail.studentGender == 'ANY' ? "상관없음" : detail.studentGender == 'WOMEN' ? "여자 학생" : "남자 학생" }</td>
			</tr>
			<tr>
				<td>수업 가능한 시간</td>
				<td><c:forEach items="${detail.teacherTimes}" var="times"
						varStatus="t">
						${times.time == 'am' ? "오전" : times.time == 'pm' ? "오후" : "저녁" }
					</c:forEach></td>
			</tr>
			<tr>
				<td>수업 가능한 지역</td>
				<td><c:forEach items="${detail.teacherRegion }" var="dong">
						${dong.name }	
					</c:forEach></td>
			</tr>
		</table>

		<br>
		<c:if test="${userSession == null || userSession.type == 'student'}">
			<input type="submit" value="수업 신청하기" />
		</c:if>
		<br>
		<br>

		<table border="1">
			<tr>
				<td>자기소개서</td>
				<td>${detail.teacherMatch.profileIntro }</td>
			</tr>
			<tr>
				<td>수업 경력</td>
				<td>${detail.teacherMatch.profileCareer }</td>
			</tr>
			<tr>
				<td>수업 스타일</td>
				<td>${detail.teacherMatch.profileStyle }</td>
			</tr>
		</table>

		<br>
		<br>
		<br>
		<h4>수업 후기</h4>
		<table border="1">
			<%
				int flag = 0;
			%>
			<c:forEach items="${detail.feedback }" var="fb">
				<c:if test="${fb.id != null }">
					<%
						flag += 1;
					%>
					<tr>
						<td colspan="2">과목이름 (${detail.teacher.rate })</td>
					</tr>
					<tr>
						<td>${fb.content }</td>
						<td>${fb.rate }</td>
					</tr>
				</c:if>
			</c:forEach>
			<%
				if (flag == 0) {
			%>
			<tr>
				<td colspan="2">아직 후기가 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
	</form:form>
</body>
</html>
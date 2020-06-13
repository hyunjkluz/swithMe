<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPageTeacher</title>
</head>
<body>

	<div>

		<!-- 프로필 사진 -->

		<a href="<c:url value=''/>">회원 정보 수정</a> &nbsp; 
		<a href="<c:url value=''/>">매칭 정보 수정</a>

	</div>

	<div>
		<p>수업 신청 현황</p>
		<table id="timetable">
			<thead>
				<tr>
					<td>요청</td>
					<td>상태</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>

			</tbody>
		</table>

	</div>


</body>
</html>
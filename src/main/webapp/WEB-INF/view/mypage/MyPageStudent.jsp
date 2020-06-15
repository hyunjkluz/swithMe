<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>MyPageStudent</title>
<style>

	.mypage-student-status {
		margin: auto;
        border: 1px solid black;
        width: 600px;
        padding: 30px 30px 30px 30px;
	}
	
	table {
		border-collapse: collapse;
		border: 1px solid;
	}
	
</style>
</head>
<body>

	<div>
	
	<!-- 프로필 사진 -->
	
	<a href="<c:url value=''/>">회원 정보 수정</a> 
	
	</div>
	
	<div class="mypage-student-status">
	<p> 수업 신청 현황 </p>
	<table border="1px" id="status" width="200px">
			<thead>
				<tr>
					<td>요청</td>
					<td>상태</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>ㅇㅇㅇ선생님<br>과목명</td>
					<td><a href="<c:url value='/mypage/student/request'/>">신청 요청</a></td>
				</tr>
				<tr>
					<td>ㅂㅂㅂ선생님<br>과목명</td>
					<td><a href="<c:url value='/mypage/student/class'/>">수업 중</a></td>
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
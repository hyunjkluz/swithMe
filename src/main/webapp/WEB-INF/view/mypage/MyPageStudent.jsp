<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPageStudent</title>
<link rel="stylesheet" href="../resources/css/theme.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
	function setConnection(e) {
		var modal = document.getElementById("ex1");
		$('#ex1').empty();

		const location = window.location.href;
		
		const connectionId = event.target.getAttribute('data-arg1');
		const url = location.split("mypage")[0] + "connection/" + connectionId
				+ "/teacher/detail";

		$
				.ajax({
					url : url,
					type : "GET",
					dateType : "json",
					contentType : "application/json",
					success : function(detail) {
						console.log(detail);

						var table = document.createElement('table');

						var tr = document.createElement('tr');

						var td1 = document.createElement('td');
						td1.innerHTML = '이름';
						var td2 = document.createElement('td');
						var sGender = detail.teacherInfo.teacherGender == 'WOMEN' ? "여자 선생님"
								: "남자 선생님";
						td2.innerHTML = detail.teacher.name + "(" + sGender
								+ ")";

						tr.appendChild(td1);
						tr.appendChild(td2);
						table.appendChild(tr);

						tr = document.createElement('tr');
						td1 = document.createElement('td');
						td1.innerHTML = '학교';
						td2 = document.createElement('td');
						td2.innerHTML = detail.teacherInfo.university.name
								+ " " + detail.teacherInfo.major.name + " "
								+ detail.teacherInfo.entranceYear + "("
								+ detail.teacherInfo.status + " 중)";

						tr.appendChild(td1);
						tr.appendChild(td2);
						table.appendChild(tr);

						if (detail.step == 'MATCH') {
							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '전화번호';
							td2 = document.createElement('td');
							td2.innerHTML = detail.teacher.phone;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);
						}

						modal.appendChild(table);

					},
					error : function(error) {
						alert(errorThrown.statusText);
					}
				});
	}
</script>
<style>
.left {
	float: left;
	text-align: center;
}

.buttons {
	padding: 200px 50px 30px 400px;
}

.mypage-student-status {
	margin: auto;
	border: 3px solid #FFF9B1;
	width: 600px;
	padding: 30px 30px 30px 30px;
	margin-top: 30px;
	margin-bottom: 30px;
}

table, td, th {
	border: 1px solid #ddd;
	text-align: left;
}

table {
	border-collapse: collapse;
	width: 100%;
}

thead {
	 background-color: #fff9b1;
	 text-align: center;
}

th, td {
	padding: 15px;
}

image {
	padding-bottom: 30px;
}
.modal {
	padding-top:100px;
}
.modalDiv {
	padding-top:100px;
}
</style>

</head>

<body id="page-top">
<div class="modalDiv">
	<div id="ex1" class="modal">
</div>
</div>
	<%@ include file="../include/main_header.jsp" %>
	<div class="buttons left">
		<img class="image" src="../resources/assets/Student_mypage.png" /><br><br>
		<button class="btn btn-outline-warning cc_pointer">회원 정보 수정</button>

	</div>

	<div class="mypage-student-status left">
		<h4 class="text-muted">수업 신청 현황</h4><br>
		<table id="status" width="200px">
			<thead>
				<tr>
					<td>요청</td>
					<td>상태</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${connections }" var="conn">
					<tr>
						<td>${conn.teacher }(${conn.subject })</td>
						<td><c:choose>
								<c:when test="${conn.step == 'FINISH' }">
									<p>수업 완료</p>
								</c:when>
								<c:when test="${conn.step == 'REVIEW' }">
									<p>수업 완료</p>
									<br />
									<a
										href="<c:url value='/review/connection/${conn.connectionId}'/>">수업
										후기 작성하기</a>
								</c:when>
								<c:when test="${conn.step == 'CLASS' }">
									<p>수업 중</p>
								</c:when>
								<c:when test="${conn.step == 'MATCH' }">
									<p>
										<a href="#ex1" rel="modal:open" onclick="setConnection()"
											data-arg1="${conn.connectionId }">수업 확정 대기 중</a><br /> <a
											href="<c:url value='/connection/${conn.connectionId}/step?step=REJECT&type=student'/>">거절</a>
									</p>
								</c:when>
								<c:when test="${conn.step == 'REQUEST' }">
									<p>
										<a href="#ex1" rel="modal:open" onclick="setConnection()"
											data-arg1="${conn.connectionId }">수업 요청 확인</a><br /> <a
											href="<c:url value='/connection/${conn.connectionId}/step?step=REJECT&type=student'/>">거절</a>
									</p>
								</c:when>
								<c:otherwise>
									<p>수업 취소</p>
								</c:otherwise>
							</c:choose>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<section class="page-section">
		<div class="container text-center">
		</div>
	</section>

</body>
</html>
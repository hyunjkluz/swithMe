<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPageTeacher</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.left {
	float:left;
	text-align:center;
}
.buttons {
	padding: 200px 50px 30px 400px;
}
.mypage-teacher-status {
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

a.modalA:link, a.modalA:visited {
	background-color: #ffbe0d;
	color: white;
	padding: 25px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

a.modalA:hover, a.modalA:active {
	background-color: #ffe18f;
}
image {
	padding-bottom: 30px;
}
</style>
<script type="text/javascript">
	function setConnection(e) {
		var modal = document.getElementById("ex1");
		$('#ex1').empty();

		const connectionId = event.target.getAttribute('data-arg1');
		const url = "http://localhost:8080/swithMe/connection/" + connectionId
				+ "/detail";

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
						var sGender = detail.studentInfo.studentGender == 'WOMEN' ? "여자 학생"
								: "남자 학생";
						td2.innerHTML = detail.student.name + "(" + sGender
								+ ")";

						tr.appendChild(td1);
						tr.appendChild(td2);
						table.appendChild(tr);

						tr = document.createElement('tr');
						td1 = document.createElement('td');
						td1.innerHTML = '학교';
						td2 = document.createElement('td');
						td2.innerHTML = detail.studentInfo.school.name + "("
								+ detail.studentInfo.schoolType + ") "
								+ detail.studentInfo.status + "중";

						tr.appendChild(td1);
						tr.appendChild(td2);
						table.appendChild(tr);

						if (detail.step == 'MATCH') {
							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '전화번호';
							td2 = document.createElement('td');
							td2.innerHTML = detail.student.phone;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);
						}

						modal.appendChild(table);

						if (detail.studentMatch != null
								&& detail.studentMatch.id != null) {
							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '본인이 생각하는 과목 수준';
							td2 = document.createElement('td');
							td2.innerHTML = detail.studentMatch.ability == 1 ? '하'
									: detail.studentMatch.ability == 2 ? '중'
											: '상';

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);

							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '수업 가능한 시간';
							td2 = document.createElement('td');
							var time = "";
							for ( var t in detail.studentMatch.times) {
								time += detail.studentMatch.times[t].time == 'am' ? "오전 "
										: detail.studentMatch.times[t].time == 'pm' ? "오후 "
												: "저녁 "
							}
							td2.innerHTML = time;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);

							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '수업 가능한 지역';
							td2 = document.createElement('td');
							var region = "";
							for ( var r in detail.studentMatch.studentRegion) {
								region += detail.studentMatch.studentRegion[r].name
										+ " ";
							}
							td2.innerHTML = region;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);

							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '성적 메모';
							td2 = document.createElement('td');
							td2.innerHTML = detail.studentMatch.grade;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);

							tr = document.createElement('tr');
							td1 = document.createElement('td');
							td1.innerHTML = '선생님게 하고싶은 말';
							td2 = document.createElement('td');
							td2.innerHTML = detail.studentMatch.memo;

							tr.appendChild(td1);
							tr.appendChild(td2);
							table.appendChild(tr);

							var testResultTable = document
									.createElement('table');

							for ( var t in detail.studentMatch.test) {

								tr = document.createElement('tr');

								var nTd1 = document.createElement('td')
								nTd1.setAttribute('colspan', 2);
								nTd1.innerHTML = (t + 1) + "번 문제";

								tr.appendChild(nTd1);
								testResultTable.appendChild(tr);

								tr = document.createElement('tr');
								var nTd2 = document.createElement('td');
								nTd2.innerHTML = '문제';
								var nTd3 = document.createElement('td');
								nTd3.innerHTML = detail.studentMatch.test[t].studentTestPaper.question;

								tr.appendChild(nTd2);
								tr.appendChild(nTd3);
								testResultTable.appendChild(tr);

								tr = document.createElement('tr');
								nTd2 = document.createElement('td');
								nTd2.innerHTML = '문제의 답';
								nTd3 = document.createElement('td');
								nTd3.innerHTML = detail.studentMatch.test[t].studentTestPaper.answer;

								tr.appendChild(nTd2);
								tr.appendChild(nTd3);
								testResultTable.appendChild(tr);

								tr = document.createElement('tr');
								nTd2 = document.createElement('td');
								nTd2.innerHTML = '제출된 답';
								nTd3 = document.createElement('td');
								nTd3.innerHTML = detail.studentMatch.test[t].studentAnswer;

								tr.appendChild(nTd2);
								tr.appendChild(nTd3);
								testResultTable.appendChild(tr);
							}

							modal.appendChild(testResultTable);
						}

					},
					error : function(error) {
						alert(errorThrown.statusText);
					}
				});
	}
</script>
</head>
<div id="ex1" class="modal"></div>
<body id="page-top">
	<%@ include file="../include/main_header.jsp" %>
			<div class="buttons left">
				<img class="image" src="../resources/assets/Teacher_mypage.png"/><br><br>
					<button class="btn btn-outline-warning cc_pointer" type="button"
						onclick="location.href=''">회원 정보 수정</button>
					<button class="btn btn-outline-warning cc_pointer">매치 정보 수정</button>
			</div>

			
			<div class="mypage-teacher-status left">
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
								<td>${conn.student }(${conn.subject })</td>
								<td><c:choose>
										<c:when test="${conn.step == 'CLASS' }">
											<p>수업중</p>
											<br>
											<a
												href="<c:url value='/connection/${conn.connectionId}/step?step=REVIEW&type=teacher'/>">수업
												종료</a>
										</c:when>
										<c:when test="${conn.step == 'REJECT' }">
											<p>수업 거절</p>
										</c:when>
										<c:when
											test="${conn.step == 'FINISH' || conn.step == 'REVIEW' }">
											<p>수업 종료</p>
										</c:when>
										<c:when test="${conn.step == 'MATCH' }">
											<p>
												<a href="#ex1" rel="modal:open" onclick="setConnection()"
													data-arg1="${conn.connectionId }">요청 확인</a> <br /> <a
													href="<c:url value='/connection/${conn.connectionId}/step?step=REJECT&type=teacher'/>">거절</a>
												&nbsp;&nbsp; <a
													href="<c:url value='/connection/${conn.connectionId}/step?step=CLASS&type=teacher'/>">최종
													수락</a>
											</p>
										</c:when>
										<c:otherwise>
											<!-- step == 'REQUEST' -->
											<p>
												<a href="#ex1" rel="modal:open" onclick="setConnection()"
													data-arg1="${conn.connectionId }">수업 요청</a><br /> <a
													href="<c:url value='/connection/${conn.connectionId}/step?step=REJECT&type=teacher'/>">거절</a>
												&nbsp;&nbsp; <a
													href="<c:url value='/connection/${conn.connectionId}/step?step=MATCH&type=teacher'/>">수락</a>
											</p>
										</c:otherwise>
									</c:choose></td>
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
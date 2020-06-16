<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>자동 매칭</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.teacherClassCard {
	background-color: #fffab5;
	margin: 10px;
	text-align: center;
	float: left;
}
</style>
<script type="text/javascript">
	function setTeacher(e) {
		const classId = event.target.getAttribute('data-arg1');
		console.log(classId);
		const url = "http://localhost:8080/swithMe/class/" + classId
				+ "/detail";

		var modal = document.getElementById("ex1");
		$('#ex1').empty();

		$.ajax({
			url : url,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(detail) {
				console.log(detail);
				var name = document.createElement("h2");
				var gender = detail.teacherInfo.teacherGender == "WOMEN" ? "여자"
						: "남자";
				name.innerHTML = detail.teacher.name + " "
						+ detail.teacherInfo.entranceYear + " " + gender;
				modal.appendChild(name);

				var table = document.createElement("table");

				var tr1 = document.createElement("tr");
				var td1_1 = document.createElement("td");
				td1_1.innerHTML = "학력";
				var td1_2 = document.createElement("td");
				td1_2.innerHTML = detail.teacherInfo.university.name
						+ detail.teacherInfo.major.name;

				tr1.appendChild(td1_1);
				tr1.appendChild(td1_2);
				table.appendChild(tr1);

				var tr2 = document.createElement("tr");
				var td2_1 = document.createElement("td");
				td2_1.innerHTML = "과목정보 (난이도)";
				var td2_2 = document.createElement("td");
				var ability = detail.ability == 1 ? "하"
						: detail.ability == 2 ? "중" : "상";
				td2_2.innerHTML = detail.subject.name + " (" + ability + ")";

				tr2.appendChild(td2_1);
				tr2.appendChild(td2_2);
				table.appendChild(tr2);

				var tr3 = document.createElement("tr");
				var td3_1 = document.createElement("td");
				td3_1.innerHTML = "수업 희망 학생 성별";
				var td3_2 = document.createElement("td");
				td3_2.innerHTML = detail.studentGender == 'ANY' ? "상관없음"
						: detail.studentGender == 'WOMEN' ? "여자 학생" : "남자 학생";

				tr3.appendChild(td3_1);
				tr3.appendChild(td3_2);
				table.appendChild(tr3);

				var tr4 = document.createElement("tr");
				var td4_1 = document.createElement("td");
				td4_1.innerHTML = "수업 가능한 시간";
				var td4_2 = document.createElement("td");
				var time = "";
				for ( var t in detail.teacherTimes) {
					time += detail.teacherTimes[t].time == 'am' ? "오전 "
							: detail.teacherTimes[t].time == 'pm' ? "오후 "
									: "저녁 "
				}
				td4_2.innerHTML = time;

				tr4.appendChild(td4_1);
				tr4.appendChild(td4_2);
				table.appendChild(tr4);

				var tr5 = document.createElement("tr");
				var td5_1 = document.createElement("td");
				td5_1.innerHTML = "수업 가능한 지역";
				var td5_2 = document.createElement("td");
				var region = "";

				for ( var r in detail.teacherRegion) {
					region += detail.teacherRegion[r].name + " ";
				}
				td5_2.innerHTML = region;

				tr5.appendChild(td5_1);
				tr5.appendChild(td5_2);
				table.appendChild(tr5);

				modal.appendChild(table);

				table = document.createElement("table");

				tr1 = document.createElement("tr");
				td1_1 = document.createElement("td");
				td1_1.innerHTML = "자기소개서";
				td1_2 = document.createElement("td");
				td1_2.innerHTML = detail.teacherMatch.profileIntro;

				tr1.appendChild(td1_1);
				tr1.appendChild(td1_2);
				table.appendChild(tr1);

				tr2 = document.createElement("tr");
				td2_1 = document.createElement("td");
				td2_1.innerHTML = "수업 경력";
				td2_2 = document.createElement("td");
				td2_2.innerHTML = detail.teacherMatch.profileCareer;

				tr2.appendChild(td2_1);
				tr2.appendChild(td2_2);
				table.appendChild(tr2);

				var tr3 = document.createElement("tr");
				var td3_1 = document.createElement("td");
				td3_1.innerHTML = "수업 스타일";
				var td3_2 = document.createElement("td");
				td3_2.innerHTML = detail.teacherMatch.profileStyle;

				tr3.appendChild(td3_1);
				tr3.appendChild(td3_2);
				table.appendChild(tr3);

				modal.appendChild(table);

			},
			error : function(errorThrown) {
				alert(errorThrown.statusText);
			}
		})
	}
</script>
</head>
<body>
	<spring:hasBindErrors name="studentMatchForm" />
	<form:form modelAttribute="studentMatchForm" method="post"
		action="/swithMe/student/match/fin">
		<div id="ex1" class="modal"></div>

		<input type="submit" value="선생님 선택">
		<br>
		<br>

		<form:errors path="teacherId" />

		<c:forEach items="${classCardList }" var="cc" varStatus="i">
			<div class="teacherClassCard">
				<form:radiobutton path="teacherId" value="${cc.teacher.id }" />
				<h1>${ cc.teacher.name}(${ cc.teacherInfo.entranceYear})</h1>
				<h3>${cc.teacherInfo.university.name }/
					${cc.teacherInfo.major.name }</h3>

				<a href="#ex1" rel="modal:open" onclick="setTeacher()"
					data-arg1="${cc.classId }">정보 보기</a>
			</div>
		</c:forEach>

		<c:if test="${classCardList == null }">
			<p>해당 조건을 가진 선생님이 없습니다.</p>
		</c:if>
	</form:form>
</body>
</html>
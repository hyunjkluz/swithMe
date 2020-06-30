<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Student Match STEP1</title>
<link rel="stylesheet" href="../../resources/css/theme.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function insertRegion() {
		var regionDiv = document.getElementById('regionDiv');
		var selectedSido = document.getElementById('sido');
		var selectedSidoTxt = selectedSido.options[selectedSido.selectedIndex].text;

		var selectedGu = document.getElementById('gu');
		var selectedGuTxt = selectedGu.options[selectedGu.selectedIndex].text;

		var selectedDong = document.getElementById('dong');
		var selectedDongTxt = selectedDong.options[selectedDong.selectedIndex].text;
		var selectedDongVal = selectedDong.options[selectedDong.selectedIndex].value;

		// id 배열 스트링으로 만들기
		var txtVal = document.getElementById("dongIds").value;
		if (txtVal == "") {
			document.getElementById("dongIds").value = selectedDongVal;
		} else {
			document.getElementById("dongIds").value = txtVal + ","
					+ selectedDongVal;
		}

		// 선택된 지역 표시 블록 생성
		var newRegion = document.createElement('p');
		var regionText = document.createTextNode(selectedSidoTxt + " "
				+ selectedGuTxt + " " + selectedDongTxt);

		newRegion.appendChild(regionText);
		regionDiv.appendChild(newRegion);
		console.log("추가");
	}

	function selectDong(e) {
		const url = "http://localhost:8080/swithMe/gu/" + e.value;
		console.log(url);
		var target = document.getElementById("dong");
		target.options.length = 0;

		$.ajax({
			url : url,
			type : "GET",
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				for (x in data) {
					var opt = document.createElement("option");
					opt.value = data[x].id;
					opt.innerHTML = data[x].name;
					target.appendChild(opt);
				}
			},
			error : function(errorThrown) {
				alert(errorThrown.statusText);
			}
		})
	}
</script>
</head>
<style>
.form {
	text-align: center;
	padding-top: 120px;
}

.input {
	margin: auto;
	padding-top: 30px;
	padding-down: 30px;
	width: 800px;
	border: 3px solid #FFF9B1;
	width: 800px;
}
</style>
<body>
	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<div class="stepimage">
			<img src="../../resources/assets/Student_Step_1.png" />
		</div>
		<spring:hasBindErrors name="studentMatchForm" />
		<form:form modelAttribute="studentMatchForm" method="post"
			action="/swithMe/student/match/step1">
			<div class="input">
				<h5 class="text-muted">Q1. 수업을 원하는 과목을 선택해주세요.</h5>

				<div class="select btn btn-primary">
					<form:errors class="dropdown-item" path="subjectId" />
					<form:select class="dropdown-item" path="subjectId"
						multiple="false">
						<form:options items="${subjects}" itemValue="id" itemLabel="name" />
					</form:select>
				</div>
				<br><br>
				<h5 class="text-muted">Q2. 원하는 수업의 난이도를 선택해주세요.</h5>
				<form:errors path="level" />
				<form:radiobuttons items="${levels}" itemValue="intVal"
					itemLabel="name" path="level" />

				<br><br>
				<h5 class="text-muted">Q3. 선호하는 선생님 성별을 선택해주세요.</h5>
				<form:errors path="gender" />
				<form:radiobuttons items="${genders}" itemValue="stringVal"
					itemLabel="name" path="gender" />

				<br><br>
				<h5 class="text-muted">Q4. 수업 가능한 시간을 선택해주세요.</h5>
				<form:errors path="time" />
				<form:radiobuttons items="${times}" itemValue="stringVal"
					itemLabel="name" path="time" /> <br><br>
				
				<h5 class="text-muted">Q5. 수업 가능한 지역을 입력해주세요.</h5>
				<br>
				<div class="select btn btn-primary">
					<form:errors path="dongIds" />
					<select class="dropdown-item" id="sido" name="sido">
						<c:forEach items="${sidos}" var="sido">
							<option value="${sido}">${sido.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="select btn btn-primary">
					<select class="dropdown-item" id="gu" name="gu"
						onchange="selectDong(this)">
						<c:forEach items="${gus}" var="gu">
							<option value="${gu.id}">${gu.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="select btn btn-primary">
					<select class="dropdown-item" id="dong" name="dong">
						<c:forEach items="${dongs}" var="dong">
							<option value="${dong.id}">${dong.name}</option>
						</c:forEach>
					</select>
				</div>
				
				<form:input type="hidden" id="dongIds" path="dongIds" />
				<input type="button" class="btn btn-outline-warning cc_pointer" value="추가" onclick="insertRegion();">
				<div class="text-center" id="regionDiv">
					<h6>선택된 지역</h6>
				</div>
				<br><br>
				<button class="btn btn-outline-warning cc_pointer">다음</button> 
				<br> <br>
			</div>
		</form:form>
	</div>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP3</title>
<link rel="stylesheet" href="../../resources/css/theme.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function insertRegion() {
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
		document.body.appendChild(newRegion);
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

.stepimage {
	padding-bottom: 10px;
}

.input {
	text-align: center;
	margin: auto;
	padding-top: 10px;
	width: 800px;
	border: 3px solid #FFF9B1;
}

.back_btn {
	margin: auto;
}
</style>
<body>

	<div>
		<%@ include file="../include/step_header.jsp"%>
	</div>
	<div class="form">
		<img src="../../resources/assets/Teacher_Step_3.png" />
		<h4>꼭 맞는 매칭을 위해 정확한 정보를 입력해주세요 !</h4>
		<br>
		<div class="input">
			<br>
			<form:form modelAttribute="tmInfo" method="post"
				action="/swithMe/teacher/match/step4">

				<h5 class="text-muted">Q4. 수업 가능한 지역을 입력해주세요.</h5>
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

				<br>

				<form:input type="text" id="dongIds" path="dongIds" />

				<input class="btn btn-secondary my-2 my-sm-00 cc_pointer"
					type="button" value="추가" onclick="insertRegion();">

				<div></div>
				<br>
				<h5 class="text-muted">Q5. 수업 가능한 시간을 선택해주세요.</h5>
				<br>
				<form:errors path="time" />
				<form:radiobuttons items="${times}" itemValue="stringVal"
					itemLabel="name" path="time" />
				<br>
				<br>
				<button class="btn btn-outline-warning cc_pointer" type="button"
					onclick="location.href='/swithMe/teacher/match/step2'">이전
					단계로</button>
				<button class="btn btn-outline-warning cc_pointer">다음</button>
				<br>
				<br>

			</form:form>
		</div>
	</div>
</body>
</html>
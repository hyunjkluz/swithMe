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
<body>
	<spring:hasBindErrors name="studentMatchForm" />
	<form:form modelAttribute="studentMatchForm" method="post"
		action="/swithMe/student/match/step1">
		<p>과목</p>
		<form:errors path="subjectId" />
		<form:select path="subjectId" multiple="false">
			<form:options items="${subjects }" itemValue="id" itemLabel="name" />
		</form:select>
		<br>

		<p>난이도</p>
		<form:errors path="level" />
		<form:radiobuttons items="${levels}" itemValue="intVal"
			itemLabel="name" path="level" />

		<p>선호하는 선생님 성별 선택</p>
		<form:errors path="gender" />
		<form:radiobuttons items="${genders}" itemValue="stringVal"
			itemLabel="name" path="gender" />

		<p>수업 가능한 시간 선택</p>
		<form:errors path="time" />
		<form:radiobuttons items="${times}" itemValue="stringVal"
			itemLabel="name" path="time" />

		<p>수업 가능한 지역</p>
		<form:errors path="dongIds" />
		<select id="sido" name="sido">
			<c:forEach items="${sidos}" var="sido">
				<option value="${sido}">${sido.name}</option>
			</c:forEach>
		</select>

		<select id="gu" name="gu" onchange="selectDong(this)">
			<c:forEach items="${gus}" var="gu">
				<option value="${gu.id}">${gu.name}</option>
			</c:forEach>
		</select>

		<select id="dong" name="dong">
			<c:forEach items="${dongs}" var="dong">
				<option value="${dong.id}">${dong.name}</option>
			</c:forEach>
		</select>

		<form:input type="text" id="dongIds" path="dongIds" />

		<input type="button" value="추가" onclick="insertRegion();">

		<div></div>

		<input type="submit" value="다음">
	</form:form>
</body>
</html>
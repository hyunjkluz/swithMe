<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>자동 매칭</title>
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
		<input type="radio" name="level" value="1">하
		<input type="radio" name="level" value="2">중
		<input type="radio" name="level" value="3">상
	
		<p>선호하는 선생님 성별 선택</p>
		<form:errors path="gender" />
		<input type="radio" name="gender" value="any">성별 무관
		<input type="radio" name="gender" value="women">여자
		<input type="radio" name="gender" value="man">남자
	
		<p>수업 가능한 시간 선택</p>
		<form:errors path="time" />
		<input type="radio" name="time" value="am">오전
		<input type="radio" name="time" value="pm">오후
		<input type="radio" name="time" value="eve">저녁
	
		<p>수업 가능한 지역</p>
		<form:errors path="dongIds" />
		<select id="sido" name="sido">
			<c:forEach items="${sidos}" var="sido">
				<option value="${sido}">${sido.name}</option>
			</c:forEach>
		</select>

		<select id="gu" name="gu">
			<c:forEach items="${gus}" var="gu">
				<option value="${gu}">${gu.name}</option>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP4</title>
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

	<h2>선생님 매칭 정보 작성 - 정보 선택</h2>
	<form:form modelAttribute="tmInfo" method="post" action="/swithMe/teacher/match/step4">

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

		<input type="button" value="추가" onclick="insertRegion();">

		<div></div>

		<table id="timetable">
			<thead>
				<tr>
					<td></td>
					<td>월요일</td>
					<td>화요일</td>
					<td>수요일</td>
					<td>목요일</td>
					<td>금요일</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>09:00~12:00</td>
					<td><input type="checkbox" name="time1" value="mon"></td>
					<td><input type="checkbox" name="time1" value="tue"></td>
					<td><input type="checkbox" name="time1" value="wed"></td>
					<td><input type="checkbox" name="time1" value="thu"></td>
					<td><input type="checkbox" name="time1" value="fri"></td>
				</tr>
				<tr>
					<td>12:00~15:00</td>
					<td><input type="checkbox" name="time2" value="mon"></td>
					<td><input type="checkbox" name="time2" value="tue"></td>
					<td><input type="checkbox" name="time2" value="wed"></td>
					<td><input type="checkbox" name="time2" value="thu"></td>
					<td><input type="checkbox" name="time2" value="fri"></td>
				</tr>
				<tr>
					<td>15:00~18:00</td>
					<td><input type="checkbox" name="time3" value="mon"></td>
					<td><input type="checkbox" name="time3" value="tue"></td>
					<td><input type="checkbox" name="time3" value="wed"></td>
					<td><input type="checkbox" name="time3" value="thu"></td>
					<td><input type="checkbox" name="time3" value="fri"></td>
				</tr>
				<tr>
					<td>18:00~21:00</td>
					<td><input type="checkbox" name="time4" value="mon"></td>
					<td><input type="checkbox" name="time4" value="tue"></td>
					<td><input type="checkbox" name="time4" value="wed"></td>
					<td><input type="checkbox" name="time4" value="thu"></td>
					<td><input type="checkbox" name="time4" value="fri"></td>
				</tr>
				<tr>
					<td>21:00~24:00</td>
					<td><input type="checkbox" name="time5" value="mon"></td>
					<td><input type="checkbox" name="time5" value="tue"></td>
					<td><input type="checkbox" name="time5" value="wed"></td>
					<td><input type="checkbox" name="time5" value="thu"></td>
					<td><input type="checkbox" name="time5" value="fri"></td>
				</tr>
			</tbody>
		</table>

		<a href="<c:url value='/swithMe/teacher/match/step2'/>">이전 단계로</a> 
		<input type="submit" value="다음" />

	</form:form>
</body>
</html>
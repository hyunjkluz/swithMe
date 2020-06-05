<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Join STEP4</title>
<script>
		function insertRegion() {
			var newRegion = document.createElement('p');
			var regionText = document.createTextNode('경기도 고양시 일산동구');
	
			newRegion.appendChild(regionText);
			document.body.appendChild(newRegion);
			console.log("추가");
		}
	</script>
</head>
<body>

	<h2>선생님 매칭 정보 작성 - 정보 선택</h2>
	<form method="post" action="/swithMe/teacher/match/step4">

		<p>수업 가능한 지역</p>
		<select name="si">
			<option value="seoul">서울시</option>
			<option value="gyeonggiDo">경기도</option>
		</select> <select name="dong">
			<option value="seoul">서울시</option>
			<option value="gyeonggiDo">경기도</option>
		</select> <input type="button" value="추가" onclick="insertRegion();">
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

	</form>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>자동 매칭</title>
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
<form method="post" action="/swithMe/student/match/step1">
	<p>과목</p>
	<input type="radio" name="subject" value="korean">국어
	<input type="radio" name="subject" value="math">수학
	<input type="radio" name="subject" value="english">영어
	
	<br>
	
	<p>난이도</p>
	<input type="radio" name="level" value="1">하
	<input type="radio" name="level" value="2">중
	<input type="radio" name="level" value="3">상
	
	<p>선호하는 선생님 성별 선택</p>
	<input type="radio" name="gender" value="any">성별 무관
	<input type="radio" name="gender" value="women">여자
	<input type="radio" name="gender" value="man">남자
	
	<p>수업 가능한 시간 선택</p>
	<input type="radio" name="time" value="dhwjs">오전
	<input type="radio" name="time" value="dhgn">오후
	<input type="radio" name="time" value="wjsur">저녁
	
	<p>수업 가능한 지역</p>
	<select name="si">
    	<option value="seoul">서울시</option>
    	<option value="gyeonggiDo">경기도</option>
	</select>
	
	<select name="dong">
    	<option value="seoul">서울시</option>
    	<option value="gyeonggiDo">경기도</option>
	</select>
	
	<input type="button" value="추가" onclick="insertRegion();">
	<div>
	</div>
	
	<input type="submit" value="다음">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
<style>
.cardProfile {
	background-color: #949494;
	margin:10px 10px 10px 10px; 
	padding:10px 10px 10px 10px;
	width:200px;
	float: left;
}
</style>
</head>
<body>
	<div>
		<label><input type="checkbox" name="subjects" value="kor"> 국어</label>
		<label><input type="checkbox" name="subjects" value="eng"> 영어</label>
		<label><input type="checkbox" name="subjects" value="math"> 수학</label>
		<a href="<c:url value='main/class'/>">검색</a>
	</div>
	
	<div>
		<div class="cardProfile">
			<p> 사진</p>
			<p>김현진 (21/여)</p>
			<p>동덕여자대학교 컴퓨터학과</p>
			<a href="<c:url value='/class/1'/>">프로필 보기</a>
		</div>
		
		<div class="cardProfile">
			<p> 사진</p>
			<p>김현진 (21/여)</p>
			<p>동덕여자대학교 컴퓨터학과</p>
			<a href="<c:url value='/class/1'/>">프로필 보기</a>
		</div>
	</div>

</body>
</html>
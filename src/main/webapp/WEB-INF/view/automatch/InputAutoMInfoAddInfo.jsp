<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>자동 매칭</title>
</head>
<body>
<form method="post" action="/swithMe/student/match/step4">
	<h2>추가 정보 정보 입력</h2>

	<p>성적 입력</p>	
	<textarea name="memo1" cols="40" rows="10" autofocus required wrap="hard" placeholder="해당 과목의 모의고사, 중간고사, 기말고사 등의 성적을 입력해주세요."></textarea>
	
	<p>선생님에게 하고싶은 말</p>
	<textarea name="memo2" cols="40" rows="10" autofocus required wrap="hard" placeholder="선택한 선생님께 전달하고싶은 말을 작성해주세요."></textarea>
	
	<a href="<c:url value='/student/match/step3'/>">이전 단계로</a>
	<input type="submit" value="매칭결과 보기">
</form>
</body>
</html>
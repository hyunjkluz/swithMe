<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPageStudentClass</title>
</head>
<body>

<p>선생님 이름 &nbsp;</p> <p>연락처</p> <br>
<p>과목</p>

<a href="<c:url value='/mypage/student'/>">뒤로 가기</a>

</body>
</html>
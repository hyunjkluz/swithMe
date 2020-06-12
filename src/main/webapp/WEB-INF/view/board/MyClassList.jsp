<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 수업</title>
</head>
<body>
<div>
	head
</div>
<div>
	<h1>개설된 수업</h1>
		<c:choose>
				<c:when test="${empty connectionList }" >
					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty connectionList}">
				<c:forEach var="connection" items="${connectionList}" varStatus="status">
					  <a href="<c:url value='/connection/' />${connection.connectionId}/board/main">${connection.connectionId}</a>
				</c:forEach>
			  </c:when>
		</c:choose>
</div>
</body>
</html>
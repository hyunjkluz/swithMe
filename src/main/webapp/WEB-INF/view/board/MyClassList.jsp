<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 수업</title>
</head>
<body>
<div class="container">
<%@ include file="../include/main_header.jsp" %>
</div>
<section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading">개설된 수업</h2>
                </div>
                
                <div class="row text-center">
	                <c:choose>
							<c:when test="${empty connectionList }" >
								<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
							</c:when> 
							<c:when test="${!empty connectionList}">
							<c:forEach var="connection" items="${connectionList}" varStatus="status">
								  <div class="col-md-4">
								  <c:if test="${userSession.type == 'student' }">
								  <h4>${connection.teacher}</h4>
								  </c:if>
								  <c:if test="${userSession.type == 'teacher' }">
								  <h4>${connection.student}</h4>
								  </c:if>
                            	  <p class="text-muted">${connection.subject}</p>
								  <a href="<c:url value='/connection/' />${connection.connectionId}/board/?category=NOTICE">입장하기</a>
							      </div>
							</c:forEach>
						  </c:when>
					</c:choose>                  
                </div>
            </div>
        </section>
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
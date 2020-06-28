<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 수업</title>
</head>
<link href="../resources/css/classcard.css" rel="stylesheet" />
<body>
<div class="container">
<%@ include file="../include/main_header.jsp" %>
</div>
<section class="page-section" id="services">
            <div class="container">
            <section class="page-section">
                <div class="text-center">
                    <h2 class="section-heading">개설된 수업</h2>
                </div>
                </section>
             
                <div class="row text-center">
	                <c:choose>
							<c:when test="${empty connectionList }" >
								<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
							</c:when> 
							<c:when test="${!empty connectionList}">
							<c:forEach var="connection" items="${connectionList}" varStatus="status">
								  <div class="col-lg-4 col-sm-6 mb-4">
								  <div class="card-container center">
								  	<div class="card" >
									  <c:if test="${userSession.type == 'student' }">
									  <h2>${connection.teacher}</h2>
									  </c:if>
									  <c:if test="${userSession.type == 'teacher' }">
									  <h2>${connection.student}</h2>
									  </c:if>
	                            	  <h4><p class="text-muted">${connection.subject}</p></h4>
									  <a href="<c:url value='/connection/' />${connection.connectionId}/board/?category=NOTICE">입장하기</a>
								    </div>
							      </div>
							      </div>
							</c:forEach>
						  </c:when>
					</c:choose>                  
                </div>
               
            </div>
        </section>
<%@ include file="../include/main_footer.jsp" %>

</body>
</html>
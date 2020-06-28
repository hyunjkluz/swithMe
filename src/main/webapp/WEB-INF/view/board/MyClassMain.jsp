<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>My Class</title>
</head>
<script >
	function class_change(connectionId) {
		location.href = "<c:url value='/connection/' />"+connectionId+"/board/?category=NOTICE";
	}
</script>
<body>
<div class="container">
<%@ include file="../include/main_header.jsp" %>
</div>
<div class="container">
<section id="page-section" >
	<h1>SwithMe Class Board</h1>
	<hr>
	<div class="row align-items-stretch mb-5 ">
		<div class="col-md-2">
			<h5>수업 바로가기</h5>
			<select class="form-control col-form-label" onchange="class_change(this.value);">
			<c:forEach var="connectioncard" items="${connectioncards}" >
				<option value="${connectioncard.connectionId}" ${connectioncard.connectionId == connectionId ? 'selected="selected"' : '' }>
					<c:out value="${connectioncard.subject}" />-
					<c:if test="${userSession.type == 'student' }">
						<c:out value="${connectioncard.teacher}" />
					</c:if>
					<c:if test="${userSession.type == 'teacher' }">
						<c:out value="${connectioncard.student}" />
					</c:if>
				</option>
			</c:forEach>
			</select>
		</div>
		
		<br>
		<div class="col-md-10 ">
			<div class="mb-4">
			<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board?category=NOTICE' />">공지사항</a>
			<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board?category=QA' />">질문</a>
			<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board?category=HOMEWORK' />">과제</a>
			<a class="btn btn-primary js-scroll-trigger float-right" href="<c:url value='/connection/${connectionId}/board.do' />">글작성</a>
			</div>
			<hr />
			<br>
			<div class="table-responsive">
			<table class="table table-lg">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:choose>
					<c:when test="${empty boardList }" >
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when> 
					<c:when test="${!empty boardList}">
					<c:forEach var="board" items="${boardList}" varStatus="status">
					<div id="board${board.boardId}"></div>
						  <tr>
						    <th><c:out value="${status.index+1}" /></th>
						    <th><a href="<c:url value='/connection/' />${board.connectionId}/board/${board.boardId}">${board.boardForm.title}</a></th>
						    <th>${board.writerType}</th>
						    <th><fmt:formatDate value="${board.creationDate}" pattern="yyyy-MM-dd"/></th>	    
						  </tr>
					  </c:forEach>
				  </c:when>
				</c:choose>
			</table>
			</div>
			<hr />
		</div>
	</div>
	
	</section>
</div>
<div>
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>

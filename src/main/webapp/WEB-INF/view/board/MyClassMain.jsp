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
<section id="page-section">
	<div >
		<select onchange="class_change(this.value);">
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
	<div >
		<a href="<c:url value='/connection/${connectionId}/board?category=NOTICE' />">공지사항</a>
		<a href="<c:url value='/connection/${connectionId}/board?category=QA' />">질문</a>
		<a href="<c:url value='/connection/${connectionId}/board?category=HOMEWORK' />">과제</a>
		<a href="<c:url value='/connection/${connectionId}/board.do' />">글작성</a>
		<hr />
		<br>
		<table >
			<colgroup>
				<col style="width:5%;" />	
				<col style="width:auto;" />	
				<col style="width:15%;" />
				<col style="width:10%;" />
			</colgroup>
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
		<hr />
	</div>
	</section>
</div>
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>

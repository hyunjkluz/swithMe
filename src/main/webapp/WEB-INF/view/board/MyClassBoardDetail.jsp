<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Post Detail</title>
</head>


<body>
<div class="container">
<%@ include file="../include/main_header.jsp" %>
</div>
<div class="container">
<section id="page-section">
<form:form modelAttribute="board" enctype="mutipart/form-data"  action="/swithMe/connection/${connectionId}/board/${board.boardId}">
	<input type="hidden" name="_method" value="delete" />
	<div class="board_type">${board.boardForm.type}</div>
	<div class="board_title">제목: ${board.boardForm.title}</div>
	<div class="board_content">내용: ${board.boardForm.content}</div>
	<div class="board_file">첨부파일: <c:out value="${board.boardForm.upload}"/></div>
	
	<br>
	<c:if test="${userSession.id==board.writerId && userSession.type == board.writerType}">
		<a href="<c:url value='/connection/${connectionId}/board/' />${board.boardId}/edit">수정</a>
		<input type="submit" value="삭제"/>
	</c:if>
	
	<a href="<c:url value='/connection/${connectionId}/board/?category=' />${board.boardForm.type}">목록</a>
</form:form>
<%@ include file="Reply.jsp" %>
</section>

</div>		
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>

</html>
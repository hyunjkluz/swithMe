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
<h1>Board Detail</h1>
<hr>
	<form:form modelAttribute="board" enctype="mutipart/form-data"  action="/swithMe/connection/${connectionId}/board/${board.boardId}">
		<input type="hidden" name="_method" value="delete" />
		<h3>${board.boardForm.type}</h3>
		<table class="table">
			<tr>
				<td>
					제목
				</td>
				<td>
					${board.boardForm.title}
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					${board.boardForm.content}
				</td>
			</tr>
			<tr>
				<td>
					첨부파일
				</td>
				<td>
				<c:if test="${board.boardForm.upload ne null}">
					<a href="<c:url value='/fileDownload.do?fileName='/>${board.boardForm.upload}">${board.boardForm.upload}</a>
				</c:if>
				</td>
			</tr>
		</table>
		
		<br>
		<c:if test="${userSession.id==board.writerId && userSession.type == board.writerType}">
			<a class="btn btn-primary js-scroll-trigger" href="<c:url value='/connection/${connectionId}/board/' />${board.boardId}/edit">수정</a>
			<input class="btn btn-primary js-scroll-trigger" type="submit" value="삭제"/>
		</c:if>
		
		<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board/?category=' />${board.boardForm.type}">목록</a>
	</form:form>
	<hr>
	<%@ include file="Reply.jsp" %>
</section>
</div>
<div >
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>

</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Post Detail</title>
</head>
<body>
<div>
	<div class="board_type">${board.type}</div>
	<div class="board_title">${board.title}</div>
	<div class="board_content">${board.content}</div>
<%-- 	<div class="board_file">첨부파일<c:out value="${board.file}"/></div>
	 --%>
	 
	<div style="margin-top : 20px">
		<a href="<c:url value='/board/' />${board.bId}">수정</a>
		<a href="<c:url value='/board/' />${board.bId}">삭제</a>
		<a href="<c:url value='/board/main' />">목록</a>
	</div>

	<div style="padding-top: 10px">
		<form:form name="form" modelAttribute="reply" method="post">
		<form:hidden path="bid" id="bid"/>
		<div class="row">
			<div >
				<form:textarea path="content" id="content" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
			</div>
			<div>
				<form:input path="reg_id"  id="reg_id" placeholder="댓글 작성자"></form:input>
				<button type="button" > 저장 </button>
			</div>
		</div>
		</form:form>
	</div>
	<div  style="padding-top: 10px">
		<h6 >Reply list</h6>
		<div id="replyList"></div>
	</div> 
</div>		

</body>
</html>
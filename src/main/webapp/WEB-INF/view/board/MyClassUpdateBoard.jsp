<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Upload Post</title>
</head>
<body>
<div>
<%@ include file="../include/main_header.jsp" %>
</div>
<section  id="page-section" >
	<div class="container shadow-lg ">
	<div class="pt-3 pb-3">
	<form:form class="form-group" modelAttribute="board" action="/swithMe/connection/${connectionId}/board/${board.boardId}" enctype="multipart/form-data">
		<!-- <input type="hidden" name="_method" value="PUT" /> -->
		<form:select class="form-control col-form-label" path="boardForm.type" items="${boardTypes}" />
		<br>
		<label class="mr-4" for="title">제목</label><form:errors  path="boardForm.title" />
		<form:input class="form-control" path="boardForm.title" type="text" name="title" /><br/>
		
		<label class="mr-4" for="title">내용</label><form:errors path="boardForm.title" />
		<form:textarea class="form-control" rows="6"  path="boardForm.content" name="content"/> <br/>
		
		<label for="title">첨부파일</label>
		<c:if test="${board.boardForm.upload eq null}">
			<form:input class="form-control-file"  path="boardForm.uploadFile" type="file" name="uploadFile" />
		</c:if>
		<c:if test="${board.boardForm.upload ne null}">
			<a href="<c:url value='/fileDownload.do?fileName='/>${board.boardForm.upload}">${board.boardForm.upload}</a>
			<%-- <button class="btn btn-primary js-scroll-trigger"  onclick="deleteAttachFile('${board.boardForm.upload}', '${board.boardForm.}')">삭제</button>
		 --%>
		 </c:if>
		<br>
		<button class="btn btn-primary js-scroll-trigger"  type="submit" >수정</button>
		<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board/?category=' />${board.boardForm.type}">취소</a>
	</form:form>
	</div>
	</div>
</section>
<div >
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
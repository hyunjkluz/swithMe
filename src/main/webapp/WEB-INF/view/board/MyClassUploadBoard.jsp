<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<form:form class="form-group" modelAttribute="boardForm" action='/swithMe/connection/${connectionId}/board' enctype="multipart/form-data" >
			<form:select class="form-control col-form-label"  path="type" items="${boardTypes}" />
			<br>
			<label class="mr-4" for="title">제목</label><form:errors  path="title" />
			<form:input class="form-control" path="title" type="text" name="title" />
			<br/>
			
			<label class="mr-4" for="title">내용</label><form:errors path="content" />
			<form:textarea  class="form-control" rows="6" path="content" name="content"></form:textarea>
			<br/>
	
			<label for="title">첨부파일</label>
			<form:input class="form-control-file" path="uploadFile" type="file" name="uploadFile"/>
		
		<br>
		<button class="btn btn-primary js-scroll-trigger" type="submit" >저장</button>
		<a class="btn btn-outline-primary" href="<c:url value='/connection/${connectionId}/board/?category=NOTICE' />">취소</a>
	</form:form>
	</div></div>
</section>

<div>
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
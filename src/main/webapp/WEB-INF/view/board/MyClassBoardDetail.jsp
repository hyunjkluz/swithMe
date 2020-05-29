<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="board_type">${board.type}</div>
	<div class="board_title">${board.title}</div>
	<div class="board_content">${board.content}</div>
<%-- 	<div class="board_file">첨부파일<c:out value="${board.file}"/></div>
	 --%>
	 
	<div style="margin-top : 20px">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
		<button type="button" id="btnList">목록</button>
	</div>

	
	<!-- Reply Form {s} -->

			<div style="padding-top: 10px">
				<form:form name="form" id="form" role="form" modelAttribute="reply" method="post">
				<form:hidden path="bid" id="bid"/>
				<div class="row">
					<div >
						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
					</div>
					<div>
						<form:input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></form:input>
						<button type="button" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->
			<!-- Reply List {s}-->
			<div  style="padding-top: 10px">
				<h6 >Reply list</h6>
				<div id="replyList"></div>
			</div> 
			<!-- Reply List {e}-->
		</div>		

</body>
</html>
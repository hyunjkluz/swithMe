<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Post Detail</title>
</head>
<script>
	$(document).ready(function(){
		showReplyList();	
	});

	$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#content').val();
		var replyReg_id = $('#writerId').val();
		var paramData = JSON.stringify({"content": replyContent
				, "writerId": replyReg_id
				, "bid":'${board.boardId}'
		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/reply";
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				$('#content').val('');
				$('#writerId').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});

	
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/reply";
		var paramData = {"bid" : "${board.boardId}"};
		$.ajax({
            type: 'GET',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
            	var htmls = "";
            	if(result.length < 1){
            	htmls = "등록된 댓글이 없습니다.";
            	} else {
            	$(result).each(function(){
            	htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
            	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
            	htmls += '<title>Placeholder</title>';
            	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
            	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
            	htmls += '</svg>';
            	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
            	htmls += '<span class="d-block">';
            	htmls += '<strong class="text-gray-dark">' + this.reg_id + '</strong>';
            	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
            	htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
            	htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';
            	htmls += '</span>';
            	htmls += '</span>';
            	htmls += this.content;
            	htmls += '</p>';
            	htmls += '</div>';
            	});	//each end
            	}
            	$("#replyList").html(htmls);
            	} // Ajax success end
		});	// Ajax end
	}

</script>

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
	<c:if test="${userSession.id==board.writerId}">
		<a href="<c:url value='/connection/${connectionId}/board/' />${board.boardId}/edit">수정</a>
		<input type="submit" value="삭제"/>
	</c:if>
	
	<a href="<c:url value='/connection/${connectionId}/board/main' />">목록</a>
</form:form>


	<div style="padding-top: 10px">
		<form:form name="form" modelAttribute="reply" method="post">
		<form:hidden path="boardId" id="boardId"/>
		<div class="row">
			<div >
				<form:textarea path="content" id="content" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
			</div>
			<div>
				<form:input path="writerId"  id="writerId" placeholder="댓글 작성자"></form:input>
				<button id="btnReplySave" type="button"> 저장 </button>
			</div>
		</div>
		</form:form>
	</div>
	<div  style="padding-top: 10px">
		<h6 >Reply list</h6>
		<div id="replyList"></div>
	</div> 
</section>
</div>		
<div class="container">
<%@ include file="../include/main_footer.jsp" %>
</div >
</body>
</html>
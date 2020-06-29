<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<script type="text/javascript">
/*
 * 댓글 등록하기(Ajax)
 */
$(function(){
    $("#btnReply").click(function(){
	    var ct = $("#r_content").val(); 
	
	    if(ct.length == 0){
	        alert("내용을 입력하세요");
	        return;
	    }
	    $.ajax({
	        type: "POST", 
	        url: "<c:url value='/board/${board.boardId}/reply'/>", 
	        contentType: "application/json",
	        data: ct, 
	        
	        success: function(data){
	            	$('#r_content').val('');
	            	getreplyList();
	            },
            error:function(request,status,error){
            	console.log("message:"+request.responseText);
           }
	    });
    }); 
});
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    getreplyList();
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getreplyList(){
	/*$('#replyList').load("<c:url value='/board/${board.boardId}/reply'/>");*/
	var userType = document.getElementById("userType").value;
       $.ajax({
        type:"GET",
        url : "<c:url value='/board/${board.boardId}/reply'/>", 
        dataType: "json",
        success : function(data){        
            var html = "";
            if(data.length > 0){
            	$(data).each(function(){
                	html += "<div class='media-body pb-3 mb-0 pr-3 small lh-125 border-bottom horder-gray' id='replyContent"+this.replyId+"'>";	
               		html += "<span class='d-block'><strong class='text-uppercase'>"+this.writerType+"</strong>";
               		if (userType == this.writerType) {
						html += "<a class='ml-3 mr-2' href='javascript:void(0)' onclick='fn_editReply("+this.replyId+",\""+this.writerType+"\",\""+this.content+"\")'>수정</a>";
                   		html += "<a href='javascript:void(0)' onclick='fn_deleteReply("+this.replyId+")'>삭제</a>";
               		}
                    html += "</span> <br><div>"+this.content+"</div></div><br>"; 
                });                
            } else {               
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";                
            }
            $("#replyList").html(html);
            
        },
        error:function(request,status,error){
        	console.log("message:"+request.responseText);
       }
        
    });  
}

function fn_editReply(replyId, writerType, content){
    var html ="";
	
    html += "<div id='replyContent"+replyId+"'><strong class='text-uppercase'>"+writerType+"</strong>";
    html += "<a class='ml-3 mr-2' href='javascript:void(0)' onclick='fn_updateReply("+replyId+")'>저장</a>"
    html += "<a href='javascript:void(0)' onclick='getreplyList()'>취소</a> <br>";
    html += "<textarea class='form-control' id='editContent' >"+content+"</textarea></div>"; 
    
    $("#replyContent"+replyId).html(html);
    
}

function fn_updateReply(replyId){
	var editContent = $('#editContent').val();
	$.ajax({
		url: "<c:url value='/board/${board.boardId}/reply/"+replyId+"'/>"
		, type : 'PUT'
		, data : editContent
		, headers: {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			}
		, dataType : 'text'
		, success: function(result){
			getreplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}


function fn_deleteReply(replyId){
 	$.ajax({
		url: "<c:url value='/board/${board.boardId}/reply/"+replyId+"'/>"
		, type : 'DELETE'
		, headers: {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			}
		, dataType : 'text'
		, success: function(result){
        	getreplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}


</script>

</head>
<body>
<div class="container">
    <form:form modelAttribute="reply" id="form" name="reply" method="post">
    <input type="hidden" id="userType" value="${userSession.type}" />
    <br><br>
        <div>
            <div>
                <h3><strong>Comments</strong></h3>
            </div>
            <div >
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea class="form-control" id="r_content" name="content" placeholder="댓글을 입력하세요"></textarea>
                        </td>
                        <td>
                        	<button class="btn btn-primary js-scroll-trigger" type = "button" id = "btnReply">댓글쓰기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>     
    </form:form>
</div>
<hr>
<div class="container ml-5">
      <div id="replyList">
      </div>
</div>
</body>
</html>

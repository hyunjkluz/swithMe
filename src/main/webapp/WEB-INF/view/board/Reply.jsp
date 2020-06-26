<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value='/resources/css/styles.css' />" rel="stylesheet" />
</head>
<body>
<div class="container">
    <form id="form" name="reply" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1000px" rows="3" cols="30" id="r_content"name="content" placeholder="댓글을 입력하세요"></textarea>
                            <button type = "button" id = "btnReply">댓글쓰기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>     
    </form>
</div>
<div class="container">
    <form id="replyListForm" name="replyListForm" method="post">
        <div id="replyList">
        
        </div>
    </form>
</div>
 
<script>
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
        type: "post", 
        url: "<c:url value='/board/${board.boardId}/reply'/>", 
        contentType: "application/json",
        data: ct, 
        success: function(data){
            	alert("댓글이 등록되었습니다.");
            	$('#r_content').val('');
            	getreplyList();
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
    $.ajax({
        type:'get',
        url : "<c:url value='/board/${board.boardId}/reply'/>", 
        contentType: "application/json",
        success : function(data){      
            console.log(data);     
            var html = "";
            if(data.length > 0){                
            	$(data).each(function(){
                    html += "<div><strong>"+this.writerType+"</strong>";
                    html += "<a href='javascript:void(0)' onclick='fn_editReply(" + this.replyId + ", \'" + this.content + ")' >수정</a>";
                    html += "<a href='javascript:void(0)' onclick='fn_deleteReply(" + this.replyId + ")' >삭제</a> <br>";
                    html += this.content + "</div><br>";
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
            
       }
        
    });
}

function fn_deleteReply(replyId){
	alert(replyId);
	document.form.action="<c:url value='/board/${board.boardId}/reply/"+replyId+"'/>";
	document.form.submit();
/* 	$.ajax({
		url: "<c:url value='/board/${board.boardId}/reply/rid'/>";
		, type : 'DELETE'
		, success: function(result){
			showReplyList();
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	}); */
}


</script>
 
</body>
</html>

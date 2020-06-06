<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

<title>My Class</title>
</head>
<style>
.main .menu{
	float: left; width: 200px;
}
.main .board{
	float: left;
}
li {list-style: none; float: left; padding: 6px;}
</style>
<body>
<div class="main" >
	<div class="menu" >
		<section>
		<select>
		<c:forEach var="connectioncard" items="${connectioncards}" >
			<option><c:out value="${connectioncard.subject}" />-<c:out value="${connectioncard.teacher.name}" /></option>
		</c:forEach>
		</select>
		</section>
	</div>
	<div class="board" >
		<section id="container">
		<button type="button" onclick="">공지사항</button>
		<button type="button" onclick="">질문</button>
		<button type="button" onclick="">과제</button>
		
		<a href="<c:url value='/board.do' />">글작성</a>
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
				<th>이름</th>
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
					    <th><a href="<c:url value='/board/' />${board.bId}">${board.title}</a></th>
					    <th>${board.writerId}</th>
					    <th><fmt:formatDate value="${board.creationDate}" pattern="yyyy-MM-dd"/></th>	    
					  </tr>
				  </c:forEach>
			  </c:when>
			</c:choose>
			  
		</table>
		<hr />
		</section>
	</div>
	
	
</div>

</body>
</html>

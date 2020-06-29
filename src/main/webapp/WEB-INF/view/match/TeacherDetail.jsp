<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
<link href="../resources/css/teacherdetailstyle.css" rel="stylesheet">
<link href="../resources/css/submitbutton.css" rel="stylesheet">
<style type="text/css">
.header {
   background-color: #ffeca6;
   color: white;
   font-size: 1.5em;
   padding: 0.5rem;
   text-align: center;
   text-transform: uppercase;
}
.table-users {
   border: 1px solid #fed136;
   border-radius: 10px;
   box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
   max-width: calc(100% - 2em);
   margin: 1em auto;
   overflow: hidden;
   width: 600px;
}

table {
   width: 100%;
}
table td, th {
	padding: 10px;
}

table td {
	color: black;
	text-align: center;
	vertical-align: middle;

	&:last-child {
		font-size: 0.95em;
		line-height: 1.4;
		text-align: left;
	}
}

table th {
	color: #fed136;
	font-weight: 300;
}

table tr:nth-child(2n) {
	background-color: white;
}

table  tr:nth-child(2n + 1) {
	background-color: #fafafa;
}

.d-flex img {
  	width: 400px;
  	height: 400px;
  }
</style>
</head>
<body  id="page-top">
	<%@ include file="../include/main_header.jsp" %>
	<section class="page-section">
	<div class="container">
	<div class="box_1620">
	<div class="banner_content">
	<div class="media">
		<div class="d-flex">
              <img src="../resources/assets/teacher.png" alt=""/>
        </div>
		<form:form modelAttribute="detail" method="post" action="/swithMe/class/${detail.classId}/request">
		<div class="media-body">
			<div class="personal_text">
				<h6>${detail.subject.name }(${detail.ability == 1 ? "하" : detail.ability == 2 ? "중" : "상"}) ${detail.teacherInfo.teacherGender == "WOMAN" ? "여자" : "남자"} 선생님</h6>
				<h3>${detail.teacher.name}</h3>
				<h4>${detail.teacherInfo.university.name } ${detail.teacherInfo.major.name } ${detail.teacherInfo.entranceYear}</h4>
			</div>
		
			<c:if test="${userSession == null || userSession.type == 'student'}">
				<button class="sbtn sbtn-4 sbtn-4a" type="submit">수업 신청하기</button>
			</c:if>
			
			<div class="table-users">
	   			<div class="header">기본 정보</div>
	   				<table class="normal" cellspacing="0">
	   					<tr>
							<th>평점</th>
							<td>${detail.teacher.rate}점</td>
						</tr>
						<tr>
							<th>수업 희망 학생 성별</th>
							<td>${detail.studentGender == 'ANY' ? "상관없음" : detail.studentGender == 'WOMEN' ? "여자 학생" : "남자 학생" }</td>
						</tr>
						<tr>
							<th>수업 가능한 시간</th>
							<td><c:forEach items="${detail.teacherTimes}" var="times"
									varStatus="t">
									${times.time == 'am' ? "오전" : times.time == 'pm' ? "오후" : "저녁" }
								</c:forEach></td>
						</tr>
						<tr>
							<th>수업 가능한 지역</th>
							<td><c:forEach items="${detail.teacherRegion }" var="dong">
									${dong.name }	
								</c:forEach></td>
						</tr>
	   				</table>
	   		</div>
   		</div>
   		
		<br>
		
		
		<div class="table-users">
	   		<div class="header">자기소개서</div>
			<table>
				<tr>
					<th>자기소개서</th>
					<td>${detail.teacherMatch.profileIntro }</td>
				</tr>
				<tr>
					<th>수업 스타일</th>
					<td>${detail.teacherMatch.profileStyle }</td>
				</tr>
			</table>
		</div>

		<br>
		<div class="table-users">
	   		<div class="header">수업 후기</div>
			<table>
				<%
					int flag = 0;
				%>
				<c:forEach items="${detail.feedback }" var="fb">
					<c:if test="${fb.id != null }">
						<%
							flag += 1;
						%>
						<tr>
							<td colspan="2">${fb.subjectName } 과목 수강 후기 (${fb.rate }점)</td>
						</tr>
						<tr>
							<td>${fb.content }</td>
							<td>${fb.rate }</td>
						</tr>
					</c:if>
				</c:forEach>
				<%
					if (flag == 0) {
				%>
				<tr>
					<td colspan="2">아직 후기가 없습니다.</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</form:form>
	</div>
	</div>
	</div>
	</div>
	</section>
	<%@ include file="../include/main_footer.jsp" %>
</body>
</html>
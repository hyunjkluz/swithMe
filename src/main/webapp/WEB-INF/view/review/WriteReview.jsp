<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>후기작성</title>
</head>
<body>
	<spring:hasBindErrors name="reviewForm" />
	<form:form modelAttribute="reviewForm" method="post"
		action="/swithMe/review/connection/${reviewForm.connectionId }">
		<table>
			<tr>
				<td colspan="2">${ reviewForm.teacherName}선생님</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>${reviewForm.subjectName }</td>
			</tr>
			<tr>
				<td>평점 <span id="rateSpan"></span>점</td>
				<td><input type="range" min="1" max="5" value="1"
					class="slider" name="rate" id="rate"></td>
			</tr>
			<tr>
				<td colspan="2">
					<form:errors path="review"/>
					<form:textarea path="review" cols="40" rows="10" wrap="hard" placeholder="평점의 이유를 적어주세요." />
				</td>
			</tr>
		</table>
		<input type="submit" value="후기 작성"/>
	</form:form>
	<script type="text/javascript">
		var slider = document.getElementById("rate");
		var output = document.getElementById("rateSpan");
		output.innerHTML = slider.value;
	
		slider.oninput = function() {
			output.innerHTML = this.value;
		}
	</script>
</body>
</html>
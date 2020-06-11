<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
<style>
.teacherClassCard {
	background-color: #949494;
	margin: 10px 10px 10px 10px;
	padding: 10px 10px 10px 10px;
	width: 200px;
	float: left;
	padding: 10px 10px 10px 10px;
	width: 200px;
	width: 200px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function search() {
		var classIds = "";
		$.each($("input[name='classId']:checked"), function() {
			classIds += $(this).val() + ",";
		});
		if (classIds == "") {
			alert("검색하고싶은 과목을 골라주세요!")
		} else {
			console.log(classIds);
		}
	}
</script>
</head>
<body>
	<div>
		<c:forEach items="${subjects }" var="s">
			<input type="checkbox" class="subjectCheckbox" name="classId"
				value="${s.id }" />${s.name }
		</c:forEach>
		<button onclick="search()">과목별 수업 검색</button>
	</div>

	<div>
		<c:forEach items="${classCardList }" var="cc" varStatus="i">
			<div class="teacherClassCard">
				<h1>${ cc.teacher.name}(${ cc.teacherInfo.entranceYear})</h1>
				<h3>${cc.teacherInfo.university.name }/
					${cc.teacherInfo.major.name }</h3>
				<a href="<c:url value='/class/${cc.classId }'/>">프로필 상세보기</a>
			</div>
		</c:forEach>
	</div>

</body>
</html>
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
			classIds += $(this).val() + " ";
		});
		if (classIds == "") {
			alert("검색하고싶은 과목을 골라주세요!")
		} else {
			console.log(classIds);
			const url = "http://localhost:8080/swithMe/class/subject"
			$
					.ajax({
						url : url,
						type : "GET",
						dataType : "json",
						data : {
							subIds : classIds,
						},
						contentType : "application/json",
						success : function(cards) {
							console.log(cards);
							var classList = document
									.getElementById("classList");
							$('#classList').empty();

							for ( var x in cards) {
								var newDiv = document.createElement("div");
								newDiv.className = "teacherClassCard";

								var p = document.createElement("p");
								p.innerHTML = cards[x].subject.name;

								var h1 = document.createElement("h1");
								h1.innerHTML = cards[x].teacher.name + "("
										+ cards[x].teacherInfo.entranceYear
										+ ")";

								var h3 = document.createElement("h3");
								h3.innerHTML = cards[x].teacherInfo.university.name
										+ " " + cards[x].teacherInfo.major.name;

								var aTag = document.createElement("a");
								aTag.href = "<c:url value='/class/" + cards[x].classId + "'/>";
								aTag.innerHTML = "프로필 상세보기";

								newDiv.appendChild(p);
								newDiv.appendChild(h1);
								newDiv.appendChild(h3);
								newDiv.appendChild(aTag);

								classList.appendChild(newDiv);
							}

						},
						error : function(errorThrown) {
							alert(errorThrown.statusText);
						}

					});
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

	<div id="classList">
		<c:forEach items="${classCardList }" var="cc" varStatus="i">
			<div class="teacherClassCard">
				<p>${cc.subject.name }</p>
				<h1>${ cc.teacher.name}(${ cc.teacherInfo.entranceYear})</h1>
				<h3>${cc.teacherInfo.university.name }/
					${cc.teacherInfo.major.name }</h3>
				<a href="<c:url value='/class/${cc.classId }'/>">프로필 상세보기</a>
			</div>
		</c:forEach>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="fontawesome-i2svg-active fontawesome-i2svg-complete">
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

.inline {
	display: inline;
}

.category-search {
	min-height: 100%;
}

</style>

<link href="../resources/css/classcard.css" rel="stylesheet" />
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
			const location = window.location.href;
			const url = location.split("swithMe")[0] + "swithMe/class/subject";
			console.log(url);
			
			$.ajax({
				url : url,
				type : "GET",
				dataType : "json",
				data : {
					subIds : classIds,
				},
				contentType : "application/json",
				success : function(cards) {
					var classList = document.getElementById("classList");
					$('#classList').empty();

					for ( var x in cards) {
						var firstDiv = document.createElement("div");
						firstDiv.className = "col-lg-4 col-sm-6 mb-4";
						
						var newDiv = document.createElement("div");
						newDiv.className = "card-container center";

						var newDiv2 = document.createElement("div");
						newDiv2.className = "card";

						var h2 = document.createElement("h2");
						h2.innerHTML = cards[x].teacher.name;

						var h4 = document.createElement("h4");
						h4.innerHTML = cards[x].subject.name

						var hr = document.createElement("hr");

						var p = document.createElement("p");
						p.innerHTML = cards[x].teacherInfo.university.name
						+ " " + cards[x].teacherInfo.major.name;

						var p2 = document.createElement("p");
						p2.innerHTML = cards[x].teacherInfo.entranceYear;

						var aTag = document.createElement("a");
						aTag.href = "<c:url value='/class/" + cards[x].classId + "'/>";
						aTag.innerHTML = "프로필 상세보기";

						newDiv2.appendChild(h2);
						newDiv2.appendChild(h4);
						newDiv2.appendChild(hr);
						newDiv2.appendChild(p);
						newDiv2.appendChild(p2);
						newDiv2.appendChild(aTag);

						newDiv.appendChild(newDiv2);
						firstDiv.appendChild(newDiv);
						classList.appendChild(firstDiv);
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
<body id="page-top">
	<%@ include file="../include/main_header.jsp" %>
			<c:if test="${userSession.type == 'teacher' && isMatchId == false }">
				<section class="page-section">
					<div class="container">
						<div class="align-items-stretch text-center">
							<h3>매칭 정보를 작성해야 수업을 작성할 수 있습니다.</h3>
							<button class="sbtn2 sbtn" onclick="location.href='<c:url value='/teacher/match/form.do'/>'">매칭정보 작성하기</button>
						</div>
					</div>
				</section>
			</c:if>
			
			<section class="page-section">
				<div class="container">
					<br>
					<h2 class="inline">과목별 수업 검색</h2> 
					<br><br>
					<div class="align-items-stretch text-center">
						<c:forEach items="${subjects }" var="s">
							<input type="checkbox" class="subjectCheckbox" name="classId" id="${s.id }" value="${s.id }" />
							<label for="${s.id }">${s.name }</label>
						</c:forEach>
					<button class="sbtn1 sbtn" onclick="search()">검색</button>
					</div>
				</div>
			</section>
		
			<section class="page-section">
				<div class="container">
					<div id="classList" class="row text-center">
						<c:forEach items="${classCardList }" var="cc" varStatus="i">
							<div class="col-lg-4 col-sm-6 mb-4">
							<div class="card-container center">
								<div class="card" >
									<h2>${ cc.teacher.name}</h2>
									<h4>${cc.subject.name }</h4>
									<hr>
									<p>${cc.teacherInfo.university.name } ${cc.teacherInfo.major.name }</p>
										<p>${ cc.teacherInfo.entranceYear}</p>
									<a href="<c:url value='/class/${cc.classId }'/>">프로필 상세보기</a>
								</div>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
	
	<%@ include file="../include/main_footer.jsp" %>
</body>
</html>
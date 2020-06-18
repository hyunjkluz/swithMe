<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>후기작성</title>
<link href="../resources/css/rangestyle.css" rel="stylesheet" />
<style type="text/css">
.slider-container {
  width: 100%;
  margin-top: 5px;
}

.label-container {
  margin-top: 0.5rem;
  -webkit-flex-basis: 100%;
  display: -webkit-flex;
  -webkit-flex-wrap: nowrap;
  -webkit-justify-content: space-between;
  margin-bottom: 50px;
}

.label-slider {
  color: #403426;
  font-size: 14px;
  font-weight: 700;
  text-align: center;
  -webkit-tap-highlight-color: transparent;
  cursor: pointer;
}

.slider {
  -webkit-appearance: none;
  -moz-appearance: none;
  width: 100%;
  height: 5px;
  border-radius: 5px;
  background: #fed136;
  outline: none;
  opacity: 0.7;
  -webkit-transition: 0.2s;
  transition: opacity 0.2s;
}

.label-slider:nth-child(1) {
  padding-left: 0px;
}

.label-slider:nth-child(2) {
  padding-left: 18px;
}

.label-slider:nth-child(3) {
  padding-left: 34px;
}

.label-slider:nth-child(4) {
  padding-left: 32px;
}

.label-slider:nth-child(5) {
  padding-left: 32px;
}

input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #403426;
  cursor: pointer;
  outline: none;
}

input[type="range"]:focus {
  outline: none;
}

</style>
</head>
<body  id="page-top">
	<%@ include file="../include/main_header.jsp" %>
	<spring:hasBindErrors name="reviewForm" />
	<br><br><br>
	
	<section class="page-section">
		<div class="container">
			<form:form modelAttribute="reviewForm" method="post"
				action="/swithMe/review/connection/${reviewForm.connectionId }">
				<div class="text-container">
					<h2 class="section-heading text-uppercase">수업 후기 작성</h2>
					<h3 class="section-subheading text-muted">여러분의 꼼꼼한 후기가 다른 학생들에게 도움이 됩니다!</h3>
				</div>
				
				<div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                        	<div class="form-group">
	                        	<input class="form-control" id="name" type="text" value="${ reviewForm.teacherName} 선생님" readonly aria-invalid="false">
                        	</div>
                        	<div class="form-group">
                        		<input class="form-control" id="name" type="text" value="${ reviewForm.subjectName} 과목 수업 후기 작성" readonly aria-invalid="false">
                        	</div>
                        	
                        	<div class="form-group mb-md-0">
                        		<br>
	                        	<h6>평점</h6>
	                        	<div class="slider-container">
									<input type="range" min="1" max="5" value="1" class="slider" name="rate" id="rate">
								</div>
								<div class="label-container">
							      <div class="label-slider">1</div>
							      <div class="label-slider">2</div>
							      <div class="label-slider">3</div>
							      <div class="label-slider">4</div>
							      <div class="label-slider">5</div>
							    </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                            	<form:errors path="review"/>
								<form:textarea path="review"  class="form-control" id="message" cols="40" rows="10" wrap="hard" placeholder="평점의 이유를 적어주세요." />
                            </div>
                        </div>
                    </div>
				<div class="text-center">
                    <div id="success"></div>
                    <button class="btn btn-primary btn-xl text-uppercase" id="sendMessageButton" type="submit">후기 작성</button>
                </div>
			</form:form>
		</div>
	</section>
	
	<section class="page-section">
		<div class="container">
		</div>
	</section>
	<%@ include file="../include/main_footer.jsp" %>
</body>
</html>
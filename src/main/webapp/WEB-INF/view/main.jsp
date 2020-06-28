<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SwithMe</title>
</head>
<body>
<div class="container">
<%@ include file="include/main_header.jsp" %>
</div>
	<header class="masthead">
            <div class="container">
                <div class="masthead-subheading">사용자 맞춤형 과외 추천 서비스, 스윗미</div>
                <div class="masthead-heading text-uppercase">Swith Me</div>
            </div>
	</header>
	
	<section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">서비스 소개</h2>
                </div>
                <div class="text-center">
                    <h4>우리 SwithMe는 ...</h4>
                    <p>간단한 본인 정보 입력만으로 여건에 맞는 맞춤 학생 / 선생님 자동 매칭</p>
					<p>과외 후기, 수업 커뮤니티 등 과외를 위한 다양한 기능</p>
					<p>기존 과외 시스템의 여러 한계점을 보완하고 편리한 과외 서비스를 제공</p>
                </div>
            </div>
        </section>
        
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">2020학년도 소프트웨어 시스템 개발 SwithMe 개발팀(5팀)을 소개합니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value='/resources/assets/team/eun.jpeg' />" alt="" />
                            <h4>강은영</h4>
                            <p class="text-muted">기획자 / 백엔드&프론트 개발자 / 디자이너</p>
                            <p>동덕여자대학교<br/>컴퓨터과학과 16학번</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value='/resources/assets/team/ryang.jpeg' />" alt="" />
                            <h4>김량현</h4>
                            <p class="text-muted">기획자 / 백엔드&프론트 개발자 / 디자이너</p>
                            <p>동덕여자대학교<br/>컴퓨터과학과 16학번</p>
                            <p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value='/resources/assets/team/hyun.jpeg' />" alt="" />
                            <h4>김현진</h4>
                            <p class="text-muted">기획자 / 백엔드&프론트 개발자 / 디자이너</p>
                            <p>동덕여자대학교<br/>컴퓨터과학과 16학번</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value='/resources/assets/team/su.jpeg' />" alt="" />
                            <h4>신수빈</h4>
                            <p class="text-muted">기획자 / 백엔드&프론트 개발자 / 디자이너</p>
                            <p>동덕여자대학교<br/>컴퓨터과학과 17학번</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<%@ include file="include/main_footer.jsp" %>
</body>
</html>
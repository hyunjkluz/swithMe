<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Header</title>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value='/resources/css/styles.css' />" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="<c:url value='/main' />"><img src="<c:url value='/resources/assets/Logo.png' />" alt="" /></a><button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu<i class="fas fa-bars ml-1"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                	<c:if test="${empty userSession}" >
	                    <ul class="navbar-nav text-uppercase ml-auto">
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/auth/loginForm.do'/>">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/auth/signUp.do'/>">회원가입</a></li>
	                    </ul>
                    </c:if>
                    <c:if test="${not empty userSession}" >
	                     <ul class="navbar-nav text-uppercase ml-auto">
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/main/class'/>">과외 찾기</a></li>
	                        <c:if test="${userSession.type == 'student' }">
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/student/match/form.do'/>">자동 매칭</a></li>
	                        </c:if>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/connection/' />${userSession.type}">나의 수업</a></li>
	                        <c:if test="${userSession.type == 'student' }">
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/mypage/student.do'/>">${userSession.name } 학생</a></li>
	                        </c:if>
	                        <c:if test="${userSession.type == 'teacher' }">
	                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/mypage/teacher.do'/>">${userSession.name } 선생님</a></li>
	                        </c:if>
	                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value='/auth/logout'/>">로그아웃</a></li>
	                    </ul>
                    </c:if>
                </div>
            </div>
        </nav>
         <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="<c:url value='/resources/js/scripts.js' />"></script>
        
        </body>
</html>

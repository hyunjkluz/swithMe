<%@ page language="java" 
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Header</title>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger"
				href="<c:url value='/main' />"><img
				src="../resources/assets/Logo.png" alt="" /></a>
			<div class="collapse navbar-collapse" id="navbar_out">
				<ul class="navbar-nav text-uppercase ml-auto">
					<!-- <li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="auth/loginForm.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="auth/signUp.do">회원가입</a></li> -->
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.min.css' />">
<style type="text/css">
.body {
	text-align: center;
}

.login-form {
	display: flex;
	justify-content: center;
	align-items: center;
	background: #FFFFFF;
}

.login-student-detail {
	display: block;
	flex: 1;
	background-color: #FFF362;
}

.login-teacher-detail {
	display: block;
	flex: 1;
	background-color: #FFF9B1;
}

.login-title-area {
	width: 400px;
	margin: auto;
	padding: 50px 0 25px 0;
}

.wrap-login-title {
	display: flex;
	justify-content: center;
	align-items: center;
}

.login-input-area {
	margin: auto;
}

.wrap-login-input-content-area {
	margin-bottom: 17px;
}

.login-input-content-area {
	width: 400px;
	margin: auto;
}

.login-btn-area {
	width: 170px;
	margin: auto;
	padding: 25px 0 50px 0;
}

.login-btn {
	width: 160px;
	padding: 5px 0 5px 0;
	border: 0;
	outline: 0;
	border-radius: 3px;
	cursor: pointer;
	background-color: #626EFF;
  	border-color: #626EFF;
}

.login-find-id-btn {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin: 0 10px 30px 0;
}

.login-find-pw-btn {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	margin: 0 0 30px 10px;
}

.login-find-atag {
	text-decoration: underline;
	color: black;
}

.wrap-login-error {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<%@ include file="../include/join_header.jsp" %>
	<div class="login-form">
	<div class="container-contact100" style="width: 70%; background-color: #FFFFFF;">
		<div class="login-student-detail">
			<form:form modelAttribute="loginForm" action="/swithMe/auth/login" method="POST">
				<input type="hidden" value="${loginForwardAction}"
					name="loginForwardAction" />
				<div class="login-title-area">
					<div class="wrap-login-title">
						<span class="login-title-text contact100-form-title">학생으로 로그인하기</span>
					</div>
				</div>
				<div class="wrap-login-error">
					<form:errors style="color: red;" />
				</div>
				<div class="login-input-area">
					<div class="wrap-login-input-content-area">
						<div class="wrap-login-error">
							<form:errors style="color: red;"  path="email" />
						</div>
						<div class="wrap-input100 login-input-content-area">
							<form:input path="email" class="input100" type="text" placeholder="아이디" />			
						</div>
					</div>
					<div class="wrap-login-input-content-area">
						<div class="wrap-login-error">
							<form:errors style="color: red;"  path="password" />
						</div>
						<div class="wrap-input100 login-input-content-area">
							<form:input path="password" class="input100" type="password" placeholder="비밀번호" />
						</div>
					</div>
				</div>
				<div class="login-btn-area">
					<button type="submit" class="login-btn btn btn-primary">로그인</button>
				</div>
				<input type="hidden" value="student" name="type">
			</form:form>
			<div class="login-find-id-btn">
				<a href="<c:url value='/auth/find/id.do' />" class="login-find-atag">아이디 찾기</a>
			</div>
		</div>
		<div class="login-teacher-detail">
			<form:form modelAttribute="loginForm" action="/swithMe/auth/login" method="POST">
				<input type="hidden" value="${loginForwardAction}"
					name="loginForwardAction" />
				<div class="login-title-area">
					<div class="wrap-login-title">
						<span class="login-title-text contact100-form-title">선생님으로 로그인하기</span>
					</div>
				</div>
				<div class="wrap-login-error">
					<form:errors style="color: red;" />
				</div>
				<div class="login-input-area">
					<div class="wrap-login-input-content-area">
						<div class="wrap-login-error">
							<form:errors style="color: red;"  path="email" />
						</div>
						<div class="wrap-input100 login-input-content-area">
							<form:input path="email" class="input100 login-input" type="text" placeholder="아이디" />
						</div>
					</div>
					<div class="wrap-login-input-content-area">
					<div class="wrap-login-error">
							<form:errors style="color: red;"  path="password" />
						</div>
						<div class="wrap-input100 login-input-content-area">
							<form:input path="password" class="input100 login-input" type="password" placeholder="비밀번호" />
						</div>
					</div>
				</div>
				<div class="login-btn-area">
					<button type="submit" class="login-btn btn btn-primary">로그인</button>
				</div>
				<input type="hidden" value="teacher" name="type">
			</form:form>
			<div class="login-find-pw-btn">
				<a href="<c:url value='/auth/find/pw.do'/>" class="login-find-atag">비밀번호 찾기</a>
				
			</div>
		</div>
	</div>
	</div>
</body>
</html>
					
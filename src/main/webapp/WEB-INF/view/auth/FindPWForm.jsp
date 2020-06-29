<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>비밀번호 찾기</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="<c:url value='/resources/css/theme.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.min.css' />">
    <style type="text/css">
      .body {
        text-align: center;
      }
      .form {
		text-align: center;
		padding-top: 120px;
	  }
	  .input {
		margin: auto;
		margin-top: 40px;
		padding-top: 40px;
		padding-bottom: 40px;
		margin-bottom: 20px;
		width: 800px;
		border: 3px solid #FFF9B1;
	  }
      .find-pw-title-area {
        margin: auto;
        padding-bottom: 20px;
      }
      .find-pw-title {
        font-size: 24px;
        font-weight: bold;
      }
      .find-pw-type {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .find-pw-type-area {
        padding: 30px 10px 5px 10px;
      }
      .find-pw-type-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
      .find-pw-input-area {
        width: 250px;
        margin: auto;
      }
      .find-pw-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-pw-btn-area {
        margin: auto;
        padding: 50px 0 0 0;
      }
      .find-pw-btn {
        width: 110px;
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
      .wrap-error {
		display: flex;
		justify-content: center;
		align-items: center;
	  }
    </style>
  </head>
  <body>
    <%@ include file="../include/main_header.jsp" %>
    <div class="form">
    <div class="input">
      <div class="find-pw-title-area">
        <span class="find-pw-title">비밀번호 찾기</span>
      </div>
      <form:form modelAttribute="findPWForm" action="pw" method="post">
      <div class="wrap-login-error">
		<form:errors style="color: red;" />
	  </div>
      <div class="find-pw-type">
        <div class="find-pw-type-area">
          	<form:radiobutton path="type" value="student" label="학생" />
			<form:radiobutton path="type" value="teacher" label="선생님" /><br>
			<form:errors style="color: red;" path="type" />
        </div>
      </div>
      <div class="find-pw-input-area">
        <div class="form-group">
          <form:input path="email" type="text" class="form-control" placeholder="이메일" />
          <form:errors style="color: red;" path="email" />
        </div>
        <div class="form-group">
          <form:input path="name" type="text" class="form-control" placeholder="이름" />
          <form:errors style="color: red;" path="name" />
        </div>
      </div>
      <div class="find-pw-btn-area">
        <button type="submit" class="btn btn-outline-warning cc_pointer">인증번호 받기</button>
      </div>
      </form:form>
    </div>
    </div>
  </body>

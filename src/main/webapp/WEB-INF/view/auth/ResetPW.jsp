<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>비밀번호 변경</title>
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
      .reset-pw-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
        margin-top: 100px;
      }
      .reset-pw-title-area {
        margin: auto;
        padding: 0 0 30px 0;
      }
      .reset-pw-title {
        font-size: 24px;
        font-weight: bold;
      }
      .reset-pw-input-area {
        width: 250px;
        margin: auto;
        padding-top: 20px;
      }
      .reset-pw-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .reset-pw-btn-area {
        margin: auto;
        padding: 50px 0 0 0;
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
      <div class="reset-pw-title-area">
        <span class="reset-pw-title">비밀번호 변경</span>
      </div>
      <form:form modelAttribute="resetPWForm" action="reset" method="POST">
      <div class="wrap-error">
		<form:errors style="color: red;" />
	  </div>
      <div class="reset-pw-input-area">
        <div class="form-group">
          <form:input path="password" name="password" type="password" class="form-control" placeholder="새 비밀번호 입력" />
          <form:errors style="color: red;" path="password" />
        </div>
        <div class="form-group">
          <form:input path="checkedPassword" name="checkedPassword" type="password" class="form-control" placeholder="비밀번호 확인" />
          <form:errors style="color: red;" path="checkedPassword" />
        </div>
      </div>
      <div class="reset-pw-btn-area">
        <button type="submit" class="btn btn-outline-warning cc_pointer">비밀번호 변경</button>
      </div>
      </form:form>
    </div>
	</div>
  </body>
    
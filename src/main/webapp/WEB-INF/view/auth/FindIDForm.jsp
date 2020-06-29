<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>아이디 찾기</title>
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
      .find-id-form {
        width: 500px;
        margin: auto;
        background-color: #e6e6e6;
        margin-top: 100px;
      }
      .find-id-title-area {
        margin: auto;
        padding-bottom: 20px;
      }
      .find-id-title {
        font-size: 24px;
        font-weight: bold;
	  }
      .find-id-type {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .find-id-type-area {
        padding: 30px 10px 5px 10px;
      }
      .find-id-type-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
      .find-id-input-area {
        width: 250px;
        margin: auto;
      }
      .find-id-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-id-btn-area {
        margin: auto;
        padding: 50px 0 0 0;
      }
      .find-id-btn {
        width: 100px;
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
      <div class="find-id-title-area">
        <span class="find-id-title">아이디 찾기</span>
      </div>
      <form:form modelAttribute="findIDForm" action="id" method="post">
      <div class="wrap-error">
		<form:errors style="color: red;" />
	  </div>
      <div class="find-id-type">
        <div class="find-id-type-area">
        	<form:radiobutton path="type" value="student" label="학생" />
			<form:radiobutton path="type" value="teacher" label="선생님" /><br>
			<form:errors style="color: red;" path="type" />
        </div>
      </div>
      <div class="find-id-input-area">
        <div class="form-group">
          <form:input path="name" type="text" class="form-control" placeholder="이름" />
          <form:errors style="color: red;" path="name" />
        </div>
        <div class="form-group">
          <form:input path="phone" type="number" class="form-control" placeholder="전화번호" />
          <form:errors style="color: red;" path="phone" />
        </div>
      </div>
      <div class="find-id-btn-area">
        <button type="submit" class="btn btn-outline-warning cc_pointer">아이디 찾기</button>
      </div>
      </form:form>
    </div>
    </div>
  </body>

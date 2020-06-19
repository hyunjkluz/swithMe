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
    <link rel="stylesheet" href="" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.min.css' />">
    <style type="text/css">
      .body {
        text-align: center;
      }
      .find-id-form {
        width: 500px;
        margin: auto;
        background-color: #FFF362;
      }
      .find-id-title-area {
        width: 100%
        margin: auto;
        padding: 50px 0 0 0;
      }
      .wrap-title {
		display: flex;
		justify-content: center;
		align-items: center;
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
        width: 154px;
        margin: auto;
      }
      .find-id-input-content-area {
        padding: 5px 0 5px 0;
      }
      .find-id-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-id-btn-area {
        width: 100px;
        margin: auto;
        padding: 50px 0 50px 0;
      }
      .find-id-btn {
        width: 100px;
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <%@ include file="../include/main_header.jsp" %>
    <div class="find-id-form">
      <div class="find-id-title-area">
      	<div class="wrap-title">
        	<span class="find-id-title contact100-form-title">아이디 찾기</span>
      	</div>
      </div>
      <form:form modelAttribute="findIDForm" action="id" method="post">
      <div class="find-id-type">
        <div class="find-id-type-area">
        	<form:radiobutton path="type" value="student" label="학생" />
			<form:radiobutton path="type" value="teacher" label="선생님" /><br>
			<form:errors path="type" />
        </div>
      </div>
      <div class="find-id-input-area">
        <div class="find-id-input-content-area">
          <form:input path="name" type="text" class="input100 " placeholder="이름" />
          <form:errors path="name" />
        </div>
        <div class="find-id-input-content-area">
          <form:input path="phone" type="number" class="input100 find-id-input-text" placeholder="전화번호" />
          <form:errors path="phone" />
        </div>
      </div>
      <div class="find-id-btn-area">
        <button type="submit" class="find-id-btn">아이디 찾기</button>
      </div>
      </form:form>
    </div>
    <%@ include file="../include/main_footer.jsp" %>
  </body>

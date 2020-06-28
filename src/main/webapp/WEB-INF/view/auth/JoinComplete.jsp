<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>회원가입</title>
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
      .join-complete-name-area {
        width: 280px;
        margin: auto;
        padding: 30px 0 30px 0;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .join-complete-name {
        font-size: 14px;
      }
      .join-complete-title {
      	font-size: 16px;
      }
      .join-type-select-area {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0 0 50px 0;
      }
      .join-type-select-student {
        width: 250px;
        height: 200px;
        background-color: #D9D9D9;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
      }
      .join-type-select-teacher {
        width: 250px;
        height: 200px;
        background-color: #F3F3F3;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
      }
      .join-term-btn-area {
        width: 110px;
        margin: auto;
        padding: 20px 0 50px 0;
      }
      .join-term-btn {
        width: 110px;
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
      .join-complete-title-area {
        display: flex;
        justify-content: center;
        align-items: center;
        padding-bottom: 30px;
      }
      .join-complete-btn-area {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px 0 0 0;
      }
      .join-complete-teacher-btn-area {
        justify-content: center;
        align-items: center;
        padding: 30px 0 0 0;
      }
    </style>
  </head>
  <body>
    <%@ include file="../include/step_header.jsp" %>
    <div class="form">
      <div class="stepimage">
        <img src="../../resources/assets/Join_Step_4.png" />
      </div>
    <div class="input">
      <div class="join-complete-name-area">
        <div class="join-complete-name-content">
          <span class="join-complete-name">환영합니다.</span>
        </div>
      </div>
      <div class="join-complete-title-area">
        <div class="join-complete-title-content">
          <span class="join-complete-title">가입이 완료되었습니다.</span>
        </div>
      </div>
      <c:if test="${type == 'student'}">
	      <div class="join-complete-btn-area">
	        <button class="btn btn-outline-warning cc_pointer" onclick="location.href='/swithMe/auth/loginForm.do'">로그인</button>
	      </div>
      </c:if>
      <c:if test="${type == 'teacher'}">
      	<div class="join-complete-teacher-btn-area">
      		<button class="btn btn-outline-warning cc_pointer" onclick="location.href='/swithMe/auth/loginForm.do'">매칭정보 작성</button><br>
      		<span>학생과의 매칭을 원하신다면, 수업 정보를 작성해주세요!</span>
    	</div>
      </c:if>
    </div>
    </div>
  </body>
    
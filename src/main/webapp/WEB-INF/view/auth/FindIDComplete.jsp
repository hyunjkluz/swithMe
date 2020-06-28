<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>아이디 찾기 결과</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="" />
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
      .find-id-complete-title-area {
        margin: auto;
        padding: 0 0 30px 0;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .find-id-complete-title-text-area {
        margin: auto;
      }
      .find-id-complete-title {
        font-size: 24px;
        font-weight: bold;
      }
      .find-id-complete-result-area {
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 30px;
      }
      .find-id-complete-result-content-area {
        padding: 5px 0 5px 0;
      }
      .find-id-complete-result-text {
        padding: 5px 0 5px 0;
      }
      .find-id-complete-btn-area {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: auto;
        padding: 50px 0 0 0;
      }
      .find-id-complete-btn {
        width: 80px;
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
    <div class="form">
    <div class="input">
      <div class="find-id-complete-title-area">
        <div class="find-id-complete-title-text-area">
          <span class="find-id-complete-title">아이디 찾기 결과</span>
        </div>
      </div>
      <div class="find-id-complete-result-area">
        <div class="find-id-complete-result-content-area">
          <span class="find-id-complete-result-text">${id}</span>
        </div>
      </div>
      <div class="find-id-complete-btn-area">
        <button class="btn btn-outline-warning cc_pointer" id="login" onclick="location.href='/swithMe/auth/loginForm.do'">로그인</button>
      </div>
    </div>
    </div>
  </body>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <title>인증번호 입력</title>
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
      .find-pw-identify-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
      }
      .find-pw-identify-title-area {
        margin: auto;
        padding: 0 0 20px 0;
      }
      .find-pw-identify-title {
        font-size: 24px;
        font-weight: bold;
      }
      .find-pw-identify-input-area {
        width: 200px;
        margin: auto;
        padding-top: 20px;
      }
      .find-pw-identify-input-content-area {
        padding: 5px 0 5px 0;
      }
      .find-pw-identify-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-pw-identify-btn-area {
        margin: auto;
        padding: 50px 0 0 0;
      }
      .find-pw-identify-btn {
        width: 80px;
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
      <div class="find-pw-identify-title-area">
        <span class="find-pw-identify-title">인증번호 입력</span>
      </div>
      <form action="<c:url value='/auth/find/pw/identify' />" method="post">
      <div class="find-pw-identify-input-area">
        <div class="find-pw-identify-input-content-area">
        	<div class="wrap-error">
				<form:errors style="color: red;" />
			</div>
          <input name="code" type="text" class="form-control" placeholder="인증번호 입력" />
        </div>
      </div>
      <div class="find-pw-identify-btn-area">
        <button type="submit" class="btn btn-outline-warning cc_pointer">인증하기</button>
      </div>
      </form>
    </div>
    </div>
  </body>

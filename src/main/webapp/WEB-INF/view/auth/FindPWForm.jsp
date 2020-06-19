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
    <link rel="stylesheet" href="" />
    <style type="text/css">
      .body {
        text-align: center;
      }
      .find-pw-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
      }
      .find-pw-title-area {
        width: 130px;
        margin: auto;
        padding: 50px 0 30px 0;
      }
      .find-pw-title {
        font-size: 20px;
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
        width: 154px;
        margin: auto;
      }
      .find-pw-input-content-area {
        padding: 5px 0 5px 0;
      }
      .find-pw-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-pw-btn-area {
        width: 110px;
        margin: auto;
        padding: 50px 0 50px 0;
      }
      .find-pw-btn {
        width: 110px;
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="base-top">

    </div>
    <div class="find-pw-form">
      <div class="find-pw-title-area">
        <span class="find-pw-title">비밀번호 찾기</span>
      </div>
      <form:form modelAttribute="findPWForm" action="pw" method="post">
      <div class="find-pw-type">
        <div class="find-pw-type-area">
          	<form:radiobutton path="type" value="student" label="학생" />
			<form:radiobutton path="type" value="teacher" label="선생님" /><br>
			<form:errors path="type" />
        </div>
      </div>
      <div class="find-pw-input-area">
        <div class="find-pw-input-content-area">
          <form:input path="email" type="text" class="find-pw-input-text" placeholder="이메일" />
          <form:errors path="email" />
        </div>
        <div class="find-pw-input-content-area">
          <form:input path="name" type="text" class="find-pw-input-text" placeholder="이름" />
          <form:errors path="name" />
        </div>
      </div>
      <div class="find-pw-btn-area">
        <button type="submit" class="find-pw-btn">인증번호 받기</button>
      </div>
      </form:form>
    </div>
  </body>

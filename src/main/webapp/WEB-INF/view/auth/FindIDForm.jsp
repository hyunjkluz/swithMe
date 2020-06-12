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
    <style type="text/css">
      .body {
        text-align: center;
      }
      .find-id-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
      }
      .find-id-title-area {
        width: 108px;
        margin: auto;
        padding: 50px 0 30px 0;
      }
      .find-id-title {
        font-size: 20px;
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
    <div class="base-top">

    </div>
    <div class="find-id-form">
      <div class="find-id-title-area">
        <span class="find-id-title">아이디 찾기</span>
      </div>
      <form:form modelAttribute="findIDForm" action="id" method="post">
      <div class="find-id-type">
        <div class="find-id-type-area">
        	<form:radiobutton path="type" value="student" label="학생" />
			<form:radiobutton path="type" value="teacher" label="선생님" />
          <!-- <button class="find-id-type-btn">학생</button>
        </div>
        <div class="find-id-type-area">
          <button class="find-id-type-btn">선생님</button> -->
        </div>
      </div>
      <div class="find-id-input-area">
        <div class="find-id-input-content-area">
          <form:input path="name" type="text" class="find-id-input-text" placeholder="이름" />
        </div>
        <div class="find-id-input-content-area">
          <form:input path="phone" type="number" class="find-id-input-text" placeholder="전화번호" />
        </div>
      </div>
      <div class="find-id-btn-area">
        <button type="submit" class="find-id-btn">아이디 찾기</button>
      </div>
      </form:form>
    </div>
  </body>

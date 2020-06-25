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
    <link rel="stylesheet" href="" />
    <style type="text/css">
      .body {
        text-align: center;
      }
      .reset-pw-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
      }
      .reset-pw-title-area {
        width: 130px;
        margin: auto;
        padding: 50px 0 30px 0;
      }
      .reset-pw-title {
        font-size: 20px;
        font-weight: bold;
      }
      .reset-pw-input-area {
        width: 154px;
        margin: auto;
      }
      .reset-pw-input-content-area {
        padding: 5px 0 5px 0;
      }
      .reset-pw-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .reset-pw-btn-area {
        width: 110px;
        margin: auto;
        padding: 50px 0 50px 0;
      }
      .reset-pw-btn {
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
    <div class="reset-pw-form">
      <div class="reset-pw-title-area">
        <span class="reset-pw-title">비밀번호 변경</span>
      </div>
      <form:form modelAttribute="resetPWForm" action="reset" method="POST">
      <div class="reset-pw-input-area">
        <div class="reset-pw-input-content-area">
          <input name="password" type="password" class="reset-pw-input-text" placeholder="새 비밀번호 입력" />
        </div>
        <div class="reset-pw-input-content-area">
          <input name="checkedPassword" type="password" class="reset-pw-input-text" placeholder="비밀번호 확인" />
        </div>
      </div>
      <div class="reset-pw-btn-area">
        <button type="submit" class="reset-pw-btn">비밀번호 변경</button>
      </div>
      </form:form>
    </div>
  </body>
    
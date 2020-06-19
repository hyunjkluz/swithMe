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
      .find-pw-identify-form {
        width: 500px;
        margin: auto;
        border: 1px solid gray;
      }
      .find-pw-identify-title-area {
        width: 130px;
        margin: auto;
        padding: 50px 0 30px 0;
      }
      .find-pw-identify-title {
        font-size: 20px;
        font-weight: bold;
      }
      .find-pw-identify-input-area {
        width: 154px;
        margin: auto;
        padding-top: 10px;
      }
      .find-pw-identify-input-content-area {
        padding: 5px 0 5px 0;
      }
      .find-pw-identify-input-text {
        width: 150px;
        padding: 5px 0 5px 0;
      }
      .find-pw-identify-btn-area {
        width: 80px;
        margin: auto;
        padding: 50px 0 50px 0;
      }
      .find-pw-identify-btn {
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
    <div class="base-top">

    </div>
    <div class="find-pw-identify-form">
      <div class="find-pw-identify-title-area">
        <span class="find-pw-identify-title">인증번호 입력</span>
      </div>
      <form action="<c:url value='/auth/find/pw/identify' />" method="post">
      <div class="find-pw-identify-input-area">
        <div class="find-pw-identify-input-content-area">
          <input name="certificationNum" type="text" class="find-pw-identify-input-text" placeholder="인증번호 입력" />
        </div>
      </div>
      <div class="find-pw-identify-btn-area">
        <button type="submit" class="find-pw-identify-btn">인증하기</button>
      </div>
      </form>
    </div>
  </body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>회원가입</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="" />
    <style type="text/css">
      .body {
        text-align: center;
      }
      .join-term-form {
        margin: auto;
        border: 1px solid black;
        width: 600px;
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
      .join-term-procedure {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 50px 0 30px 0;
      }
      .join-term-procedure-content {
        margin: 0 10px 0 10px;
        width: 170px;
        height: 50px;
        background-color: #D9D9D9;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .join-term-procedure-content-now {
        margin: 0 10px 0 10px;
        width: 170px;
        height: 50px;
        background-color: black;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
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
        padding: 30px 0 50px 0;
      }
      .join-complete-btn {
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
    <div class="join-term-form">
      <div class="join-term-procedure">
        <div class="join-term-procedure-content">
          <span class="join-term-procedure-content-text">약관 동의</span>
        </div>
        <div class="join-term-procedure-content">
          <span class="join-term-procedure-content-text">가입 유형 / 정보 입력</span>
        </div>
        <div class="join-term-procedure-content-now">
          <span class="join-term-procedure-content-text">가입 완료</span>
        </div>
      </div>
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
      <div class="join-complete-btn-area">
        <button class="join-complete-btn" onclick="<c:url value='/auth/loginForm.do' />">로그인</button>
      </div>
    </div>
  </body>
    
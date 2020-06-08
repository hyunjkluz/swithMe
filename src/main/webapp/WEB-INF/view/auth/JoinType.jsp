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
      .join-term-title-area {
        width: 280px;
        margin: auto;
        padding: 30px 0 30px 0;
      }
      .join-term-title {
        font-size: 20px;
        font-weight: bold;
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
      .join-type-select-text {

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
        <div class="join-term-procedure-content-now">
          <span class="join-term-procedure-content-text">가입 유형 / 정보 입력</span>
        </div>
        <div class="join-term-procedure-content">
          <span class="join-term-procedure-content-text">가입 완료</span>
        </div>
      </div>
      <div class="join-term-title-area">
        <span class="join-term-title">회원가입 유형을 선택해주세요.</span>
      </div>
      <div class="join-type-select-area">
        <div class="join-type-select-student">
          <div class="join-type-select-text">
            <span>학생으로 회원가입</span>
          </div>
        </div>
        <div class="join-type-select-teacher">
          <div class="join-type-select-text">
            <span>선생님으로 회원가입</span>
          </div>
        </div>
      </div>
      <div class="join-term-btn-area">
        <button class="join-term-btn">로그인</button>
      </div>
    </div>
  </body>
    
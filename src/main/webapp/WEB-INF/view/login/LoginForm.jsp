<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <title>로그인</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="" />
    <style type="text/css">
      .body {
        text-align: center;
      }
      .login-form {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 800px;
        margin: auto;
      }
      .login-student-detail {
        display: block;
        flex: 1;
        background-color: #F3D55B;
      }
      .login-teacher-detail {
        display: block;
        flex: 1;
        background-color: #F1C232;
      }
      .login-title-student-area {
        width: 150px;
        margin: auto;
        padding: 50px 0 25px 0;
      }
      .login-title-student-text {
        width: 150px;
        font-size: 15px;
        font-weight: bold;
      }
      .login-title-teacher-area {
        width: 170px;
        margin: auto;
        padding: 50px 0 25px 0;
      }
      .login-title-teacher-text {
        width: 170px;
        font-size: 15px;
        font-weight: bold;
      }
      .login-input-area {
        width: 170px;
        margin: auto;
        padding: 25px 0 25px 0;
      }
      .login-input-content-area {
        padding: 5px 0 5px 0;
      }
      .login-input {
        width: 160px;
        padding: 5px 0 5px 0;
      }
      .login-btn-area {
        width: 170px;
        margin: auto;
        padding: 25px 0 50px 0;
      }
      .login-btn {
        width: 160px;
        padding: 5px 0 5px 0;
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
    <div class="login-form">
      <div class="login-student-detail">
        <div class="login-title-student-area">
          <span class="login-title-student-text">학생으로 로그인하기</span>
        </div>
        <div class="login-input-area">
          <div class="login-input-content-area">
            <input class="login-input" type="text" /><br>
          </div>
          <div class="login-input-content-area">
            <input class="login-input" type="password" />
          </div>
        </div>
        <div class="login-btn-area">
          <button class="login-btn">로그인</button>
        </div>
      </div>
      <div class="login-teacher-detail">
        <div class="login-title-teacher-area">
          <span class="login-title-teacher-text">선생님으로 로그인하기</span>
        </div>
        <div class="login-input-area">
          <div class="login-input-content-area">
            <input class="login-input" type="text" /><br>
          </div>
          <div class="login-input-content-area">
            <input class="login-input" type="password" />
          </div>
        </div>
        <div class="login-btn-area">
          <button class="login-btn">로그인</button>
        </div>
      </div>
    </div>

  </body>
</html>
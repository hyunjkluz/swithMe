<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        margin: auto;
        padding: 30px 0 30px 0;
        display: flex;
        justify-content: center;
        align-items: center;
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
      .join-input-info-row-area {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 3px 0 3px 0;
      }
      .join-input-info-id-text {
        padding: 5px 5px 5px 5px;
        height: 13px;
      }
      .join-input-info-id-confirm {
        padding: 0 0 0 10px;
      }
      .join-input-info-id-confirm-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
      }
      .join-input-info-pw {
        padding: 0 3px 0 3px;
      }
      .join-input-info-pw-text {
        padding: 5px 5px 5px 5px;
        height: 13px;
      }
      .join-input-info-name-text {
        padding: 5px 5px 5px 5px;
        height: 13px;
      }
      .join-input-info-gender {
        padding: 0 5px 0 5px;
      }
      .join-input-info-gender-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
        width: 80px;
      }
      .join-input-info-school-type-select {
        padding: 5px 5px 5px 5px;
        height: 30px;
      }
      .join-input-info-school-status {
        padding: 0 0 0 10px;
      }
      .join-input-info-school-status-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
        width: 50px;
      }
      .join-input-info-school-text {
        padding: 5px 5px 5px 5px;
        height: 13px;
      }
      .join-input-info-school-search {
        padding-left: 10px;
      }
      .join-input-info-school-search-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
        width: 80px;
      }
      .join-input-info-btn-area {
        padding: 20px 0 30px 0;
      }
      .join-input-info-btn {
        padding: 5px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
        width: 150px;
        height: 40px;
      }
    </style>
    <script type="text/javascript">
    	function changeGrade(value) {
    		if (value == "elementary") {
    			num = new Array("1학년", "2학년", "3학년", "4학년", "5학년", "6학년");
    			vnum = new Array("1", "2", "3", "4", "5", "6");
    		} else if (value == "middle") {
    			num = new Array("1학년", "2학년", "3학년");
    			vnum = new Array("1", "2", "3");
    		} else if (value == "high") {
    			num = new Array("1학년", "2학년", "3학년");
    			vnum = new Array("1", "2", "3");
    		}
    		
    		var grade = document.getElementById('grade');
    		
    		for (var i = 0; i < grade.length; i++) {
    			grade.options[i] = null;
    		}
    		
    		for (i = 0; i < num.length; i++) {
    			grade.options[i] = new Option(num[i], vnum[i]);
    		}
    	}
    </script>
  </head>
  <body>
    <div class="base-top">

    </div>
    <div class="join-term-form">
      <div class="join-term-procedure">
        <div class="join-term-procedure-content-now">
          <span class="join-term-procedure-content-text">약관 동의</span>
        </div>
        <div class="join-term-procedure-content">
          <span class="join-term-procedure-content-text">가입 유형 / 정보 입력</span>
        </div>
        <div class="join-term-procedure-content">
          <span class="join-term-procedure-content-text">가입 완료</span>
        </div>
      </div>
      <div class="join-term-title-area">
        <span class="join-term-title">학생 회원정보 입력</span>
      </div>
      <form:form modelAttribute="student" method="post" action="student">
      <div class="join-input-info">
      	<form:form action="<c:url value='/auth/signup/idCheck' />" name="idCheck" method="POST">
        <div class="join-input-info-row-area">
          <div class="join-input-info-id">
            <form:input path="email" type="text" class="join-input-info-id-text" placeholder="아이디" />
          </div>
          <div class="join-input-info-id-confirm">
            <button type="submit" class="join-input-info-id-confirm-btn">중복 확인</button>
          </div>
        </div>
        </form:form>
        <div class="join-input-info-row-area">
          <div class="join-input-info-pw">
            <form:input path="password" type="password" class="join-input-info-pw-text" placeholder="비밀번호" />
          </div>
          <div class="join-input-info-pw">
            <form:input path="checkedPassword" type="password" class="join-input-info-pw-text" placeholder="비밀번호 확인" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-name">
            <input type="text" class="join-input-info-name-text" placeholder="이름" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-name">
            <input type="number" class="join-input-info-name-text" placeholder="전화번호" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-gender">
            <button class="join-input-info-gender-btn" id="female" onclick="setGenderBtn('female');">여성</button>
          </div>
          <div class="join-input-info-gender">
            <button class="join-input-info-gender-btn" id="male" onclick="setGenderBtn('male');">남성</button>
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-school-type">
            <form:select path="schoolCategory" name="schoolType" id="schoolType" class="join-input-info-school-type-select" onChange="changeGrade(value);">
              <form:option value="elementary">초등학교</form:option>
              <form:option value="middle">중학교</form:option>
              <form:option value="high">고등학교</form:option>
            </form:select>
          </div>
          <div class="join-input-info-school-status">
            <!-- <button class="join-input-info-school-status-btn">재학</button>
            <button class="join-input-info-school-status-btn">졸업</button>
            <form:input type="radio" name="status" path="status" value="attend" />재학
            <form:input type="radio" name="status" path="status" value="graduate" />졸업 -->
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-school">
            <input type="text" class="join-input-info-school-text" id="school" placeholder="학교이름" />
          </div>
          <div class="join-input-info-school-search">
            <button class="join-input-info-school-search-btn">학교 검색</button>
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-grade">
            <form:select path="grade" name="grade" id="grade" class="join-input-info-school-type-select">
              
            </form:select>
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-img">

          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-btn-area">
            <button type="submit" class="join-input-info-btn">회원정보 입력 완료</button>
          </div>
        </div>
      </div>
      </form:form>
    </div>
  </body>

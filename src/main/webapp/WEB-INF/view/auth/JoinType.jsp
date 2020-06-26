<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  	<script type="text/javascript">
    	function setTypeStudent() {
    		var form = document.signupStudent;
    		form.action = "<c:url value='/auth/signup' />";
    		
    		form.submit();
    	}
    	
    	function setTypeTeacher() {
    		var form = document.signupTeacher;
    		form.action = "<c:url value='/auth/signup' />";
    		
    		form.submit();
    	}
    </script>
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
      	<form:form action="<c:url value='/auth/signup'/>" name="signupStudent" method="GET">
        <div onclick="setTypeStudent()" class="join-type-select-student">
          <div class="join-type-select-text">
            <span>학생으로 회원가입</span>
            <input type="hidden" value="student" name="type">
          </div>
        </div>
        
        </form:form>
        <form:form action="<c:url value='/auth/signup'/>" name="signupTeacher" method="GET">
        <div onclick="setTypeTeacher()" class="join-type-select-teacher">
          <div class="join-type-select-text">
            <span>선생님으로 회원가입</span>
            <input type="hidden" value="teacher" name="type">
          </div>
        </div>
        </form:form>
      </div>
    </div>
  </body>
    
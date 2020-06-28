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
    <link rel="stylesheet" href="../../resources/css/theme.css" />
    <style type="text/css">
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
      .body {
        text-align: center;
      }
      .join-term-form {
        margin: auto;
        border: 1px solid black;
        width: 600px;
        margin-top: 100px;
      }
      .join-term-title-area {
        margin: auto;
        padding: 30px 0 30px 0;
      }
      .join-term-title {
        font-size: 24px;
        font-weight: bold;
      }
      .join-type-select-area {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px 0 50px 0;
      }
      .join-type-select-student {
        width: 300px;
        height: 250px;
        background-color: #FFF362;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
      }
      .join-type-select-teacher {
        width: 300px;
        height: 250px;
        background-color: #FFF9B1;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
      }
      .join-type-font {
      	font-size: 15px;
      }
      .img-size {
      	width: 80px;
      	height: 80px;
      	margin-top: 15px;
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
    <%@ include file="../include/step_header.jsp" %>
    <div class="form">
      <div class="stepimage">
        <img src="../../resources/assets/Join_Step_2.png" />
      </div>
      <div class="input">
      <div class="join-term-title-area">
        <span class="join-term-title">회원가입 유형을 선택해주세요.</span>
      </div>
      <div class="join-type-select-area">
      	<form:form action="<c:url value='/auth/signup'/>" name="signupStudent" method="GET">
        <div onclick="setTypeStudent()" class="join-type-select-student">
          <div class="join-type-select-text">
            <span class="join-type-font">학생으로 회원가입</span>
            <div class="img-area">
            	<img class="img-size" src="../../resources/assets/student.png" />
            </div>
            <input type="hidden" value="student" name="type">
          </div>
        </div>
        </form:form>
        <form:form action="<c:url value='/auth/signup'/>" name="signupTeacher" method="GET">
        <div onclick="setTypeTeacher()" class="join-type-select-teacher">
          <div class="join-type-select-text">
            <span class="join-type-font">선생님으로 회원가입</span>
            <div class="img-area">
            	<img class="img-size" src="../../resources/assets/Teacher_mypage.png" />
            </div>
            <input type="hidden" value="teacher" name="type">
          </div>
        </div>
        </form:form>
      </div>
      </div>
    </div>
  </body>
    
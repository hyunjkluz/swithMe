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
    <link rel="stylesheet" href="<c:url value='/resources/css/theme.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap.min.css' />">
    <style type="text/css">
      .body {
        text-align: center;
      }
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
      .join-term-title-area {
        margin: auto;
        padding: 30px 0 30px 0;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .join-term-title {
        font-size: 24px;
        font-weight: bold;
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
        padding: 50px 0 0 0;
      }
      .join-input-info-btn {
        padding: 20px 10px 5px 10px;
        border: 0;
        outline: 0;
        border-radius: 3px;
        cursor: pointer;
        width: 150px;
        height: 40px;
      }
      .school-select {
      	margin-right: 10px;
      }
    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	    function idCheck() {
	    	var id = $("#email-text").val();
	    	const url = "http://localhost:8080/swithMe/auth/teacher/idCheck/" + id;
	    	console.log(url);
	    	$.ajax({
				url : url,
				type : "GET",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id-check").text("이미 사용중인 아이디입니다.");
						$("#id-check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						$("#id-check").text("사용가능한 아이디입니다.");
						$("#id-check").css("color", "blue");
					}
				},
				error : function() {
							console.log("실패");
				}
			});
	    }
    	
    	function searchUniversity() {
    		var id = $("#university").val();
    		const url = "http://localhost:8080/swithMe/search/university/" + id;
    		console.log(url);

    		$.ajax({
    			url : url,
    			type : "GET",
    			dataType : "json",
    			contentType : "application/json",
    			success : function(data) {
    				console.log(data);
    				for (var i = 0; i < data.length; i++) {
    					$('#universityList').append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
    				}
    			},
    			error : function(errorThrown) {
    				alert(errorThrown.statusText);
    			}
    		})
    	}
    </script>
  </head>
  <body>
    <%@ include file="../include/step_header.jsp" %>
    <div class="form">
      <div class="stepimage">
        <img src="../../resources/assets/Join_Step_3.png" />
      </div>
      <div class="input">
      <div class="join-term-title-area">
        <span class="join-term-title">선생님 회원정보 입력</span>
      </div>
      <form:form modelAttribute="teacherForm" method="post" action="teacher">
      <div class="join-input-info">
        <div class="join-input-info-row-area">
          <div class="join-input-info-id">
            <form:input path="email" id="email-text" type="text" class="form-control" placeholder="아이디" />
          </div>
          <div class="join-input-info-school-search">
            <input type="button" class="btn btn-outline-warning cc_pointer" onclick="idCheck();" value="중복 확인" />
          </div>
        </div>
        <div class="id-check-area" id="id-check"></div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-pw">
            <form:input path="password" type="password" class="form-control" placeholder="비밀번호" />
          </div>
          <div class="join-input-info-pw">
            <form:input path="checkedPassword" type="password" class="form-control" placeholder="비밀번호 확인" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-name">
            <form:input path="name" type="text" class="form-control" placeholder="이름" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-name">
            <form:input path="phone" type="number" class="form-control" placeholder="전화번호" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-gender">
          	<form:radiobutton path="gender" value="female" label="여성" />
			<form:radiobutton path="gender" value="male" label="남성" /><br>
			<form:errors path="gender" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          
          <div class="join-input-info-school-status">
          	<form:radiobutton path="status" value="재학" label="재학" />
          	<form:radiobutton path="status" value="휴학" label="휴학" />
			<form:radiobutton path="status" value="졸업" label="졸업" /><br>
			<form:errors path="status" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-school">
            <input type="text" class="form-control" id="university" placeholder="학교이름" />
          </div>
          <div class="join-input-info-school-search">
            <input type="button" class="btn btn-outline-warning cc_pointer" onclick="searchUniversity();" value="학교 검색" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="select btn btn-primary school-select">
            <form:select path="universityId" id="universityList" name="universityList" class="dropdown-item">
          
            </form:select>
          </div>
          <div class="select btn btn-primary">
            <form:select path="grade" name="grade" id="grade" class="dropdown-item">
              <option value="1">1학년</option>
              <option value="2">2학년</option>
              <option value="3">3학년</option>
              <option value="4">4학년</option>
            </form:select>
          </div>
        </div>
        <div class="join-input-info-row-area">
        	학력증명서
          <div class="join-input-info-img">
			<input type="file" name="univCertImg" />
          </div>
        </div>
        <div class="join-input-info-row-area">
        	프로필이미지
          <div class="join-input-info-img">
			<input type="file" name="profileImg" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-btn-area">
            <button type="submit" class="btn btn-outline-warning cc_pointer">회원정보 입력 완료</button>
          </div>
        </div>
      </div>
      </form:form>
    </div>
    </div>
  </body>

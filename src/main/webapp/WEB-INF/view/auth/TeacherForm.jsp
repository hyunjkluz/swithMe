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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	    $("#email-text").blur(function() {
	    	var id = $("#email-text").val();
	    	console.log(id);
	    	$.ajax({
				url : 'http://localhost:8080/swithMe/auth/signup/teacher/idCheck?email='+ id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#id-check").text("이미 사용중인 아이디입니다.");
							$("#id-check").css("color", "red");
							$("#reg_submit").attr("disabled", true);
					}
				},
				error : function() {
							console.log("실패");
				}
			});
	    });
    	
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
        <span class="join-term-title">선생님 회원정보 입력</span>
      </div>
      <form:form modelAttribute="teacherForm" method="post" action="student">
      <div class="join-input-info">
        <div class="join-input-info-row-area">
          <div class="join-input-info-id">
            <form:input path="email" id="email-text" type="text" class="join-input-info-id-text" placeholder="아이디" />
          </div>
        </div>
        <div class="id-check-area" id="id-check"></div>
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
            <form:input path="name" type="text" class="join-input-info-name-text" placeholder="이름" />
          </div>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-name">
            <form:input path="phone" type="number" class="join-input-info-name-text" placeholder="전화번호" />
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
            <input type="text" class="join-input-info-school-text" id="university" placeholder="학교이름" />
          </div>
          <div class="join-input-info-school-search">
            <input type="button" class="join-input-info-school-search-btn" onclick="searchUniversity();" value="학교 검색" />
          </div>
          <form:select path="universityId" id="universityList" name="universityList">
          
          </form:select>
        </div>
        <div class="join-input-info-row-area">
          <div class="join-input-info-grade">
            <form:select path="grade" name="grade" id="grade" class="join-input-info-school-type-select">
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
            <button type="submit" class="join-input-info-btn">회원정보 입력 완료</button>
          </div>
        </div>
      </div>
      </form:form>
    </div>
  </body>

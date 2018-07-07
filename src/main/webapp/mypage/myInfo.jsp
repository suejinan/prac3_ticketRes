<%@page import="com.spring.tic.noticeboard.NBoardVO"%>
<%@page import="com.spring.tic.noticeboard.NBoardService"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!-- 부트스트랩, 제이쿼리 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 스타일 -->
<link rel="stylesheet" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원정보 상세보기</title>
<style>
</style>
<script>
	function update(frm) {
		if (frm.password.value.trim() == ""){
			alert("비밀번호를 입력하세요.");
			frm.password.value = "";
			frm.password.focus();
			return;
		}  else if (frm.name.value.trim() == ""){
			alert("이름을 입력하세요.");
			frm.name.value = "";
			frm.name.focus();
			return;
		}  else if (frm.emailid.value.trim() == ""){
			alert("이메일을 입력하세요.");
			frm.emailid.value = "";
			frm.emailid.focus();
			return;
		}  else if (frm.emailaddr.value.trim() == "" && frm.email_dns.value.trim() == ""){
			alert("이메일을 입력하세요.");
			frm.emailid.value = "";
			frm.emailid.focus();
			return;
		} else if (frm.password.value != frm.password_check.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			frm.password.value = "";
			frm.password.focus();
			return;
		}
		
		frm.action = "updateUser.do";
		frm.submit();
	}
	
	function deleteUser(frm) {
		var isDelete = confirm("탈퇴 하시겠습니까?");
		if (isDelete) {
			frm.action= "deleteUser.do";
			frm.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<div class="top-head left">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
	                <h1>Bit ticket<small>bit ticket Homepage</small></h1>
				</div>
				<div class="col-md-6 col-lg-3 ml-auto admin-bar hidden-sm-down">
					<nav class="nav nav-inline"> 
					<c:if test="${sessionScope.userId == null }">
			        <a href ="loginForm.do">LOGIN </a>
			        <a href ="joinForm.do"> JOIN US </a>
					</c:if>
					<c:if test="${sessionScope.userId != null }">
					<a href ="logout.do"> LOGOUT </a>
					<a href ="mypage.do"> MYPAGE</a>
					<a href="#" class="nav-link"><span class="ping"></span><i class="fa fa-envelope-o"></i></a> 
					<a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a><a href="#" class="nav-link">${sessionScope.userId}님 환영합니다.</a>
					<img class="img-fluid rounded-circle" src="resources/img/main_img/man.png" style="margin: 10px; ">
					</c:if>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div>
	<section class="top-nav">
	<nav class="navbar navbar-expand-lg py-0">
		<div class="container">
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
		    <div class="collapse navbar-collapse" id="exCollapsingNavbar2">
				<ul class="nav navbar-nav ">
			        <li class="nav-item"> <a class="nav-link" href="main.jsp">Home <span class="sr-only">(current)</span></a> </li>
			        <li class="nav-item"> <a class="nav-link" href="product/product_list.do">PLAY</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="hyoboard/getNBoardList.do">NOTICE</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="Review/getReviewList.do">REVIEW</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="QnA/getBoardList.do">Q&A</a> </li>
			        <c:if test="${sessionScope.userId == 'manager' }">
				        <li class="nav-item"> <a class="nav-link" style="color: red" href="Manager/pageManager.jsp">MANAGER</a> </li>
					</c:if>
				</ul>
		    </div>
		</div>
	</nav>
	</section>	
	</div>

	<section class="section-01">
	<div class="container" style="min-height: 570px;">
	<div class="row">
		<div class="col">
		<h2 style="margin: 20px;">기본정보 <span style="color: lightgray; font-size: 24px;">| MYPAGE</span></h2>
		<form class="form-inline"  method="post" name="userinput">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td>
						<input class="form-control input-sm" type="text" name="id" id="id" value="${user.id }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input class="form-control input-sm" type="password" name="password">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input class="form-control input-sm" type="password" name="password_check">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input class="form-control input-sm" type="text" name="name" value="${user.name }">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: middle;">휴대전화</td>
					<td>
					<select class="form-control input-sm" name="phone1" style="height: 30px;">
						<option value="010">010
						<option value="011">011
						<option value="016">016
						<option value="017">017
						<option value="018">018
						<option value="019">019
					</select>-
						<input class="form-control input-sm" type="text" name="phone2" value="${user.phone2 }">
						-
						<input class="form-control input-sm" type="text" name="phone3" value="${user.phone3 }">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input class="form-control input-sm" type="text" name="address" value="${user.address }">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
			            <input class="form-control input-sm" type='text' name="emailid" value="${user.emailid }">@
			            <input class="form-control input-sm" type='text' name="email_dns" value="${user.emailaddr }">
			              <select class="form-control input-sm" name="emailaddr" style="height: 30px;">
			                 <option value="">직접입력</option>
			                 <option value="daum.net">daum.net</option>
			                 <option value="empal.com">empal.com</option>
			                 <option value="gmail.com">gmail.com</option>
			                 <option value="hanmail.net">hanmail.net</option>
			                 <option value="msn.com">msn.com</option>
			                 <option value="naver.com">naver.com</option>
			                 <option value="nate.com">nate.com</option>
			              </select>
		            </td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input class="btn btn-secondary " type="button" value="회원수정" onclick="update(this.form)">
					<input class="btn btn-secondary " type="button" value="취소" onclick="javascript:location.href='mypage.do'">
					<input class="btn btn-basic " type="button" value="회원탈퇴" onclick="deleteUser(this.form)">
					</td>
				</tr>
			</table>
		</form>
		</div><!-- col -->
	</div><!-- row -->
	</div>
	</section>
	
	<!-- footer -->
      <section class="action-sec">
		<div class="container">
			<div style="width:100%; float:none; padding :10px">
					<table>
						<tr>
							<td>
							비트티켓  서울시 서초구 서초동 1327-15 비트아카데미빌딩｜ 사업자등록번호 : 214-85-24928
							<br>
							(주)비트티켓 서초지점 대표이사 : 조효정     /  문의 : 02-3486-9600  / 팩스 : 02-6007-1245
							<br>
		   					 통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 안수진
		   					 <br>
						    Copyright (c) 비트예매 All rights reserved.
		   					</td>
						</tr>
					</table>
			</div>
		</div>
      </section>
</body>
</html>
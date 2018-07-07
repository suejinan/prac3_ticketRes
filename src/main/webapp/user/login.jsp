<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>로그인</title>
<script>
	<c:if test="${errorMSg != null }">
		alert('${errorMSg }');
	</c:if>
	
	function inputCheck() {
		var f = document.loginform;
		if (f.id.value == "") {
			alert("아이디를 입력하세요.");
			f.id.value = "";
			f.id.focus();
			return false;
		} else if (f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			f.password.value = "";
			f.password.focus();
			return false;
		}
		return true;
	}

</script>
</head>
<body>
	<!-- header -->
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
					<a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a> <a href="#" class="nav-link">${sessionScope.userId}님 환영합니다.
					<img class="img-fluid rounded-circle" src="../resources/img/man.png" style="margin: 10px;"></a> 
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
			        <li class="nav-item active"> <a class="nav-link" href="main.jsp">Home <span class="sr-only">(current)</span></a> </li>
			        <li class="nav-item"> <a class="nav-link" href="product/product_list.do">PLAY</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="hyoboard/getNBoardList.do">NOTICE</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="Review/getReviewList.do">REVIEW</a> </li>
			        <li class="nav-item"> <a class="nav-link" href="QnA/getBoardList.do">Q&A</a> </li>
			        <c:if test="${sessionScope.userId == 'manager' }">
						<li class="nav-item"> <a class="nav-link" style="color: red" href="../Manager/pageManager.jsp">MANAGER</a> </li>
					</c:if>
				</ul>
		    </div>
		</div>
	</nav>
	</section>
	</div>
	
	<section class="section-01">
	<div class="container" style="min-height:570px">
		<div class="row">
		<div class="col">
			<form action="login.do" name="loginform" method="post" onsubmit="return inputCheck();">
			<table class="table" style="width: 400px; margin: 0 auto">
				<tr>
					<td>
						<h3>LOGIN</h3>
						<span style="font-size: 12px; color: gray;">If you have already registered with us, then sign in here.</span>
					</td>
				</tr>
				<tr>
					<td style="width: 250px"><input class="form-control input" type="text" name="id" placeholder="ID"></td>
				</tr>
				<tr>
					<td><input class="form-control input" type="password" name="password" placeholder="PW"></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<input class="btn btn-secondary btn-block" type="submit" value="LOGIN" style="height: 40px">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<br>
					<span style="font-size: 12px;">아직 회원이 아니십니까?<br>
					회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="vertical-align: middle;">
						<a class="btn btn-secondary btn-block"  href="joinForm.do"  style="height: 40px;">JOIN US</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
		</div><!-- row -->
	</div><!-- container -->
	</section>
	
	
	<!-- footer -->
	<div>
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
	</div>
	
</body>
</body>
</html>
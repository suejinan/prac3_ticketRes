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

<title>위시리스트</title>
<style>
</style>
<script>
	function buy(frm) {
		alert("예매 페이지로 이동");
	}
	
	function deleteWish(frm) {
		var isDelete = confirm("찜목록에서 삭제하시겠습니까?");
		if (isDelete) {
			frm.action= "deleteWish.do?";
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
		<h2 style="margin: 20px;">마이위시<span style="color: red;">♡ </span><span style="color: lightgray; font-size: 24px;">| MYPAGE</span></h2>
			<c:choose>
			<c:when test="${empty wishList }">
				<table class="table">
				<tr>
					<td colspan="5" style="text-align: center; min-height: 300px; ">
						<p>위시리스트가 없습니다.</p>
						<p>플레이차트 공연포스터에서 ♥를 눌러</p>
						<p>위시공연을 추가해보세요!</p>
					</td>
				</tr>
				<tr>
					<td><a class="btn btn-secondary" href="product/product_list.do">공연차트 ☞</a></td>
				</tr>
			</table>
			</c:when>
			<c:otherwise>
				<c:forEach var="wish" items="${wishList }">
				<div class="col-md-6 card">
				<form method="post">
					<table class="table" style="max-width: 500px;">
						<tr>
							<td colspan="2"><img src="resources/img/${wish.file_name}" style="width: 200px;"></td>
						</tr>
						<tr>
							<td colspan="2">${wish.title }</td>
						</tr>
						<tr>
							<td><input class="btn btn-secondary"  type="button" value="예매하기" onClick="buy(this.form)"></td>
							<td><input class="btn btn-outline-danger btn-xs" type="button" value="ⅹ" onClick="deleteWish(this.form)"></td>
							<td><input type="hidden" name=w_idx value="${wish.w_idx }"></td>
						</tr>
					</table>
				</form>
				</div>
				</c:forEach>
			</c:otherwise>
			</c:choose>				
		</div>
		</div>
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
      
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
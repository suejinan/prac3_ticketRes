<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<!-- 부트스트랩, 제이쿼리 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 스타일 -->
<link rel="stylesheet" href="../style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>후기 게시판</title>
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
			        <a href ="../loginForm.do">LOGIN </a>
			        <a href ="../joinForm.do"> JOIN US </a>
				</c:if>
				<c:if test="${sessionScope.userId != null }">
					<a href ="../logout.do"> LOGOUT </a>
					<a href ="../mypage.do"> MYPAGE</a>
					<a href="#" class="nav-link"><span class="ping"></span><i class="fa fa-envelope-o"></i></a> 
					<a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a> <a href="#" class="nav-link">${sessionScope.userId}님 환영합니다.
					<img class="img-fluid rounded-circle" src="../resources/img/main_img/man.png" style="margin: 10px; "></a> 
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
				        <li class="nav-item"> <a class="nav-link" href="../main.jsp">Home <span class="sr-only">(current)</span></a> </li>
				        <li class="nav-item"> <a class="nav-link" href="../product/product_list.do">PLAY</a> </li>
				        <li class="nav-item"> <a class="nav-link" href="../hyoboard/getNBoardList.do">NOTICE</a> </li>
				        <li class="nav-item active"> <a class="nav-link" href="../Review/getReviewList.do">REVIEW</a> </li>
				        <li class="nav-item"> <a class="nav-link" href="../QnA/getBoardList.do">Q&A</a> </li>
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
	<div class="container" style="min-height: 570px;">
	<div class="row">
		<div class="col">
		<!-- 검색 기능 -->
			<h2 style="margin: 20px;">후기 게시판</h2>
			<form class="form-inline" action="getReviewList.do" method="post">
			<table class="table" style="margin: 10px;">
				<tr>
					<td style="text-align: right;">
						<select class="form-control input" name="searchCondition" style="height: 35px;">
						<c:forEach var="option" items="${conditionMap}">
							<option value="${option.value }">${option.key }
						</c:forEach>
						</select>
						<input class="form-control" type="text" name="searchKeyword" width="400"  height="50;">
						<input class="btn btn-secondary" type="submit" value="검색">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
		<!-- 데이타 표시 -->
		<table class="table table-striped">
			<tr>
				<th width="100" style="text-align: left;">번호</tg>
				<th width="300" style="text-align: left;">제목</th>
				<th width="150" style="text-align: left;">작성자</th>
				<th width="150" style="text-align: left;">연극</th>
				<th width="100" style="text-align: left;">등록일</th>
				<th width="100" style="text-align: left;">조회수</th>
			</tr>
			<c:choose>
			<c:when test="${empty reviewList }">
			<tr>
				<td colspan="6" style="text-align: center;">
					<h3 style="text-align: center;">현재 등록된 게시물이 없습니다.</h3>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="r" items="${reviewList }">
			<tr>
				<td class="center">${r.r_idx }</td>
				<td>
					<a href="getReview.do?r_idx=${r.r_idx }">
						${r.r_title }
					</a>
				</td>
				<td>${r.id }</td>
				<td>${r.title }</td>
				<td>${r.regdate }</td>
				<td>${r.hit }</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			<c:if test="${sessionScope.userId != null }">
			<br>
			<tr>
		        <td colspan="6" style="text-align: right;">
		        	<a class="btn btn-secondary" href="../buylist.do">내가 본 연극 후기 작성하기</a>
		        </td>
			</tr>
			</c:if>
		</table>
		</div>
	</div>
	</div><!-- container -->
	</section>
	
	<br>

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
</html>
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

<title>예매내역</title>
<style>
</style>
<script>
	function deleteBuy(frm) {
		var isDelete = confirm("내가본공연 목록에서 삭제하시겠습니까?");
		if (isDelete) {
			frm.action= "deleteBuy.do";
			frm.submit();
		} else {
			return;
		}
	}
	
	function insertReview(frm) {
		frm.action= "Review/insertForm.do";
		frm.submit();
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
					<img class="img-fluid rounded-circle" src="resources/img/main_img/man.png" style="margin: 10px; "></a> 
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
			<h2 style="margin: 20px;">예매내역 <span style="color: lightgray; font-size: 24px;">| MYPAGE</span></h2>
			<c:choose>
			<c:when test="${empty buyList }">
			<table class="table">
				<tr>
					<td colspan="5" style="text-align: center; min-height: 300px; ">
						<p>예매정보가 없습니다.</p>
						<p>플레이차트에서 마음에 드는 공연을 예매해</p>
						<p>즐거운 관람을 해보세요!</p>
					</td>
				</tr>
				<tr>
					<td><a class="btn btn-secondary" href="product/product_list.do">공연차트 ☞</a></td>
				</tr>
			</table>
			</c:when>
			<c:otherwise>
				<c:forEach var="b" items="${buyList }">
				<div class="col-md-6 card">
				<form method="get">
					<table class="table" style="max-width: 500px;">
						<tr>
							<td rowspan="4">
								<c:if test="${empty b.file_name }">
									이미지 없음
								</c:if>
								<c:if test="${! empty b.file_name }">
									<img src="resources/img/${b.file_name}" style="width: 200px;">
								</c:if>
							</td>
							<td>${b.title } <input class="btn btn-outline-danger btn-xs" type="button" value="X" onClick="deleteBuy(this.form)"></td>
						</tr>
						<tr>
							<td>${b.category }</td>
						</tr>
						<tr>
							<td>${b.play_date } ${b.time }</td>
						</tr>
						<tr>
							<td>${b.buy_quantity }매</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input class="btn btn-secondary" type="button" value="후기작성하기" onClick="insertReview(this.form)"></td>
						</tr>
						<tr>
							<td><input type="hidden" name=play_id value="${b.play_id }"></td>
							<td><input type="hidden" name=title value="${b.title }"></td>
							<td><input type="hidden" name=b_idx value="${b.b_idx }"></td>
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
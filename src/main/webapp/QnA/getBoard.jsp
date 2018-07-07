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
<link rel="stylesheet" href="../style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 상세보기</title>
<script>
	function updateBoard(frm) {
	    var isDelete = confirm("수정 하시겠습니까?");
	    if (isDelete) {
	       frm.action= "updateBoard.jsp";
	       frm.submit();
	    } else {
	       return;
	    }
	 }

	function deleteBoard(frm) {
	    var isDelete = confirm("삭제 하시겠습니까?");
	    if (isDelete) {
	       frm.action= "deleteBoard.do";
	       frm.submit();
	    } else {
	       return;
	    }
	}

	function deleteComm(frm) {
	    var isDelete = confirm("삭제 하시겠습니까?");
	    if (isDelete) {
	       frm.action= "deleteComm.do";
	       frm.submit();
	    } else {
	       return;
	    }
	 }
	
	function insertComm(frm) {
		var isDelete = confirm("등록 하시겠습니까?");
	    if (isDelete) {
	       frm.action= "insertComm.do";
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
		        <a href ="../loginForm.do">LOGIN </a>
		        <a href ="../joinForm.do"> JOIN US </a>
				</c:if>
				<c:if test="${sessionScope.userId != null }">
					<a href ="../logout.do"> LOGOUT </a>
					<a href ="../mypage.do"> MYPAGE</a>
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
		        <li class="nav-item active"> <a class="nav-link" href="../main.jsp">Home <span class="sr-only">(current)</span></a> </li>
		        <li class="nav-item"> <a class="nav-link" href="../product/product_list.do">PLAY</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="../hyoboard/getNBoardList.do">NOTICE</a> </li>
		        <li class="nav-item"> <a class="nav-link" href="../Review/getReviewList.do">REVIEW</a> </li>
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

<div>
	<hr>
	<form method="post">
	<div class="container">
	<table class="table table-bordered">
		<h4>Q&A</h4>
		<tr>
			<th width="70">제목</th>
			<td>${board.q_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.id }</td>
		</tr>
		 <tr>
			<th>내용</th>
			<td colspan="2" style="min-height:180px;">
				<pre>${board.q_content}</pre>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${board.regdate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.hit }</td>
		</tr>
	</table>
		<hr>
        <c:if test="${sessionScope.userId eq board.id }">
		<input class="btn btn-secondary" type="button" value="수정" onclick="updateBoard(this.form)">
		<input class="btn btn-secondary" type="button" value="삭제" onclick="deleteBoard(this.form)">
        </c:if>
		<input class="btn btn-secondary" type="button" value="목록" onclick="javascript:location.href='getBoardList.jsp'">
		<input type="hidden" name="q_idx" value="${board.q_idx}">
	</div>
	</form>

	<div style="height: 20px;"></div>
	<%-- 댓글 창 --%>
	<div>
	<c:forEach var="c" items="${commList }">
	<form method="POST">
	<div class="container">
	<table class="table table-bordered">
		<tr>
			<td>${c.id }</td>
			<td>${c.regdate }</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="3">${c.c_content }</td>
			<td><input class="btn btn-secondary" type="button" value="삭제" onclick="deleteComm(this.form)"></td>
		</tr>
	</table>
	</div>
		<input type="hidden" name="c_idx" value="${c.c_idx }">
		<input type="hidden" name="q_idx" value="${c.q_idx }">
	</form>
	</c:forEach>
	</div>
	
	<%-- 댓글입력 --%>
	<c:if test="${sessionScope.userId == 'manager' }">
	<div>
	<hr>
	<form method="POST">
	<div class="container">
	<table class="table table-bordered">
		<tr>
			<td colspan="2">
				<input type="text" name="id" value="${c.id }">
			</td>
		</tr>
		<tr>
			<td><textarea name="c_content" rows="4" cols="90"></textarea></td>
		</tr>	
		<tr>
			<td><input class="btn btn-secondary" type="button" value="등록" onclick="insertComm(this.form)"></td>
		</tr>
	</table>
		<input type="hidden" name="q_idx" value="${board.q_idx}">
	</div>
	</form>
	<hr>
	</div>
	</c:if>
	
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
</div>
</body>
</html>
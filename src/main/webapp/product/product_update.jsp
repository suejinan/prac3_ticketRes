<%@ page import="com.spring.tic.product_board.impl.ProductDAO"%>
<%@ page import="com.spring.tic.product_board.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
<!-- 상영날짜 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 상영시간 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
<script src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
<meta charset="UTF-8">
<title>상품 상세</title>
<style>
	#container-table {width:800px;margin:auto;padding:50px 0;}
	.table-responsive {width:800px; margin:auto;}
</style>
<script>
    $(function() { 
		//상영날짜
        $("#datepicker").datepicker({
            dateFormat: 'yy.mm.dd'
        });
		
		//상영시간
        $('.timepicker').timepicker();
    });

    function sendData() { //입력한 데이터 저장하기
    	if (document.frm.category.value == "") {
			alert("공연의 카테고리를 입력하세요");
			return;
		} else if (document.frm.title.value == "") {
			alert("공연의 제목을 입력하세요.");
			document.frm.title.focus();
			return ;
		} else if (document.frm.p_id.value == "") {
			alert("파트너 아이디를 입력하세요.");
			document.frm.p_id.focus();
			return ;
		}  else if (document.frm.time.value == "") {
			alert("상영시간를 입력하세요.");
			document.frm.time.focus();
			return ;
		} else if (document.frm.price.value == "") {
			alert("가격을 입력하세요.");
			document.frm.price.focus();
			return ;
		} else if (document.frm.seat_max.value == "") {
			alert("총좌석을 입력하세요.");
			document.frm.seat_max.focus();
			return ;
		} else if (document.frm.seat_rest.value == "") {
			alert("잔여좌석을 입력하세요.");
			document.frm.seat_rest.focus();
			return ;
		} else if (document.frm.content.value == "") {
			alert("내용을 입력하세요.");
			document.frm.content.focus();
			return ;
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
							<a href="#" class="nav-link"><span class="ping"></span><i class="fa fa-envelope-o"></i></a> 
							<a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a> <a href="#" class="nav-link">${sessionScope.userId}님 환영합니다.
							<img class="img-fluid rounded-circle" src="../resources/img/main_img/man.png"  style="margin: 10px;"></a> 
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
				        <li class="nav-item"> <a class="nav-link" href="../main/main.jsp">Home <span class="sr-only">(current)</span></a> </li>
				        <li class="nav-item active"> <a class="nav-link" href="../product/product_list.do">PLAY</a> </li>
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
	<div id="container-table">
		<form action="product_update.do" method="post" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="play_id" value="${product.play_id }">
			<div class="table-responsive">
			<h2>[상품 수정]</h2>
			<hr>
			<table>
				<tr>
					<th>상품번호</th>
					<td>${product.play_id }</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td class="catelist">
						연극<input type="radio" name="category" value="연극">
						뮤지컬<input type="radio" name="category" value="뮤지컬">
						가족·아동·체험전<input type="radio" name="category" value="가족·아동·체험전">
						콘서트·무용·연주<input type="radio" name="category" value="콘서트·무용·연주">
						개그·전통·기타<input type="radio" name="category" value="개그·전통·기타">
					</td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td>
						<img src="../resources/img/${product.file_name }"
								 height="300px" width="210px"><br>
		                <input value="${product.file_name }" disabled="disabled">
		                <input type="file" name="uploadFile" value="${product.file_name }">
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="title" value="${product.title }"></td>
				</tr>
				<tr>
					<th>파트너 아이디</th>
					<td><input type="text" name="p_id" value="${product.p_id }"></td>
				</tr>
				
				<tr>
					<th>상영 날짜</th>
					<td><input type="text" id="datepicker" name="play_date" value="${product.play_date }"></td>
				</tr>
				
				<tr>
					<th>상영 시간</th>
					<td><input type="text" class="timepicker" name="time" value="${product.time }"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="${product.price }"></td>
				</tr>
				<tr>
					<th>총 좌석</th>
					<td><input type="text" name="seat_max" value="${product.seat_max }"></td>
				</tr>
				<tr>
					<th>잔여 좌석</th>
					<td><input type="text" name="seat_rest" value="${product.seat_rest }"></td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea name="content" rows="5" cols="80">${product.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<hr>
						<input type="submit" value="수정" onclick="sendData()" class="btn btn-secondary" >
						<a class="btn btn-secondary" href="product_delete.do?play_id=${product.play_id }">삭제</a>
						<a class="btn btn-secondary" href="product_list.do?category=${product.category }">목록</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
	</div>
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
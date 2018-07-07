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
<!-- ScrollSpy -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- NAVER Map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=99XO67wcDMlDKqGZAmv0&submodules=geocoder"></script>
<meta charset="UTF-8">
<title>상품 상세</title>
<style>
   #container-table, #container-fluid {width:800px;margin:auto;}
   .table-responsive {height:450px;width:800px; margin:auto;}
   .container-fluid {padding-bottom:30px;height:auto;width:800px;}
   .navlist {width:100%;height:50px;}
   .navlist th {text-align:center; background-color:#f9f9f9;}
   .navlist th:hover {background-color: gray;}
</style>
<script>
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
                    <li class="nav-item"> <a class="nav-link" href="../main.jsp">Home <span class="sr-only">(current)</span></a> </li>
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
      <form method="post" name="frm" enctype="multipart/form-data" action="buyticket.do">
      <input type="hidden" name="play_id" value="${product.play_id }">
         <div class="table-responsive">
         <h2>[ ${product.category} ] <a>${product.title }</a></h2>
         <table class="table">
         
            <tr>
               <th rowspan="6">
                  <img src="../resources/img/${product.file_name }" 
                        height="300px" width="210px"><br>
               </th>
               
               <td>가격 : <fmt:formatNumber value="${product.price }" pattern="#,###.##"/></td>
            </tr>
            <tr>
               <td>장소 : ${product.address }</td>
            </tr>
            <tr>
               <td>문의 : ${product.partner_name} ☎  ${product.phone }</td>
            </tr>
            <tr>
               <td>공연날짜 : ${product.play_date }</td>
            </tr>
            <tr>
               <td>공연시간 : ${product.time }</td>
            </tr>
            <tr>
               <th colspan="2"><input type="submit" value="예매하기"></th>
            </tr>
         </table>
         </div>
      </form>
      <c:if test="${sessionScope.userId == 'manager' }">
      <hr>
      <p>
         <a class="btn btn-secondary" href="product_updateForm.do?play_id=${product.play_id }">수정</a> 
         <a class="btn btn-secondary" href="product_delete.do?play_id=${product.play_id }">삭제</a> 
         <a class="btn btn-secondary" href="product_list.do?category=${product.category }">목록</a>
      </p>
      </c:if>
   </div> <!-- container -->
   <nav>
      <div id="container-fluid">
         <div>
            <hr>
            <div class="collapse navbar-collapse" id="myNavbar">
               <table class="navlist">
                  <th><a href="#section1">상세정보</a></th>
                  <th><a href="#section2">공연장 위치안내</a></th>
                  <th><a href="#section3">티켓수령, 좌석안내</a></th>
                  <th><a href="#section4">취소, 변경 안내</a></th>
               </table>
            </div> <!-- myNavbar -->
            <hr>
         </div>
      </div> <!-- container-fluid -->
   </nav>
   <div id="section1" class="container-fluid">
      <h2>상세정보</h2>
      <p>${product.content }</p>
   </div>
   <div id="section2" class="container-fluid">
      <hr>
      <h2>공연장 위치안내</h2>
      <p></p>
      <div id="map" style="width:100%;height:400px;"></div>
       <script>
         var map = new naver.maps.Map('map');
         var myaddress = '${product.address }';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
         naver.maps.Service.geocode({address: myaddress}, function(status, response) {
             if (status !== naver.maps.Service.Status.OK) {
                 return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
             }
             var result = response.result;
             // 검색 결과 갯수: result.total
             // 첫번째 결과 결과 주소: result.items[0].address
             // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
             var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
             map.setCenter(myaddr); // 검색된 좌표로 지도 이동
             // 마커 표시
             var marker = new naver.maps.Marker({
               position: myaddr,
               map: map
             });
             // 마커 클릭 이벤트 처리
             naver.maps.Event.addListener(marker, "click", function(e) {
               if (infowindow.getMap()) {
                   infowindow.close();
               } else {
                   infowindow.open(map, marker);
               }
             });
             // 마크 클릭시 인포윈도우 오픈
             var infowindow = new naver.maps.InfoWindow({
                 content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
             });
         });
         </script>
   </div>
   <div id="section3" class="container-fluid">
      <hr>
      <h2>티켓수령, 좌석안내</h2>
      <p>
      ▶ 티켓수령방법 : 현장에서 티켓배부
      메세나티켓에서 예매한 티켓은 관람당일 공연장 입구 매표소에서(공연시작 30분전까지)
      메세나티켓 예매자라고 말씀하시면 티켓을 받으실 수 있습니다.
      예매번호와 신분증을 확인하니 예매시 보내드린 문자와 신분증을 챙겨주세세요!
      ▶ 티켓박스 : 공연시작 1시간전 오픈
      
      ▶ 좌석배치방법 : 예매순 선착순으로 좌석지정
      앞쪽부터 사이드 뒤쪽으로 퍼져가는 방식입니다.
      관람당일 공연장 매표소에서 티켓배부시 좌석이 정해지며 좀 더 자세한 사항은
      공연사로 문의하시면 자세히 안내 받을 수 있습니다.
      
      ▶ 공연문의 : 주식회사 이엘프러스 ☎ 02-6403-7117
      </p>
   </div>
   <div id="section4" class="container-fluid">
      <hr>
      <h2>취소, 변경안내</h2>
      <p>
      ▶ 공연 취소, 변경/ 환불안내 : 2010년 공정거래위원회 전자상거래 기준안 - 공연
      메세나티켓에서 예매하신 티켓은 지정된 관람일 전일 오후 5시까지 환불이 가능합니다.
      환불시 환불일자에 따라 환불 공제수수료가 있으며 공제 수수료율은 아래와 같습니다.
      [공연의 환불 공제수수료]
      ·공연일 7일 전까지 : 예매수수료를 제외한 티켓 대금의 10%
      ·공연일 6일~3일 전까지 : 예매수수료를 제외한 티켓대금의 20%
      ·공연일 2일~1일 전 오후 5시까지 : 예매수수료를 제외한 티켓대금의 30%
      ·공연 예매한 당일에는 공제수수료 없이 취소 가능, 관람 당일(공연일 당일) 예매는 취소 불가
      ·환불처리는 매주 수요일 오후 6시 이후에 일괄적으로 환불됩니다.
      ▶ 예매티켓 취소방법
      메세나티켓 홈페이지 상단의 [취소,변경] 메뉴를 클릭하시면 취소신청을 하실 수 있습니다.
      취소신청은 관람 1일전 오후 5시까지만 가능합니다.
      ▶ 예매티켓 변경(관람일) 방법
      예매티켓의 관람일을 변경하기 위해서는 해당 예매건 취소 후 다시 예매를 해야 합니다.
      홈페이지 상단의 [취소,변경] 메뉴를 클릭하시면 취소신청을 하실 수 있습니다.
      취소신청은 관람 1일전 오후 5시까지만 가능합니다.
      ▶ 예매티켓 변경(관람인원 - 부분 예매취소) 방법
      예매티켓의 관람인원 - 부분 예매취소는 홈페이지 상단의 [취소,변경] 메뉴를 클릭하시면 취소신청을 하실 수 있습니다.
      취소신청은 관람 1일전 오후 5시까지만 가능합니다.
      </p>
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
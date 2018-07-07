<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
   span {color:red; font-size: 8px; margin-left: 8px;}
</style>
</head>
<body onload="init();">
<script>
var sell_price;
var amount;

function init () {
   sell_price = document.form.sell_price.value;
   amount = document.form.amount.value;
   document.form.sum.value = sell_price;
   change();
}

function add () {
   hm = document.form.amount;
   sum = document.form.sum;
      if(hm.value < 10){
         hm.value ++ ;
         sum.value = parseInt(hm.value) * sell_price;      
      } 
      
   }


function del () {
   hm = document.form.amount;
   sum = document.form.sum;
      if (hm.value > 1) {
         hm.value -- ;
         sum.value = parseInt(hm.value) * sell_price;
      }
}

function change () {
   hm = document.form.amount;
   sum = document.form.sum;

      if (hm.value < 0) {
         hm.value = 0;
      }
      sum.value = parseInt(hm.value) * sell_price;         
}  

<!--
   function calc(){
      var amount = document.form.amount.value;
      var price = document.form.price.value;
      
      if(amount!=""&&price!=""){
         document.form.sum.value= amount*price;
      } else {
         document.form.sum.value="";
      }
      
   }
-->
      
</script>

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

   <div class="container">
   <form name="form" method="post">
   <table class="table">
      <tr>
      <th>연극제목</th>
         <td>${product.title}</td>
      </tr>
      <tr>
         <th>가격</th>
         <td>
         <input type="text" name="sell_price" value="${product.price}" readonly="readonly" style="border:none"> 
         
         </td>
      </tr>
      
      

      <hr>
      <h2>주문자 정보</h2>
      <tr>
         <th>예매자 ID</th>
         <td><input type="text" name="id" value="${sessionScope.userId}" readonly="readonly"> </td>
      </tr>
      <tr>
         <th>수령자 이름 </th>
         <td><input type="text" name="name"></td>
      </tr>
      <tr>
         <th>수령자 핸드폰 번호 </th>
         <td><input type="text" name="phone"></td>
      </tr>
      <tr>
         <th>수령방법 선택</th>
         <td><input type="radio" name="send" value="place">현장&nbsp;&nbsp;
            <input type="radio" name="send" value="mail">우편
         </td>
      </tr>
      <tr>
         <th>수량<span>10장 이상 예매를 원하시는 분은 관리자에게 따로 문의주세요</span></th>
         <td>
            
            <input type="text" name="amount" value="1" onchange="change();">
            <input type="button" value=" + " onclick="add();">
            <input type="button" value=" - " onclick="del();"><br>
         </td>
      </tr>
      <tr>
         <th>합계</th>
         <td>
         <input type="text" name="sum" size="11" readonly="readonly">
         </td>
      </tr>
      <tr>
         <td>
            <input type="button" value="예매하기">
         <td>
      </tr>
   </table>
   </form>
   <hr>
   <p>      
      <a href="../main.jsp">홈</a>&nbsp;&nbsp;
      <a href="product_list.do">목록으로</a>
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
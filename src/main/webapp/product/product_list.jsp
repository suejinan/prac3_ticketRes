<%@ page import="com.spring.tic.product_board.impl.ProductDAO"%>
<%@ page import="com.spring.tic.product_board.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
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
<style>
   .title-small {
         text-align: left;
         white-space: nowrap;
         overflow: hidden;
       text-overflow: ellipsis; 
   }
   .card-text {
         text-align: left;
         white-space: nowrap;
         overflow: hidden;
       text-overflow: ellipsis; 
   }
   .cata a{ padding:5px;}
</style>
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
   
   <section class="section-01">
   <div class="container">
      <div class="row">
         <div class="col">
           <h3 class="heading-large">공연정보</h3>
              <div class="cata" style="display: inline-block;">
                 <a href="../product/product_list.do">모아보기</a>
                 <a href="product_list_category.do?category=연극">연극</a>
                 <a href="product_list_category.do?category=뮤지컬">뮤지컬</a>
                 <a href="product_list_category.do?category=가족, 아동, 체험전">가족·아동·체험전</a>
                 <a href="product_list_category.do?category=개그, 전통, 기타">개그·전통·기타</a>
                 <c:if test="${sessionScope.userId == 'manager' }">
                  <a class="btn btn-secondary" href="product_insert.jsp">새 공연 등록</a>
                 </c:if>
              </div>
              <div style="display: inline-block;float:right;">
                 <!-- 검색을 위한 폼 -->
                   <form action="product_list.do" method="post">
                   <table >
                        <tr>
                             <td>
                                <select class="form-control input" name="searchCondition">
                                   <c:forEach var="option" items="${conditionMap }">
                                      <option value="${option.value }">${option.key }
                                   </c:forEach>
                                </select>
                             </td>
                             <td>
                                <input class="form-control" type="text" name="searchKeyword">
                             </td>
                             <td>
                                <input class="btn btn-secondary" type="submit" value="검색">
                             </td>
                        </tr>
                   </table>
                   </form>
              </div>
              <hr>
              <div class="list">
                 <c:choose>
                     <c:when test="${empty product_list }">
                               <h4>현재 등록된 공연이 없습니다.</h4>
                     </c:when>
                  <c:otherwise>
                  <c:forEach var="product" items="${product_list }">
               <div class="col-lg-4 col-md-6 card">
                     <div class="card">
                        <img class="img-fluid img-thumbnail" src="../resources/img/${product.file_name }" alt="">
                          <div class="card-body">
                            <div class="card-title">
                                 <h3 class=" title-small">
                                    <a href="product_view.do?play_id=${product.play_id }">${product.title }</a>
                                 </h3>
                              </div>
                         <p class="card-text">${product.content }</p>
                          </div>
                  </div>
               </div>
               </c:forEach>
               </c:otherwise>
               </c:choose>
            </div><!-- list -->
            </div><!-- col -->
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
</html>
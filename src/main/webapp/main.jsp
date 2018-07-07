<%@page import="com.spring.tic.qna_board.QnABoardVO"%>
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

    <title>비트 티켓</title>
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
					<a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a>
					${sessionScope.userId}님 환영합니다.<img class="img-fluid rounded-circle" src="resources/img/main_img/man.png" style="margin: 10px;">
				</c:if>
				</nav>
			</div>
		</div>
	</div>
</div>

<section class="top-nav">
<nav class="navbar navbar-expand-lg py-0">
	<div class="container">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
	    <div class="collapse navbar-collapse" id="exCollapsingNavbar2">
			<ul class="nav navbar-nav">
		        <li class="nav-item active"><a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a></li>
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
<section class="banner-sec">
        <div class="container">
    <div class="row">
            <div class="col-md-3">
        <div class="card"> <img class="img-fluid" src="resources/img/main_img/4.jpg" alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:green">new</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">ORIGIN(오리진)</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
        <div class="card"> <img class="img-fluid" src="resources/img/main_img/2.jpg" alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:green">new</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">김종욱 찾기</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
      </div>
            <div class="col-md-3">
        <div class="card"> <img class="img-fluid" src="resources/img/main_img/3.jpg" alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:green">new</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">사랑을 할래</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
        <div class="card"> <img class="img-fluid" src="resources/img/main_img/1.jpg" alt="">
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:green">new</span> </div>
                <div class="card-body">
            <div class="news-title">
                    <h2 class=" title-small"><a href="#">루나틱</a></h2>
                  </div>
            <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
          </div>
              </div>
      </div>
            <div class="col-md-6 top-slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> 
                <!-- Indicators -->
                <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
                
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src="resources/img/main_img/5.jpg" alt=""></div>
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:red">hot</span></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">[스릴러공포] 서툰살인</a></h2>
                      </div>
                <div class="news-des">전국관객 100만명 돌파 무서운 흥행 돌풍의 주역! 호러연극 두여자 제작진의 명품 스릴러! 충격실화를 모티브로...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src="resources/img/main_img/6.jpg" alt=""></div>
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:red">hot</span></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">[로맨틱코미디] 작업의 정석</a></h2>
                      </div>
                <div class="news-des">100만 관객이 선택한 No.1 로맨틱 코미디! 작업의 정석 시리즈의 완결편! 로맨틱 코미디의 절대 강자! 인터파크 ...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                <div class="news-media"><img class="img-fluid" src="resources/img/main_img/7.jpg" alt=""></div>
                <div class="card-img-overlay"> <span class="badge badge-pill badge-danger" style="background-color:red">hot</span></div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="#">[감성드라마] 숨비소리 (sumbeesori)</a></h2>
                      </div>
                <div class="news-des">한 여자 노인의 찰라의 기억이 무엇을 의미하는지, 한 여인의 숨비소리를 들어보자! 아름다운 영혼으로 ...</div>
                <div class="time-text"><strong>2h ago</strong></div>
                <div></div>
              </div>
                  </div>
          </div>
              </div>
      </div>
          </div>
  </div>
      </section>
      
<section class="section-01">
	<div class="container">
	<div class="row">
            <div class="col-lg-8 col-md-12">
        <h3 class="heading-large">BEST</h3>
        <div class="">
                <div class="col-lg-6 card">
            <div class="card"> <img class="img-fluid" src="resources/img/main_img/8.jpg" alt="">
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small" style="font-size: 18px">S다이어리</h2>
                  </a></div>
                <p class="card-text">대한민국 커플 공감 200% 아슬아슬 응큼 코미디! 화끈한 웃음! Big 재미! 대학로 스테디 ..</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card"> <img class="img-fluid" src="resources/img/main_img/9.jpg" alt="">
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small" style="font-size: 18px">당신이 주인공</h2>
                  </a></div>
                <p class="card-text">세계최초 관객이 진짜 주인공이 되는 공연! 객석에 앉는 순간 당신의 무대가 시작된다!</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card"> <img class="img-fluid" src="resources/img/main_img/10.jpg" alt="">
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class=" title-small" style="font-size: 18px">행오버 : 게임의시작</h2>
                  </a></div>
                <p class="card-text">골때리는 사람들과 507호에서 만났다. 반전을 거듭하는 '코믹추리스릴러' 쏟아지는 찬사!</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
                <div class="col-lg-6 card">
            <div class="card"> <img class="img-fluid" src="resources/img/main_img/11.jpg" alt="">
                    <div class="card-body">
                <div class="news-title"><a href="#">
                  <h2 class="title-small" style="font-size: 18px">와일드패밀리</h2>
                  </a></div>
                <p class="card-text">찾아라, 캐내라! 추적 코미디 연극! 숨죽이다 터지는 웃음, 지금껏 보지 못한 반전의 코미디!</p>
                <p class="card-text"><small class="text-time"><em>3 mins ago</em></small></p>
              </div>
                  </div>
          </div>
              </div>
      </div>
            <aside class="col-lg-4 side-bar col-md-12">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">notice</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">review</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab">QnA</a> </li>
			</ul>
        
        <!-- Tab panes -->

		<div class="tab-content sidebar-tabing" id="nav-tabContent">
			<div class="tab-pane active" id="home" role="tabpanel">
				<c:forEach var="n" items="${NboardList}">
					<div class="media"> <a href="#"></a>
						<div class="media-body">
							<div class="news-title"><h2 class="title-small"><a href="#">${n.n_title }</a></h2></div>
			              	<div class="news-auther"><span class="time">1h ago</span></div>
						</div>
					</div>
				</c:forEach>
			</div>
				
			<div class="tab-pane" id="profile" role="tabpanel">
				<c:forEach var="r" items="${reviewList}">
						<div class="media"> <a href="#"></a>
							<div class="media-body">
								<div class="news-title"><h2 class="title-small"><a href="#">${r.r_title }</a></h2></div>
								<div class="news-auther" style="color: red;"><span class="time">1h ago</span></div>
							</div>
						</div>
				</c:forEach>
			</div>
            
			<div class="tab-pane" id="messages" role="tabpanel">
				<c:forEach var="q" items="${boardList}">
			            <div class="media"> <a href="#"></a>
							<div class="media-body">
								<div class="news-title"><h2 class="title-small"><a href="/QnA/getBoardList.jsp">${q.q_title }</a></h2></div>
								<div class="news-auther"><span class="time">1h ago</span></div>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
				
        <div>
        <div style="height: 320px;"></div>
			<div style="text-align:center;">
				<hr>
				▼ 공연 등록안내<br>
				전화 010-6540-0207<br>
				메일 bitticket @ bit.com
				<div><a class="btn btn-success" href="http://www.mecenatticket.com/mecenatticket_request.doc" target="_blank">공연등록 의뢰서</a></div>
			</div>
		</div>
		</aside>
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
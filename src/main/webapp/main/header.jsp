<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style>
   #header {
   }
   
   #top {
      margin: 0 auto;
      padding: 5px 0;
      width: 100%;
   }

   .header_nav {
      width: 100%;
   }
   
   .header_nav ul li {
      float: left;
      padding: 0px;
      margin: 0 auto;
   }
   
   .header_nav ul li a {
      padding: 10px 20px;
      color: black;
   }
   
   .nav_bar_img {
      border: 1px;
      border-style: none solid;
   }
   
</style>
</head>
<body>
	<div id="header">
		<div id="top">
			<table>
				<tr>
					<td class="top_home"><a href="main.jsp">HOME</a></td>
					<td><a href="main.jsp"></a></td>
					<td>
						<div style="text-align:right;">
							<a>LOGIN |</a>
							<a>JOIN |</a>
							<a>MyPage |</a>
							<a>LOGOUT |</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="header_nav">
			<ul>
				<li>
					<a>연극</a>
				</li>		
				<li>
					<a>공지사항</a>
				</li>
				<li>
					<a>후기</a>
				</li>
				<li>
					<a href="../QnA/getBoardList.jsp">Q&A</a>
				</li>
				<!-- 관리자 페이지 -->	
				<li>
					<a href="../Manager/pageManager.jsp" style="color: red">관리자</a>
				</li>						
			</ul>
		</div>
		
	</div>
</body>
</html>
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
<title>아이디 중복확인</title>
<script>
	function useId(frm) { 
	    //opener <-여기서는 joinForm.jsp
	    //joinForm.jsp에서 중복검사를 누르면 여기로 오는데 나를 오픈한 사람이라는 뜻 

	    opener.document.getElementById("id").value = frm.searchId.value;
	    //opener.document.userinput.id.value = frm.searchId.value;
	                    // 자바스크립트 에서의 선택자 
	    self.close(); //나자신(중복확인 창)을 의미, 창을 닫겠다.
	}
	
	function formCheck() {
		var f = document.searchIdform;
		if (f.searchId.value == "") {
			alert("아이디를 입력하세요.");
			f.searchId.value = "";
			f.searchId.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<section class="section-01">
	<div class="container">
		<div class="row">
			<div class="col">
	        <p style="font-size: 12px">아이디는 영문(소문자), 숫자로 4~16자 이내로 입력해 주세요.</p>
		    <form class="form-inline" action="idSearch.do" name="searchIdform" method="post" onsubmit="return formCheck();">
		        <div class="form-group">
		        <input class="form-control input-sm" type="text" name="searchId" value="${searchId }" maxlength="16"> 
		        </div>&nbsp;
		        <div class="form-group">
		        <!-- 값을  줘서 다시 화면으로 돌아와도 입력했던값이 들어가 있도록 -->
		         <input class="btn btn-basic btn-sm" type="submit" value="중복확인">
		        </div>
		    	<br>
		    <!-- 검색 유무 확인 
		      어트리뷰트 안에 search 안쪽에 true와 false -->
			    <c:if test="${search }">
		        <!-- 검색 결과가 없을 경우  그 아이디 사용 가능 -->
			        <c:if test="${searchResult == null }">
			        	<table style="width: 100%">
			            <tr><td><p style="font-size: 12px; color: gray;">${searchId }는 사용할 수 있는 ID입니다.</p></td></tr>
			            <tr><td><p><input class="btn btn-secondary btn-block" type="button" value="사용하기" onclick="useId(this.form)"></p></td></tr> 
			        	</table>
			        </c:if>
			        <!-- 검색 결과가 있을 경우 그 아이디 사용 불가 -->
			        <c:if test="${searchResult != null }">
			        <table style="width: 100%">
			            <tr><td>
			            <p style="font-size: 12px; color: gray;">${searchId }는 이미 사용중인 아이디 입니다.</p>
			        	</td></tr>
			        </table>
			        </c:if>
			    </c:if>
		    </form>
			</div>
		</div><!-- row -->
	</div><!-- container -->
	</section>
</body>
</html>
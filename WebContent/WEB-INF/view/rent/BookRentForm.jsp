<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
	.butt {
	width: 80px;
	height: 20.5px;
}
body, html {
	width: 100%;
	height: 100%;
	background: #FFFFF8;
	color: #353535;
}

#Home {
	width: 75%;
	margin: 0 auto;
}

#null {
	height: 55px;
}

#header {
	width: 100%;
	height: 55px;
	border-bottom: 3px solid #510000;
	position: fixed;
	background: white;
}

#header img {
	margin: 5px;
	width: 100px;
}

#menu {
	width: 80%;
	margin: 0 auto;
	color: #cd853f;
	height: 55px;
	font-size: 14px;
}

#header a {
	color: #cd853f;
	text-decoration: none;
	text-align: center;
	font-size: 13px;
	padding: 5px;
}

#header a:HOVER {
	font-size: 16px;
	color: #751400;
}

#header #login {
	font-size: 15px;
	color: #cd853f;
	float: right;
}

#header #login:HOVER {
	font-size: 16px;
	color: #cd853f;
}

#header #insert {
	font-size: 15px;
	float: right;
}

#cont {
	clear: both;
}

#null {
	height: 57px;
}

#footer {
	border-top: 3px solid #510000;
	text-align: center;
	font-size: 15px;
	color: #6F6F6F;
	clear: both;
	background: white;
}

#footer ul {
	padding: 10px;
	margin: 10px;
	list-style: none;
}

#footer ul a {
	text-decoration: none;
	font-size: 14px;
	color: #6F6F6F;
}

#bookSearch {
	display: none;
}
#MemberSearch {
	display: none;
	width: 1024px;
	margin: 0 auto;
}
#form{
	width: 700px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 100px;
	margin-top: 20px;
}
section {
	width:100%;
	height:2000px;
	background-image: url("../images/8840e0124b9faa3ab8353e644ca325c8.png");
	background-size: 90% 100%;
	background-repeat: no-repeat;
	background-position: center center;
	padding-top: 350px;
}
#MemberSearch{
	width: 38%;
	margin: 0 auto;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#bookBtn").click(function() {
			$("#bookSearch").css("display","block");
			$("#MemberSearch").css("display","none");
		})
		$("#memBtn").click(function() {
			$("#MemberSearch").css("display","block");
			$("#bookSearch").css("display","none");
		})
	})
</script>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>

	<section>
	<div id="form">
	<form action="bookRent.do" method="post">
			<p>
				<label>회원 번호</label>
				<input type="text" name="memberNo" id="MemberNo">
				<input type="button" value="회원 검색" class="butt" id="memBtn">
			</p>
			<p>
				<label>도서 코드</label>
				<input type="text" name="bookCode" id="bookCode">
				<input type="button" value="도서 검색" class="butt" id="bookBtn">
			</p>
			<p>
				<input type="submit" value="대여" id="btn" class="butt">
				<input type="reset" value="취소" class="butt">
			</p>
	</form>
	</div>
		<div id="bookSearch">
			<jsp:include page="/WEB-INF/view/rent/bookRentSearch.jsp" flush="false" />
		</div>
		<div id="MemberSearch">
		<jsp:include page="/WEB-INF/view/rent/memberRentSearch.jsp"  flush="false"></jsp:include>
	</div>
	</section>
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />

	</footer>
	
	<script>
	$(function() {
		if("${st}" == "1"){
			alert("대여가능한 도서가 아닙니다");
		}
		if("${st}" == "2"){
			alert("대여가능한 회원이 아닙니다");
		}
		if("${st}" == "3"){
			alert("도서번호와 회원번호를 다시 확인해 주세요.");
		} 
	});  
</script>
	
</body>
</html>
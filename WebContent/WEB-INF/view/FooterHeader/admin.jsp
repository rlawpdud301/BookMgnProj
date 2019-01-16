<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
#bookSearch{
	width: 80%;
	margin: 0 auto;
}
*{
	margin: 0;
	padding: 0;	
}

body,html{
		width: 100%;
		height: 100%;
		background: #FFFFF8;
		color: #353535;
	}
#Home{
	width:75%;
	margin: 0 auto;
}
#null{
	height: 55px;
}
#header {
	width: 100%;	
	height: 55px;
	border-bottom: 3px solid #510000; 
	position: fixed;
	background: white;
	left:0;
	top:0;
}

#header img {
	margin:5px;
	width: 100px;
}

#menu {
	width:80%;
	margin:0 auto;
	color: #cd853f;
	height: 55px;
	font-size: 14px;
}
#header a {
	color: #cd853f;
	text-decoration: none;
	text-align:center;
	font-size: 13px;
	padding:5px;		
}
#header a:HOVER {
	font-size: 16px;
	color:#751400;
}
#header #login{
	font-size: 15px;
	color:#cd853f;
	float: right;	
}
#header #login:HOVER{
	font-size: 16px;
	color:#cd853f;
}
#cont{
	clear: both;
}
#null{
	height: 57px;
}
#footer {
	width:100%;
	border-top:3px solid #510000; 
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
#bookSearch{
	width: 80%;
	margin: 0 auto;
}
section{
	min-height: 800px;
}
#best{
	width: 80%;
	margin: 0 auto;	
}
#overduetable{
	width: 80%;
	margin: 50px auto;
}
</style>
</head>
<body>
	<div id="header">
		<div id="menu">
			<a href="#"><img alt="" src="${pageContext.request.contextPath }/images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#">BEST!</a>
			<a href="${pageContext.request.contextPath }/book/insert.do">도서추가</a>
			<a href="/BookMgnProj/rent/bookRent.do">대여</a>
			<a href="/BookMgnProj/rent/bookReturn.do">반납</a>
			<a href="/BookMgnProj/rent/bookExtend.do">연장</a>
			<a href="/BookMgnProj/overduinfoPopUp.do">연채자팝업 </a>
			<a href="${pageContext.request.contextPath }/overduedtail.do" id="overduedtail">대여정보보기</a>
			<a href="${pageContext.request.contextPath }/member/info.do">내 정보 보기</a>
			<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
			[관리자] ${AUTH.korName }님 환영합니다.
		</div>
	</div>
	<div id="null">
	</div>
</body>
</html>
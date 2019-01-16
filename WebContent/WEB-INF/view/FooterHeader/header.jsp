<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<div id="header">
		<div id="menu">  
			<a href="${pageContext.request.contextPath }/home.do"><img src="${pageContext.request.contextPath }/images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="${pageContext.request.contextPath }/best.do">BEST!</a>
			<a href="${pageContext.request.contextPath }/member/insert.do" id="insert"> | 회원가입</a>					
			<a href="${pageContext.request.contextPath }/member/search.do" id="membersearch">회원찾기(테스트용)</a>
 			

			
			<a href="${pageContext.request.contextPath }/member/login.do" id="login">로그인</a>
		</div>
	</div>
	<div id="null">
	</div>
</html>
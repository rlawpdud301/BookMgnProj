<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	
}
body{
	background: #FFFFF8;
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
</style>
</head>
<body>
	<div id="header">		
		<div id="menu">
			<a href="#"><img alt="" src="images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#">BEST!</a>
			<a href="#" id="login">로그인/회원가입</a>
		</div>		
	</div>
	<div id="null">
	</div>
</body>
</html>
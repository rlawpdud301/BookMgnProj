<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	
}
body{
	background: #FFFFF8;
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
</style>
</head>
<body>

	<header>
		<jsp:include page="FooterHeader/header.jsp" flush="false" />
	</header>
	<div id="Home">
		홈이다옿ㅁ
		<a href="/BookMgnProj/rent/bookRent.do">대여</a>
		<header>
		</header>
		<section>
			<a href="${pageContext.request.contextPath }/book/insert.do">이거 누르셈</a>
		</section>
		<div id="bookSearch">
			<jsp:include page="/WEB-INF/view/bookSearch.jsp" flush="false" />
		</div>
		
	</div>
		
		
	<footer>
		<jsp:include page="FooterHeader/footer.jsp" flush="false" />
	</footer>


</body>
</html>
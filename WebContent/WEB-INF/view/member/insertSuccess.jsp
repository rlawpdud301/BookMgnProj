<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width:100%;
		margin:0 auto;
		text-align: center;
	}

	#hi{
		border: 1px solid black;
		width:600px;
		height:200px;
		line-height:70px;
		margin:0 auto;
		font-size: 20px;
		margin-top: 200px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/FooterHeader/header.jsp"></jsp:include>
	</header>

	<section>
	<div id="hi">
	환영합니다. ${result }
	<p>
	<a href="/BookMgnProj/member/login.do">로그인하러가기</a>
	</p>
	</div>
	</section>
	<footer>
	<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#container {
		width: 60%;
		margin: 50px auto;
		text-align: center;
		border: 1px solid black;
		padding: 20px;
	}
	
	a {
		margin-top: 20px;
		text-decoration: none;
	}
</style>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
		<div id="container">
			<h1>회원 정보를 수정했습니다.</h1><br>
			<a href="/BookMgnProj/home.do">[홈으로 돌아가기]</a> 
			<a href="/BookMgnProj/member/info.do">[내 정보로 돌아가기]</a>
		</div>
	</section>	
	<footer>
		<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
section{
	width: 80%;
	margin: 0 auto;
	text-align: center;
	line-height: 750px;
}
p{
	font-size: 30px;
}
b {
	color: #510000;
}
a{
	font-size: 34px;
	font-style: italic;
	color: #510000;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
		<p>${result }<a href="${pageContext.request.contextPath }/member/login.do">로그인 하러가기.</a></p>
	</section>	
	<footer>
		<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
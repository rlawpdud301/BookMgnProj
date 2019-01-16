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
	#bye{
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
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
	<div id="bye">
	멤버 아웃 처리되었습니다.
	<p>
	<a href="search.do">돌아가기</a>
	</p>
	</div>
	</section>
	<footer>
	<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>  
</html>
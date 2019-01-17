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
	#update{
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
	<div id="update">
	수정에 성공했습니다.<br>
	<a href="search.do">목록으로 돌아가기</a>
	</div>
	</section>
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>	
</body>
</html>
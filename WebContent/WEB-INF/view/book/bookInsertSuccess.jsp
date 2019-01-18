<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:100%;
		margin:0 auto;
		text-align: center;
		min-height:200px;
	}

	#message {
		border: 1px solid black;
		width:700px;
		line-height:70px;
		margin:0 auto;
		font-size: 20px;
		margin-top: 200px;
	}
	
	#message a {
		text-decoration: none;
		
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />
	</header>
	
	<section>
		<div id="message">
			<h1>입력한 도서가 성공적으로 추가되었습니다.</h1>
			생성된 도서코드 : ${Book.bookCode }<br>
			<a href="${pageContext.request.contextPath }/book/insert.do">[도서 추가하기]</a> &nbsp;
			<a href="${pageContext.request.contextPath }/home.do">[메인화면으로 돌아가기]</a>
		</div>
	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
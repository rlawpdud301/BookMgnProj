<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<div id="menu">
			<a href="#"><img alt="" src="images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#">BEST!</a>
			<a href="${pageContext.request.contextPath }/book/insert.do">도서추가</a>
			<a href="/BookMgnProj/rent/bookRent.do">대여</a>
			<a href="/BookMgnProj/rent/bookReturn.do">반납</a>
			<a href="/BookMgnProj/rent/bookExtend.do">연장</a>
		</div>
	</div>
	<div id="null">
		[관리자] ${AUTH.korName }님 환영합니다.
	</div>
</body>
</html>
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
			<a href="#"><img alt="" src="images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#"></a>
			<a href="${pageContext.request.contextPath }/member/info.do">내 정보 보기</a>
			<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
			${AUTH.korName }님 환영합니다.
		</div>
	</div>
</body>
</html>
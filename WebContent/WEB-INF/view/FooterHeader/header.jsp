<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
	<div id="header">
		<div id="menu">
			<a href="#"><img alt="" src="images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#">BEST!</a>
			<a href="${pageContext.request.contextPath }/member/insert.do" id="insert"> | 회원가입</a>
			<a href="${pageContext.request.contextPath }/member/login.do" id="login">로그인</a>			
			<a href="${pageContext.request.contextPath }/member/search.do" id="search">회원찾기(테스트용)</a>
 		</div>
	</div>
	<div id="null">
	</div>
</html>
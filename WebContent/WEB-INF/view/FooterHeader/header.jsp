<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
	<div id="header">
		<div id="menu">  
			<a href="${pageContext.request.contextPath }/home.do"><img src="${pageContext.request.contextPath }/images/logo.png"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="${pageContext.request.contextPath }/best.do">BEST!</a>
			<a href="${pageContext.request.contextPath }/member/insert.do" id="insert"> | 회원가입</a>					
			<a href="${pageContext.request.contextPath }/member/search.do" id="membersearch">회원찾기(테스트용)</a>
 			<a href="${pageContext.request.contextPath }/overduedtail.do" id="overduedtail">대여정보보기</a>

			
			<a href="${pageContext.request.contextPath }/member/login.do" id="login">로그인</a>
		</div>
	</div>
	<div id="null">
	</div>
</html>
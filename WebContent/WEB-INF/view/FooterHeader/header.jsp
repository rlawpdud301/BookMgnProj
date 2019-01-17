<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css">
</head>
	<div id="header">
		<div id="menu">
			<c:choose>
				<c:when test="${AUTH == null }">
					<a href="${pageContext.request.contextPath }/home.do"><img src="${pageContext.request.contextPath }/images/logo1.png" id="logo"></a><a href="#bookSearch">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#best">BEST!</a>
					<a href="${pageContext.request.contextPath }/member/insert.do" id="insert"> | 회원가입</a>					 
					<a href="${pageContext.request.contextPath }/member/search.do" id="membersearch">회원찾기(테스트용)</a>

					<a href="${pageContext.request.contextPath }/member/login.do" id="login">로그인</a>
				</c:when>   
			
				<c:when test="${AUTH.admin == true }">
					<a href="${pageContext.request.contextPath }/home.do"><img alt="" src="${pageContext.request.contextPath }/images/logo1.png" id="logo"></a><a href="#bookSearch">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#best">BEST!</a>
					<a href="${pageContext.request.contextPath }/book/insert.do">도서추가</a>
					<a href="/BookMgnProj/rent/bookRent.do">대여</a>
					<a href="/BookMgnProj/rent/bookReturn.do">반납</a>
					<a href="/BookMgnProj/rent/bookExtend.do">연장</a>
					<a href="/BookMgnProj/overduinfoPopUp.do">연채자팝업 </a>
					<a href="${pageContext.request.contextPath }/overduedtail.do" id="overduedtail">대여정보보기</a>
					<a href="${pageContext.request.contextPath }/member/info.do">내 정보 보기</a>
					<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
					<a href="${pageContext.request.contextPath }/member/search.do">회원 정보보기</a>
					[관리자] ${AUTH.korName }님 환영합니다.
				</c:when>
			
				<c:when test="${AUTH.admin == false }">
					<a href="#"><img alt="" src="${pageContext.request.contextPath }/images/logo1.png" id="logo"></a><a href="#">도서검색</a> | <a href="#">위치보기</a> | <a href="#">게시판</a> | <a href="#"></a>
					<a href="${pageContext.request.contextPath }/member/info.do">내 정보 보기</a>
					<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
					${AUTH.korName }님 환영합니다.
				</c:when>
			</c:choose>
		</div>
	</div>
	<div id="null">
	</div>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset {
		width: 600px;
	}
	
	label {
		width: 100px;
		display: block;
	}
	
	input {
		width: 200px;
	}
</style>
</head>
<body>
	<form action="login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="id">
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password">
			</p>
			<p>
				
				<a href="${pageContext.request.contextPath}/member/insert.do">회원 가입하기</a>
				<a href="${pageContext.request.contextPath}/member/find.do">ID / PW 찾기</a>
				<input type="submit" value="로그인">
			</p>
		</fieldset>
	</form>
</body>
</html>
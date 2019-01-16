<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${Error != null }">
	<script>
		alert("${Error}");
	</script>
</c:if>
<style>
	fieldset {
		width: 600px;
		margin: 100px auto;
		padding 
	}
	
	label {
		width: 100px;
		display: block;
	}
	
	input {
		width: 200px;
	}
	
	p {
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	
	<section>
		<form action="login.do" method="post">
			<fieldset>
				<p>OO도서관에 오신 것을 환영합니다.</p>
				<input type="text" name="id" placeholder="MemberNumber"><br>
				<input type="password" name="password" placeholder="Password"><br>
				<input type="submit" value="로그인"><br>
				<p><a href="${pageContext.request.contextPath}/member/insert.do">회원 가입하기</a>
				<a href="${pageContext.request.contextPath}/member/find.do">ID / PW 찾기</a></p>
			</fieldset>
		</form>
	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
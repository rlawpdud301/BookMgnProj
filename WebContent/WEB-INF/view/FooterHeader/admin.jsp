<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	관리자
	<a href="${pageContext.request.contextPath }/book/insert.do">도서추가</a>
	<a href="/BookMgnProj/rent/bookRent.do">대여</a>
	<a href="/BookMgnProj/rent/bookReturn.do">반납</a>
</body>
</html>
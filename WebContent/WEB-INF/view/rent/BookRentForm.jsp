<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="bookRent.do" method="post">
		<fieldset>
			<p>
				<label>대여 번호</label>
				<input type="text" name="rentalNo">
			</p>
			<p>
				<label>대여 날짜</label>
				<input type="text" name="rentalDate">
			</p>
			<p>
				<label>반납 날짜</label>
				<input type="text" name="returnDate">
			</p>
			<p>
				<label>반납 예정일</label>
				<input type="text" name="returnSchedule">
			</p>
			<p>
				<label>회원 번호</label>
				<input type="text" name="memberNo">
			</p>
			<p>
				<label>도서 코드</label>
				<input type="text" name="bookCode">
			</p>
			<p>
				<input type="submit" value="대여">
				<input type="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>
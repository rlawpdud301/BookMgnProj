<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#overduetable table {
	border-collapse: collapse;
}
#overduetable th,td{
	border: 1px solid black;
}
#overduetable .tr:HOVER td{
	background: black;
	color: white;
	border: 1px solid white;
}
</style>
</head>
<body>
	<div id="overduetable">
	<input type="button" value="연채회원만 보기">
	
	<select>
		<option>회원 번호</option>
		<option>이름</option>
		<option>도서 번호</option>
		<option>도서 제목</option>
	</select>
	<input type="text" name="name">
	<input type="button" value="검색">
		<table>
			<tr>
				<th>대여번호</th>
				<th>회원 이름</th>
				<th>회원 번호</th>
				<th>도서 제목</th>
				<th>도서 코드</th>
				<th>전화 번호</th>
				<th>연채 일수</th>			
			</tr>
			<c:forEach var="one" items="${list}" >
				<a href="#">
					<tr class="tr">
						<td>${one.rentalNo}</td>
						<td>${one.korName.korName}</td>
						<td>${one.memberNo}</td>
						<td>${one.title.title}</td>
						<td>${one.bookCode.bookCode}</td>
						<td>${one.phone.phone}</td>
						<td>${one.overday}</td>
					</tr>
				</a>     			
			</c:forEach>
		</table>
	</div>
</body>
</html>
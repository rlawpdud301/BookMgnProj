<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width:870px;
		border-collapse: collapse;
	}
	tr,th,td{
		border:1px solid black;
	}
	th{
		background-color: #FFFED7;
	}
</style>
</head>
<body>
	<table>
		<tr>
		<th>책번호</th>
		<th>책제목</th>
		<th>대여날자</th>
		<th>반납일</th>
		<th>반납예정일</th>
		</tr>
		<c:forEach var="rent" items="${list}">
		<tr>
		<td>${rent.book.bookCode }</td>
		<td>${rent.book.title }</td>
 		<td><fmt:formatDate value="${rent.bookRentallInfo.rentalDate }" pattern="yyyy-MM-dd" type="date" dateStyle="short"></fmt:formatDate></td>
		<td><fmt:formatDate value="${rent.bookRentallInfo.returnDate }" pattern="yyyy-MM-dd" type="date" dateStyle="short"></fmt:formatDate></td>
		<td><fmt:formatDate value="${rent.bookRentallInfo.returnSchedule }" pattern="yyyy-MM-dd" type="date" dateStyle="short"></fmt:formatDate></td>		
		</tr>
		</c:forEach>
	</table>
</body>
</html>
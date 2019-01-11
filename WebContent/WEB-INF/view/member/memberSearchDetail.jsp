<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<table>
		<tr>
		<th>회원번호</th>
		<td>${mno.memberNo }</td>
		</tr>
		<tr>
		<th>회원이름</th>
		<td>${mno,korName }</td>
		</tr>
		<tr>
		<th>영어이름</th>
		<td>${mno,engName }</td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td>${mno,phone }</td>
		</tr>
		<tr>
		<th>주민등록번호</th>
		<td>${mno,jumin }</td>
		</tr>
		<tr>
		<th>우편번호</th>
		<td>${mno,email }</td>
		</tr>
		<tr>
		<th>주소</th>
		<td>${mno,address }</td>
		</tr>
		<tr>
		<th>사진</th>
		<td><img src="${pageContext.request.contextPath }/upload/${mno,korName }"></td>
		</tr>
	
	</table>
	<a href="">[수정]</a>
	<a href="">[도서대여목록 보기]</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<p>
			<label>도서 번호</label>
			<input type="text" name="bookCode">
		</p>
		<p>
			<label>도서 분류</label>
			<select>
				<option value="${book.cateSNo.sName }">${book.cateSNo.sName }</option>
			</select>
			<select>
				<option></option>
			</select>
			<select>
				<option></option>
			</select>
		</p>
		<p>
			<label>저자</label>
			<input type="text" name="author">
		</p>
		<p>
			<label>역자</label>
			<input type="text" name="translator">
		</p>
		<p>
			<label>출판사</label>
			<input type="text" name="">
		</p>
		
		<p>
			<label>도서명</label>
			<input type="text" name="title">
		</p>
		<p>
			<label>가격</label>
			<input type="text" name="price">
		</p>
	</form>
</body>
</html>
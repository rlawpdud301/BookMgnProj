<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 추가</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/book/insert.do">
		<p>
			<label>도서 번호</label>
			<input type="text" name="bookCode">
		</p>
		
		<p>
			<label>도서 분류</label>
			<select>
				<option value="${CategoryB.bCode }">${CategoryB.bName }</option>
			</select>
			<select>
				<option value="${CategoryM.mCode }">${CategoryB.bName }</option>
			</select>
			<select>
				<option value="${CategoryS.sCode }">${CategoryB.bName }</option>
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
			<input type="text" name="publisher">
		</p>
		
		<p>
			<label>도서명</label>
			<input type="text" name="title">
		</p>
		
		<p>
			<label>가격</label>
			<input type="text" name="price">
		</p>
		
		<p>
			<input type="submit" value="추가">
			<input type="reset" value="취소">
		</p>
	</form>
</body>
</html>
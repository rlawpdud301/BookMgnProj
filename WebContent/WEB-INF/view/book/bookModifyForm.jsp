<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/book/insert.do" method="post" enctype="multipart/form-data" runat="server">
		<fieldset>
			<legend>도서 추가</legend>
			<p>
				<label>도서 분류</label>
				<select id="cateB" name="cateB"></select>
				<select id="cateM" name="cateM"></select>
				<select id="cateS" name="cateS"></select>
			</p>
			
			<p>
				<label>도서명</label>
				<input type="text" name="title" value="${Book.title }">
			</p>
			
			<p>
				<label>저자</label>
				<input type="text" name="author" value="${Book.author }">
			</p>
			
			<p>
				<label>역자</label>
				<input type="text" name="translator" value="${Book.translator }">
			</p>
			
			<p>
				<label>출판사</label>
				<input type="text" name="publisher" value="${Book.pubNo }">
			</p>
			
			<p>
				<label>가격</label>
				<input type="text" name="price" value="${Book.price }">
			</p>
			
			<p>
				<label>이미지</label>
				<input type="file" name="image" id="imgInp"><br>
				<img alt="" src="/BookMgnProj/upload/${Book.image }" id="blah">
			</p>
			
			<p>
				<input type="submit" id="submit" value="추가">
				<a href="#">삭제</a>
				<input type="reset" id="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>
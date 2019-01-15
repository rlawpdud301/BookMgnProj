<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(function(){
		$("#imgInp").change(function() {
			readURL(this);
		});
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/book/modify.do" method="post" enctype="multipart/form-data" runat="server">
		<fieldset>
			<c:if test="${AUTH.admin == true }">	
				<legend>도서 수정</legend>
			</c:if>
			
			<c:if test="${AUTH.admin != true }">	
				<legend>도서 상세정보</legend>
			</c:if>
			
			<p>
				<label>도서 번호</label>
				<input type="text" name="bookCode" value="${Book.bookCode.bookCode }">
			</p>
			
			<p>
				<label>도서 분류</label>
				<select id="cateB" name="cateB">
					<option selected="selected">${Book.bName }</option>
				</select>
				<select id="cateM" name="cateM">
					<option selected="selected">${Book.mName }</option>
				</select>
				<select id="cateS" name="cateS">
					<option selected="selected">${Book.sName }</option>
				</select>
			</p>
			
			<p>
				<label>도서명</label>
				<input type="text" name="title" value="${Book.title.title }">
			</p>
			
			<p>
				<label>저자</label>
				<input type="text" name="author"  value="${Book.author.author }">
			</p>
			
			<p>
				<label>역자</label>
				<input type="text" name="translator"  value="${Book.translator.translator }">
			</p>
			
			<p>
				<label>출판사</label>
				<input type="text" name="publisher"  value="${Book.pubName }">
			</p>
			
			<p>
				<label>가격</label>
				<input type="text" name="price"  value="${Book.price.price }">
			</p>
			
			<p>
				<label>이미지</label>
				<input type="file" name="image" id="imgInp"><br>
				<img alt="" src="/BookMgnProj/upload/${Book.image.image }" id="blah">
			</p>
			<c:if test="${AUTH.admin == true }">
				<p>
					<input type="submit" id="submit" value="수정">
					<a href="delete.do?no=${Book.bookCode.bookCode }">삭제</a>
					<input type="reset" id="reset" value="취소">
				</p>
			</c:if>
		</fieldset>
	</form>
</body>
</html>
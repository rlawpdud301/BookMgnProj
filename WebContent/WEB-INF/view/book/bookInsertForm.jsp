<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
		width: 100px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#cateB").change(function() {
			$("#cateM option").remove();
			$("#cateS option").remove();
			$.ajax({
				url:"category.do",
				type:"get",
				data:{"cateB":$("#cateB").val()},
				dataType:"json",
				success:function(json){
					console.log(json);
					 $(json.listM).each(function(index, obj) {
						$("#cateM").append("<option value='" + obj.mCode + "'>" + obj.mName + "</option>");
						console.log(obj);
					}) 
				}
			})
		})
		
		$("#cateM").change(function() {
			$("#cateS option").remove();
			$.ajax({
				url:"category.do",
				type:"get",
				data:{"cateM":$("#cateM").val(), "cateB":$("#cateB").val()},
				dataType:"json",
				success:function(json){
					console.log(json);
					$(json.listS).each(function(index, obj) {
						$("#cateS").append("<option value='" + obj.sCode + "'>" + obj.sName + "</option>");
						console.log(obj);
					})
				}
			})
			
		})
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/book/insert.do" method="post">
		<p>
			<label>도서 분류</label>
			<select id="cateB" name="cateB">
				<c:forEach var="cateB" items="${listB }">
					<option value="${cateB.bCode }">${cateB.bName }</option>
				</c:forEach>
			</select>
			<select id="cateM" name="cateM"></select>
			<select id="cateS" name="cateS"></select>
		</p>
		
		<p>
			<label>이미지</label>
			<input type="file" name="image">
		</p>
		
		<p>
			<label>도서명</label>
			<input type="text" name="title">
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
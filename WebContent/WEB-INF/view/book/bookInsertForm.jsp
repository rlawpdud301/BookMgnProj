<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset {
		width: 600px;
	}
	
	label {
		width: 100px;
  		display: inline-block;
	}
	
	select {
		width: 150px;
		height: 30px;
	}
	
	p {
		height: 30px;
	}
	
	input {
		width: 150px;
	}
	
	#submit, #reset {
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
					 $(json.list).each(function(index, obj) {
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
					$(json.list).each(function(index, obj) {
						$("#cateS").append("<option value='" + obj.sCode + "'>" + obj.sName + "</option>");
						console.log(obj);
					})
				}
			})
			
		})
		
		$("#imgInp").on('change', function() {
			readURL(this);
		})
	})
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/book/insert.do" method="post" enctype="multipart/form-data" runat="server">
		<fieldset>
			<legend>도서 추가</legend>
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
				<label>이미지</label>
				<input type="file" name="image" id="imgInp"><br>
				<img alt="" src="" id="blah">
			</p>
			
			<p>
				<input type="submit" id="submit" value="추가">
				<input type="reset" id="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>
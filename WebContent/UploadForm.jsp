<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
  	$(function(){
	$(document).on('click','#submit',function(){
	$(opener.document).find('#photobox').val($('#file1').val());
	confirm("가는거야?")
	})
	
}); 
</script>
</head>
<body>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<p>
			<label>파일명선택</label>
			<input type="file" name="file1" id="file1">
		</p>
		<p>
			<input type="submit" value="전송" id="submit">
			<input type="reset" value="취소">
		</p>
	</form>	
</body>
</html>
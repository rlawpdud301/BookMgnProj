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
		$("#btnadmin").click(function(){
			var password = $('#adminpass').val();
			$("")
		})	
	
	})
</script>
</head>
<body>
	비밀번호를 입력해주세요
	<input type="password" id="adminpass" name="adminpass">
	<input type="button" id="btnadmin" value="전송">
	<input type="button" id="cancel" value="취소">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.do" method="post" id="f1">
		<fieldset>
			<legend>나의 정보 보기</legend>
			<p>
				<label>이름</label>
				<input type="text" value="${AUTH.korName }">
			</p>
			<p>
				<label>이름</label>
				<input type="text" value="${AUTH.engName }">
			</p>
			<p>
				<label>전화번호</label>
				<input type="text" value="${AUTH.phone }">
			</p>
			<p>
				<label>이름</label>
				<input type="text" value="${AUTH.jumin }">
			</p>
			<p>
				<label>이름</label>
				<input type="text" value="${AUTH.address }">
			</p>
			<p>
				<label>이름</label>
				<input type="text" value="${AUTH.email }">
			</p>
			
		</fieldset>
	</form>
</body>
</html>
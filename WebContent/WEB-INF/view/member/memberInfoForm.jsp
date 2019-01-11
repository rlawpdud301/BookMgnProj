<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	
</script>
<body>
	<form action="/modify.do" method="post">
		<fieldset>
			<legend>나의 정보 보기</legend>
			<p>
				<label>회원 번호</label>
				<input type="text" value="${Member.memberNo }" readonly="readonly">
			</p>
			<p>
				<label>한글 이름</label>
				<input type="text" value="${Member.korName }" readonly="readonly">
			</p>
			<p>
				<label>영어 이름</label>
				<input type="text" value="${Member.engName }" readonly="readonly">
			</p>
			<p>
				<label>전화번호</label>
				<input type="text" value="${Member.phone }">
			</p>
			<p>
				<label>주민</label>
				<input type="text" value="${Member.jumin.substring(0,8) }******">
			</p>
			<p>
				<label>주소</label>
				<input type="text" value="${Member.address }">
			</p>
			<p>
				<label>이메일</label>
				<input type="text" value="${Member.email }">
			</p>
			<p>
				<label>사진</label>
				<img alt="" src="${pageContext.request.contextPath}${Member.photo }">
			</p>
			<p>
				<input type="submit" value="정보 수정하기">
			</p>
		</fieldset>
	</form>
</body>
</html>
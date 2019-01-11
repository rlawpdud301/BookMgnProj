<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		if("${st}" == "1"){
			alert("대여중인 도서가 아닙니다");
		}
		if("${st}" == "2"){
			alert("도서번호를 다시 확인해주세요");
		}  
		if("${st}" == "3"){
			alert("더 이상 연장이 불가능합니다");
		}    
	});  
</script>
</head>
<body>
	<form action="bookExtend.do" method="post">
		<fieldset>
			<p>
				<label>도서 코드</label>
				<input type="text" name="bookCode">
			</p>
			<p>
				<input type="submit" value="연장">
				<input type="reset" value="취소">
			</p>
		</fieldset>
	</form>
</body>
</html>
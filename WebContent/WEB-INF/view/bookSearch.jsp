<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			$.ajax({
				url:"bookSearchAjax.jsp",
				type:"get",
				data:{"BookCode":$("#BookCode").val()},
				dataType:"json",
				success:function(data){
					alert(data);
				}
			})
		})
	})
</script>
</head>
<div id="SearchMethod">
	<select name="Method">
		<option value="도서 번호">도서 번호</option>
		<option value="상세정보">상세정보</option>
	</select> <input type="text" id="BookCode">
	<button id="bntBookSearch">검색</button>

</div>
</html>
<%@page import="com.yi.BookMgnProj.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			$("#list").empty()
			$.ajax({
				url:"bookSearch.do",
				type:"get",
				data:{"BookCode":$("#BookCode").val()},
				dataType:"json", 
				success:function(list){

					console.log(list);
					$(list).each(function(index,obj){
						$("#list").append("<li>"+ obj.title+"</li>");
					})
					
				}
			})
			
		})
	})
</script>
</head>
<div id="SearchMethod">
	<select name="Method">
		<option value="도서 번호">도서 번호로</option>
		<option value="상세정보">상세정보</option>
		<option value="제목">제목으로</option>
	</select> <input type="text" id="BookCode">
	<button id="bntBookSearch">검색</button>
	<dir id="list">
		 <img src="">
	</dir>
	

</div>
</html>
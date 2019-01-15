<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	#searchList table{
		border-collapse: collapse;
		border:1px solid black;
	}
	#searchList th,tr,td{
		border:1px solid black;
	}



</style>
<script>
	$(function(){
		$.ajax({
			url: "../search.do",
			type: "post",
			dataType: "json",
			success : function(json){
				console.log(json)
					$("#searchList").append("<table>")
					 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")
					
				$(json).each(function(index, obj){
					var jumin = obj.jumin
					$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='#'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
				})
					 $("#searchList").append("</table>")
			}
		})
	})
</script>
</head>
<body>
	<div id="searchList">
	
	</div>
</body>
</html>
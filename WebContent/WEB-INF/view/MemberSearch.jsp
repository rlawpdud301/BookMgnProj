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
			url: "search.do",
			type: "post",
			data: {"list":"a"},
			dataType: "json",
			success : function(json){
				console.log(json)
					$("#searchList").append("<table>")
					 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")	
				$(json).each(function(index, obj){
					var jumin = obj.jumin
					$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='searchDetail.do?no="+obj.memberNo+"'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
				})
					 $("#searchList").append("</table>")
			}
		})
	})
	 
	$(function(){
	$(document).on("click","#selected",function(event){
		if($("#select").val()=="회원번호"){
		$.ajax({
			url : "search.do",
			type: "post",
			data: {"memberNo":$("#memberNo").val()},
			dataType : "json",
			success : function(mnojson)	{
				console.log(mnojson)
				$("#searchList table").remove();
				$("#searchList").append("<table>")
					 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")
				
				$(mnojson).each(function(index,obj){
					var jumin = obj.jumin
					$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='searchDetail.do?no="+obj.memberNo+"'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
				})
				$("#searchList").append("</table>")			
				}
			})
		}else if($("#select").val()=="회원이름"){
			$.ajax({
				url : "search.do",
				type: "post",
				data:{"korName":$("#memberNo").val()},
				dataType:"json",
				success : function(mnajson){
					console.log(mnajson)
					$("#searchList table").remove();
					$("#searchList").append("<table>")
						 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")
					
					$(mnajson).each(function(index,obj){
						var jumin = obj.jumin
						$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='searchDetail.do?no="+obj.memberNo+"'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
					})
					$("#searchList").append("</table>")					
				}			
			})
		}else if($("#select").val()=="회원전화번호"){
			$.ajax({
				url : "search.do",
				type: "post",
				data:{"phone":$("#memberNo").val()},
				dataType:"json",
				success:function(phonejson){
					console.log(phonejson)
					$("#searchList table").remove();
					$("#searchList").append("<table>")
						 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")
					
					$(phonejson).each(function(index,obj){
						var jumin = obj.jumin
						$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='searchDetail.do?no="+obj.memberNo+"'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
					})
					$("#searchList").append("</table>")				
				}										
			})
		}
	})
})
	$(function(){
		$("#btn1").click(function(){
			$.ajax({
				url: "search.do",
				type: "post",
				data: {"list":"a"},
				dataType: "json",
				success : function(json){
					console.log(json)
						$("#searchList table").remove();
						$("#searchList").append("<table>")
						 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")	
					$(json).each(function(index, obj){
						var jumin = obj.jumin
						$("table").append("<tr><td>"+obj.memberNo+"</td><td>"+"<a href='searchDetail.do?no="+obj.memberNo+"'>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
					})
						 $("#searchList").append("</table>")
				}
			})
		})
		
	})
</script>
</head>
<body>
	<header>
		<jsp:include page="FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
	<div id="searchMember">
		<select name="select" id="select">
			<option value="회원번호">회원번호</option>
			<option value="회원이름">회원이름</option>
			<option value="회원전화번호">회원전화번호</option>
		</select>
		<input type="text" id="memberNo">
		<input type="submit" value="검색" id="selected">
	</div>	
		<input type="button" value="초기화" id="btn1">

	
	<div id="searchList">
	
	</div>
	</section>
	<footer>
	<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
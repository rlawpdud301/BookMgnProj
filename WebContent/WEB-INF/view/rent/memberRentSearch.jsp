<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	#searchMember{
		width: 80%;
		margin: 0 auto;
		margin-bottom: 10px;
	}
	#selected{
		width: 100px;
		height: 30px;
		background-color: #E1527D;
		border-radius: 15px;
		color: white;
	}
	#select{
		height: 30px;
	}
	#memberNo{
		width: 200px;
		height: 30px;
	}
	#btn1{
		width: 100px;
		height: 30px;
		background-color: #E1527D;
		border-radius: 15px;
		color: white;
	}
	#searchList{
		width: 50%;
		margin: 0 auto;
		margin-left: 10px;
		text-align: center;
	}
	#searchList table{
		border-collapse: collapse;
		border:1px solid black;
		width:600px; 
		margin: 0 auto;
		margin-left: 20px;
		
	}
	#searchList th,tr,td{
		border:1px solid black;
	}



</style>
<script>
	$(function(){
		$.ajax({
			url: "rentSearch.do",
			type: "post",
			data: {"list":"a"},
			dataType: "json",
			success : function(json){
				console.log(json)
					$("#searchList").append("<table>")
					 $("table").append("<tr><th>회원번호</th><th>이름</th><th>주민번호</th><th>전화번호</th></tr>")	
				$(json).each(function(index, obj){
					var jumin = obj.jumin
					$("table").append("<tr class='tr'><td>"+obj.memberNo+"</td><td>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
				})
					 $("#searchList").append("</table>")
			}
		})
	})
	 
	$(function(){
	$(document).on("click","#selected",function(event){
		if($("#select").val()=="회원번호"){
		$.ajax({
			url : "rentSearch.do",
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
					$("table").append("<tr class='tr'><td>"+obj.memberNo+"</td><td>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
				})
				$("#searchList").append("</table>")			
				}
			})
		}else if($("#select").val()=="회원이름"){
			$.ajax({
				url : "rentSearch.do",
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
						$("table").append("<tr class='tr'><td>"+obj.memberNo+"</td><td>"+obj.korName+"</a></td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
					})
					$("#searchList").append("</table>")					
				}			
			})
		}else if($("#select").val()=="회원전화번호"){
			$.ajax({
				url : "rentSearch.do",
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
						$("table").append("<tr class='tr'><td>"+obj.memberNo+"</td><td>"+obj.korName+"</td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
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
				url: "rentSearch.do",
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
						$("table").append("<tr class='tr'><td>"+obj.memberNo+"</td><td>"+obj.korName+"</td><td>"+jumin.substring(0,8)+"******"+"</td><td>"+obj.phone+"</td></tr>")
					})
						 $("#searchList").append("</table>")
				}
			})
		})
		
	})
	$(function() {
		$(document).on("click",".tr",function(event) {
			var code = $(this).children("td").eq(0).text();
			$("#MemberNo").val(code);
		})
	})
</script>
</head>
<body>
	<div id="searchMember">
		<select name="select" id="select">
			<option value="회원번호">회원번호</option>
			<option value="회원이름">회원이름</option>
			<option value="회원전화번호">회원전화번호</option>
		</select>
		<input type="text" id="memberNo">
		<input type="submit" value="검색" id="selected">
		<input type="button" value="초기화" id="btn1">
	</div>	
		

	
	<div id="searchList">
	
	</div>
</body>
</html>
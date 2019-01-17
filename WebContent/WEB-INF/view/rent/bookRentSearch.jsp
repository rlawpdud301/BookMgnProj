<%@page import="com.yi.BookMgnProj.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<style type="text/css">
#BookDetail{
	width: 100%;
	position: relative;
	position: absolute;
	top: 0;
	left: 0;
	margin-left:-100%;
	height: 150%;
	background-color: rgb(0,0,0,0.5);	
}
#inner{	
	background-color: #510000; 
	color: white;
	position: absolute;
	left: 30%;
	top: 20%; 
}
#inner #bntx{
	float: right;
	width:50px;
	padding: 5px;
	/* position: absolute;
	right: 0;
	top: 0; */
}
#bntx:HOVER{
	width:52px;
}
#inner #bimg{
	float: left;
	width: 190px;
	height: 240px;
	margin: 20px;
	border-radius: 5px;
	border: 5px solid white;
}
#inner a{
	color: #FFC6C6;
	text-decoration: none;
}
#inner a:HOVER{
	color: #D941C5;
	text-decoration: none;
}
#inner p{
	margin: 20px 0;
}
table{
	width: 600px;
	margin: 20px;
	padding:50px;
	border: 1px solid black; 
	border-collapse: collapse;
}
table tr th{
	width: 300px;
	border: 1px solid #D1FFCA; 
}
table tr td{
	width: 300px;
	border: 1px solid #D2E5A8; 
}
h1{
	width:	55%;
	margin: 0 auto;
}
#SearchMethod{
	width: 55%;
	margin: 0 auto;
}
#selectOption{
	width: 100%;
	height:53px;
	background: #9FD4CA;
	border-radius: 5px 5px 0 0;
	line-height: 70px; 
	/* border: 3px solid #AB4A12; */  
}
#search{
	margin-left: 40px; 
}
#search select{
	width: 120px;
	height: 20px;
	border: 0;
	margin: 0;
	padding: 0;
} 
#search #BookCode{
	width: 170px;
	height: 20px;
	border: 0;
	margin: 0;
	padding: 0; 
	border:2px solid #E1527D;  
	
}
#search #bntBookSearch{ 
	background:#E1527D;
	color:#FFFEC6;
	width: 100px;
	height: 24px;
	border: 0;
	margin-top: 0;
	padding-top: 0;
	 
}
#list img { 
	float: left;
	width: 150px;
	height: 200px;
	margin: 10px;
	border-radius: 5px;
}

#list .text {
	float: left;
	margin: 10px;
	margin-top: 30px;
}
#list {
	border: 5px solid #FFFCFC;
	background: #F6F6F6;
}

#list li {
	background: white;
	clear: both;
	list-style: none;
	border-bottom: 5px solid #E1527D;
	height: 220px;
}
span {
	font-weight: bold;
}
#list li a{
	text-decoration: none;
	color: #353535;
}
#list li a:HOVER {
	font-size: 1.05em;
	text-decoration:underline;
	color: black;
	font-weight: bold;
}
#list li a:HOVER img{
	float: left;
	margin: 10px;
	border: 3px solid #510000;
	border-radius: 3px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#BookDetail").css("margin-left","-100%").css("opacity",0);
		
		$(document).on("change","#Method",function(event) {
			
			if($("#Method").val()=="상세정보" || $("#Method").val()=="제목"){
				$("#list").empty();
				$("#list").css("height","0px");
				var a =$("#Method").val();
				alert(a);
				$("#BookCode").remove();
				$("#each").remove();
				$("#Method").after("<fieldset id='each'></fieldset>");
				$("#each").append("<legend>상세 정보로 검색</legend>");
				$("#each").append("<p><input type='checkbox' name='opstion' value='title'><label>제목</label><input type='text' name='title'></p>");
				$("#each").append("<p><input type='checkbox' name='opstion' value='author'><label>저자</label><input type='text' name='author'></p>");
				$("#each").append("<p><input type='checkbox' name='opstion' value='translator'><label>역자</label><input type='text' name='translator'></p>");
				$("#each").append("<p><input type='checkbox' name='opstion' value='pubName'><label>출판사</label><input type='text' name='pubName'></p>");
				$("#each").append("<p><input type='checkbox' name='opstion' value='pubName'><label>출판사</label><input type='text' name='pubName'></p>");
				
				
				$.ajax({
					url :"book/category.do",
					type : "post",
					dataType : "json", 
					success : function(list) {
						console.log(list);
						$("#each").append("<select name='cateB' id='cateB'></select>");
						$(list.list).each(function(index, obj) {
							$("#cateB").append("<option value='" + obj.bCode + "'>" + obj.bName + "</option>");
						})
												
											}
					
										})
				
				
				/* $("#search").empty();
				$("#search").append("<select name='Method' id='Method'><option value='도서 번호'>도서 번호로</option><option value='제목'>제목으로</option>	<option value='상세정보'>상세정보</option></select> <input type='button' value='검색' id='bntBookSearch'>"); */				
			}else{
				$("#search").empty();
				$("#search").append("<select name='Method' id='Method'><option value='도서 번호'>도서 번호로</option><option value='제목'>제목으로</option>	<option value='상세정보'>상세정보</option></select> <input type='text' id='BookCode'><input type='button' value='검색' id='bntBookSearch'>");
				
	
			}
		})
		
		$(document).on("click","#bntBookSearch",function(event) {
			$("#list").empty();
			$.ajax({
				url : "../bookSearch.do",
				type : "post",
				data : {"BookCode" : $("#BookCode").val()},
				dataType : "json", 
				success : function(list) {
					console.log(list);
				
					$("#list").append("<ul>");
					$(list).each(function(index, obj) {
						$("#list").append("<li><a href='#' class='bookinfo' data-bcode='"+ obj.bookCode.bookCode +"' onclick='return false;'><img src='../images/KakaoTalk_20190108_141119999.jpg'></a><p class='text'><span id='title'>제목 : <a href='#' class='bookinfo' data-bcode='"+ obj.bookCode.bookCode +"' onclick='return false;'>"
											+ obj.title.title
											+ "</a></span><br>저자 : <a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ obj.author.author+"' target='_blank' >"
											+ obj.author.author
											+ "</a><br>역자 : "
											+ "<a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ obj.translator.translator +"' target='_blank' >"+obj.translator.translator+"</a>"
											+ "<br>출판사 : "
											+ "<a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ obj.pubName.pubName +"' target='_blank' >"+obj.pubName.pubName+"</a>"
											+ "<br>가격 : "
											+ obj.price.price
											+ "<br>보유 권수 : "
											+ obj.hap
											+ "<br>" 
											+ obj.rentalPossible										
											+"</p></li>");
											})
											$("#list").append("</ul>");
											$("#list").css("height","800px");
										}
				
									})
									
						})

		$(document).on("click",".bookinfo",function(event) {
			$("#inner").empty()
			$("#inner").append("<img src='../images/xbutton_83749.png' id='bntx'>");
			$("#BookDetail").animate({"margin-left":"0", "opacity":1});
			$.ajax({
				url : "../bookSearch.do",
				type : "post",
				data : {"BookCodeDetail" : $(this).attr("data-bcode")},
				dataType : "json", 
				success : function(list) {
					console.log(list);
					$("#inner").append("<img src='${pageContext.request.contextPath }/upload/"+ list[0].image.image +"' id='bimg'>");
					$("#inner").append("<p>");
					$("#inner").append("<h1>"+list[0].title.title+"</h1>");
					$("#inner").append("저자 : <a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ list[0].author.author+"' target='_blank' >"
						+ list[0].author.author
						+ "</a><br>역자 : "
						+ "<a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ list[0].translator.translator +"' target='_blank' >"
						+list[0].translator.translator+"</a>"
						+ "<br>출판사 : "
						+ "<a href='https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+ list[0].pubName.pubName +"' target='_blank' >"
						+list[0].pubName.pubName+"</a>");
					$("#inner").append("<table id='ta'>");
						$("#ta").append("<tr><th>도서코드</th><th>대여기능여부</th><.tr>");
					$(list).each(function(index, obj) {
							$("#ta").append("<tr><td><a href='#'><span class='code'>"+ obj.bookCode.bookCode +"</span></a></td><td>"+ obj.rentalPossible +"</td></tr>");
					})
					$("#inner").append("</p>");
										}
				
			})
			
		})
		$(document).on("click","#bntx",function(event) {
			$("#BookDetail").css("margin-left","-100%").css("opacity",0);v
		})
		$(document).on("click",".code",function(event) {
			var code = $(this).text();
			$("#bookCode").val(code);
		})
	})
</script>
</head>
<nav id="BookDetail">
	<div id="inner">
		<img src="../images/xbutton_83749.png" id="bntx">
	</div>
</nav>
<h1>도서검색</h1>
<div id="SearchMethod">
	<div id="selectOption">
		
		<dir id="search">
			<select name="Method" id="Method"> 
				<option value="도서 번호">도서 번호로</option>
				<option value="제목">제목으로</option>
				<option value="상세정보">상세정보</option>
			</select> <input type="text" id="BookCode"><input type="button" value="검색" id="bntBookSearch">
			
		</dir> 
	</div>
	<dir id="list" style="overflow:auto; height:0;">
		
	</dir>
</div>
</html>
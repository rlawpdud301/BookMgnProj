<%@page import="com.yi.BookMgnProj.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
#BookDetail{
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	height: 200%;
	background-color: rgb(0,0,0,0.7);
}
#inner{
	width:500px;
	height: 500px;
	background-color: black;
	position: absolute;
}
#SearchMethod{
	width: 100%;
	margin: 0 auto;
}
#selectOption{
	width: 100%;
	height:53px;
	background: #510000;
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
	border:2px solid #993800;  
	
}
#search #bntBookSearch{ 
	background:#993800;
	color:#FFFEC6;
	width: 100px;
	height: 24px;
	border: 0;
	margin-top: 0;
	padding-top: 0;
	border-bottom:3px solid #993800; 
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
	border-bottom: 5px solid #510000;
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
		$("#bntBookSearch").click(function() {
			$("#list").empty()
			$.ajax({
				url : "bookSearch.do",
				type : "get",
				data : {"BookCode" : $("#BookCode").val()},
				dataType : "json",
				success : function(list) {
					console.log(list);
				
					$("#list").append("<ul>");
					$(list).each(function(index, obj) {
						$("#list").append("<li><a href='#' class='img'><img src='images/KakaoTalk_20190108_141119999.jpg'></a><p class='text'><span id='title'>제목 : <a href='#' class='title'>"
											+ obj.title.title
											+ "</a></span><br>저자 : <a href='#'>"
											+ obj.author.author
											+ "</a><br>역자 : "
											+ "<a href='#'>"+obj.translator.translator+"</a>"
											+ "<br>출판사 : "
											+ "<a href='#'>"+obj.pubName.pubName+"</a>"
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
	})
</script>
</head>
<nav id="BookDetail">
	<div id="inner">
	</div>
</nav>
<div id="SearchMethod">
	<div id="selectOption">
		<dir id="search">
			<select name="Method"> 
				<option value="도서 번호">도서 번호로</option>
				<option value="상세정보">상세정보</option>
				<option value="제목">제목으로</option>
			</select> <input type="text" id="BookCode"><input type="button" value="검색" id="bntBookSearch">
			
		</dir> 
	</div>
	<dir id="list" style="overflow:auto; height:0;">
	</dir>
</div>
</html>
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
#cateB{
	margin-left: 10px; 
}
#each{
	width: 80%;
	margin: 0 auto;
	color: white;
}
#each .box{
	margin-left: 10px;
}
.box span{
	font-size: 12px;
}
#each label {
	float:left;
	display:inline-block;
	width: 100px;	
	text-align: right;
	margin-right: 10px;
}

#search{
	margin-left: 40px; 
}
#search span{
	color: white;
	font-size: 10px;
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
		$("#BookDetail").css("margin-left","-100%").css("opacity",0);
		
		$(document).on("change","#Method",function(event) {
			$("#list").css("height","0px");
			if($("#Method").val()=="상세정보" || $("#Method").val()=="제목"){
				$("#selectOption").css("height","580px");
				$("#list").empty();
				$("#BookCode").remove();
				$("#each").remove();
				$("#Method").after("<fieldset id='each'></fieldset>");
				$("#each").append("<legend>상세 정보로 검색</legend>");
				$("#each").append("<label>제목 </label> <input type='text' id='title'><br>");
				$("#each").append("<label>저자 </label> <input type='text' id='author'><br>");
				$("#each").append("<label>역자 </label> <input type='text' id='translator'><br>");
				$("#each").append("<label>출판사 </label> <input type='text' id='pubName'><br>");
				
				$.ajax({
					url :"${pageContext.request.contextPath }/book/category.do",
					type : "get",
					dataType : "json", 
					success : function(list) {
						console.log(list);
						$("#each").append("<label>카테고리</label> <span>(대분류) </span> <select name='cateB' id='cateB'></select>");
						$(list.list).each(function(index, obj) {
							$("#cateB").append("<option value='" + obj.bCode + "'>" + obj.bName + "</option>");
						})
												
					}
					
				})
				
				
				/* $("#search").empty();
				$("#search").append("<select name='Method' id='Method'><option value='도서 번호'>도서 번호로</option><option value='제목'>제목으로</option>	<option value='상세정보'>상세정보</option></select> <input type='button' value='검색' id='bntBookSearch'>"); */				
			}else{
				$("#selectOption").css("height","53px");
				$("#search").empty();
				$("#each").remove();
				$("#search").append("<select name='Method' id='Method'><option value='도서 번호'>도서 번호로</option><option value='제목'>제목으로</option>	<option value='상세정보'>상세정보</option></select> <input type='text' id='BookCode'><input type='button' value='검색' id='bntBookSearch'>");
				
	
			}
		})
		
		$(document).on("change","#cateB",function(event){
			if($("#cateB").val()==-1){
				$("#cateMName").remove();
				$(".cateSName").remove();
				$("#cateM").remove();
				$("#cateS").remove();
			}else{
				$("#cateMName").remove();
				$(".cateSName").remove();
				$("#cateM").remove();
				$("#cateS").remove();
				$.ajax({
					url:"${pageContext.request.contextPath }/book/category.do",
					type:"get",
					data:{"cateB":$("#cateB").val()},
					dataType:"json",
					success:function(json){
						console.log(json);
						$("#each").append("<span id='cateMName'>(중분류)</span> <select name='cateM' id='cateM'></select>");
						 $(json.list).each(function(index, obj) {
							$("#cateM").append("<option value='" + obj.mCode + "'>" + obj.mName + "</option>");
						}) 
					}
				})
			}
			
			
		})
		
		$(document).on("change","#cateM",function(event){
			if($("#cateM").val()==-1){
				$(".cateSName").remove();
				$("#cateS").remove();
			}else{
				$(".cateSName").remove();
				$("#cateS").remove();
				$.ajax({
					url:"${pageContext.request.contextPath }/book/category.do",
					type:"get",
					data:{"cateM":$("#cateM").val(),"cateB":$("#cateB").val()},
					dataType:"json",
					success:function(json){
						console.log(json);
						$("#each").append("<span class='cateSName'>(소분류)</span> <select name='cateS' id='cateS'></select>");
						 $(json.list).each(function(index, obj) {
							$("#cateS").append("<option value='" + obj.sCode + "'>" + obj.sName + "</option>");
						}) 
					}
				})
			}
			
			
		})
		
		
		$(document).on("click","#bntBookSearch",function(event) {
			$("#list").empty();
			$.ajax({
				url : "${pageContext.request.contextPath }/bookSearch.do",
				type : "get",
				data : {"BookCode" : $("#BookCode").val(),"title" : $("#title").val(),"author" : $("#author").val(),"translator" : $("#translator").val(),"pubName" : $("#pubName").val(),"cateM":$("#cateM").val(),"cateB":$("#cateB").val(),"cateS":$("#cateS").val()},
				dataType : "json", 
				success : function(list) {
					console.log(list);
				
					$("#list").append("<ul>");
					$(list).each(function(index, obj) { 
						$("#list").append("<li><a href='#' class='bookinfo' data-bcode='"+ obj.bookCode.bookCode +"' onclick='return false;'><img src='${pageContext.request.contextPath }/upload/"+ obj.image.image +"'></a><p class='text'><span id='title'>제목 : <a href='#' class='bookinfo' data-bcode='"+ obj.bookCode.bookCode +"' onclick='return false;'>"
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
			$("#inner").append("<img src='${pageContext.request.contextPath }/images/xbutton_83749.png' id='bntx'>");
			$("#BookDetail").animate({"margin-left":"0", "opacity":1});
			$.ajax({
				url : "${pageContext.request.contextPath }/bookSearch.do",
				type : "get",
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
					$("#inner").append("<p>카테고리 : <br>"+list[0].bName.bName+"->"+list[0].mName.mName+"->"+list[0].sName.sName+"</p>");
					$("#inner").append("<table>");
						$("table").append("<tr><th>도서코드</th><th>대여기능여부</th></tr>");
					$(list).each(function(index, obj) {
							$("table").append("<tr><td><a href='${pageContext.request.contextPath}/book/modify.do?no=" + obj.bookCode.bookCode + "'>"+ obj.bookCode.bookCode +"</a></td><td>"+ obj.rentalPossible +"</td></tr>");
					})
					$("#inner").append("</p>");
										}
				
			})
			
		})
		$(document).on("click","#bntx",function(event) {
			$("#BookDetail").css("margin-left","-100%").css("opacity",0);
		})
	})
</script>
</head>
<nav id="BookDetail">
	<div id="inner">
		<img src="${pageContext.request.contextPath }/images/xbutton_83749.png" id="bntx">
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
			</select> <input type="text" id="BookCode"><input type="button" value="검색" id="bntBookSearch"> <span>아무것도입력하지않으면 모든책정보를확인하실수 있습니다.</span>
			
		</dir> 
	</div>
	<dir id="list" style="overflow:auto; height:0;">
	</dir>
</div>
</html>
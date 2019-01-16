<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
#overduetable table {
	border-collapse: collapse;
}
#overduetable th,td{
	border: 1px solid black;
}
#overduetable .tr:HOVER td{
	background: black;
	color: white;
	border: 1px solid white;
	
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	$(function() {
		$("#popup").dialog({
		      autoOpen: false,
		      show: {
		        effect: "blind",
		        duration: 0
		      },
		      hide: {
		        effect: "blind",
		        duration: 0
		      }
		});
		
		$(document).on("click","#bntAll",function(event) {
			var over = 0;
			$("#item").val(null);
			if($("#overdate").is(":checked")){
	            over = 1;
	        }else{
	        	over = 0;
	        }
			
			$.ajax({
				url : "overduedtail.do",
				type : "post",
				data : {"over" : over},
				dataType : "json", 
				success : function(list) {
					console.log(list);
					$("#overduetable table").empty();
					$("#overduetable table").append("<tr><th>대여번호</th><th>회원 이름</th><th>회원 번호</th><th>도서 제목</th><th>도서 코드</th><th>전화 번호</th><th>연채 일수</th></tr>");
					$(list).each(function(index, obj) {
						$("#overduetable table").append("<tr class='tr'><td>"+obj.rentalNo+"</td><td>"
								+obj.korName.korName+"</td><td>"
								+obj.memberNo.memberNo+"</td><td>"
								+obj.title.title+"</td><td>"
								+obj.bookCode.bookCode+"</td><td>"
								+obj.phone.phone+"</td><td>"
								+obj.overday+"</td></tr>");
					})
				}
				
			})
		})
		
		$(document).on("click","#search",function(event) {
			var over = 0;
		
			if($("#item").val().trim()==""){
				alert("정보를 입력해 주세요.");
				return;
			}
			if($("#overdate").is(":checked")){
	            over = 1;
	        }else{
	        	over = 0;
	        }
			
			
			$.ajax({
				url : "overduedtail.do",
				type : "post",
				data : {"selected" : $("#overduetable select").val(),"item" : $("#item").val(),"over" : over},
				dataType : "json", 
				success : function(list) {
					console.log(list);
					$("#overduetable table").empty();
					$("#overduetable table").append("<tr><th>대여번호</th><th>회원 이름</th><th>회원 번호</th><th>도서 제목</th><th>도서 코드</th><th>전화 번호</th><th>연채 일수</th></tr>");
					$(list).each(function(index, obj) {
						$("#overduetable table").append("<tr class='tr'><td>"+obj.rentalNo+"</td><td>"
								+obj.korName.korName+"</td><td>"
								+obj.memberNo.memberNo+"</td><td>"
								+obj.title.title+"</td><td>"
								+obj.bookCode.bookCode+"</td><td>"
								+obj.phone.phone+"</td><td>"
								+obj.overday+"</td></tr>");
					})
				}
				
			})
			
		})
		$("#overdate").change(function(){
			var over = 0;
			 $("#overduetable table").empty();
				$("#overduetable table").append("<tr><th>대여번호</th><th>회원 이름</th><th>회원 번호</th><th>도서 제목</th><th>도서 코드</th><th>전화 번호</th><th>연채 일수</th></tr>");
	        if($("#overdate").is(":checked")){
	            over = 1;
	            
	        }else{
	        	over = 0;
	        }
	        if($("#item").val().trim()!=""){
	        	$.ajax({
					url : "overduedtail.do",
					type : "post",
					data : {"selected" : $("#overduetable select").val(),"item" : $("#item").val(),"over" : over},
					dataType : "json", 
					success : function(list) {
						console.log(list);
						$("#overduetable table").empty();
						$("#overduetable table").append("<tr><th>대여번호</th><th>회원 이름</th><th>회원 번호</th><th>도서 제목</th><th>도서 코드</th><th>전화 번호</th><th>연채 일수</th></tr>");
						$(list).each(function(index, obj) {
							$("#overduetable table").append("<tr class='tr'><td>"+obj.rentalNo+"</td><td>"
									+obj.korName.korName+"</td><td>"
									+obj.memberNo.memberNo+"</td><td>"
									+obj.title.title+"</td><td>"
									+obj.bookCode.bookCode+"</td><td>"
									+obj.phone.phone+"</td><td>"
									+obj.overday+"</td></tr>");
						})
					}
					
				})
	        }else{
	        	$.ajax({
					url : "overduedtail.do",
					data : {"over" : over},
					type : "post",
					dataType : "json", 
					success : function(list) {
						console.log(list);
						$("#overduetable table").empty();
						$("#overduetable table").append("<tr><th>대여번호</th><th>회원 이름</th><th>회원 번호</th><th>도서 제목</th><th>도서 코드</th><th>전화 번호</th><th>연채 일수</th></tr>");
						$(list).each(function(index, obj) {
							$("#overduetable table").append("<tr class='tr'><td>"+obj.rentalNo+"</td><td>"
									+obj.korName.korName+"</td><td>"
									+obj.memberNo.memberNo+"</td><td>"
									+obj.title.title+"</td><td>"
									+obj.bookCode.bookCode+"</td><td>"
									+obj.phone.phone+"</td><td>"
									+obj.overday+"</td></tr>");
						})
					}
					
				})
	        }
	       
			
			
	    });
		$(document).on("dblclick",".tr",function(event) {
			$("#popup").dialog( "open" );
			var retNo = $(this).children("td").eq(0).text();
			$.ajax({
				url : "overduedtail.do",
				type : "post",
				data : {"rentalNo" : retNo},
				dataType : "json", 
				success : function(list) {
					console.log(list);
					$(list).each(function(index, obj) {
						$("#popup").empty();
						var rday = new Date(obj.rentalDate.rentalDate);
						var rmonth  = rday.getMonth()+1<10?"0"+(rday.getMonth()+1):(rday.getMonth()+1);
						var rdate = ((rday.getDate()<10)?"0"+rday.getDate():rday.getDate());
						var rdat = rday.getFullYear()+"-"+rmonth+"-"+ rdate;
						
						var sday = new Date(obj.returnSchedule.returnSchedule);
						var smonth  = sday.getMonth()+1<10?"0"+(sday.getMonth()+1):(sday.getMonth()+1);
						var sdate = ((sday.getDate()<10)?"0"+sday.getDate():sday.getDate());
						
						var sdat = sday.getFullYear()+"-"+smonth+"-"+ sdate;
						$("#popup").append("대여 번호 : "+ obj.rentalNo +"<br>회원 이름 :"+obj.korName.korName+"<br>회원 번호 : "+ obj.memberNo.memberNo +"<br>도서 제목 : "+ obj.title.title +"<br>도서 번호 : "+obj.bookCode.bookCode+"<br>대여일 : "+ rdat+"<br>반납예정일 : "+ sdat +"<br>연체일 : " +obj.overday);
					})
				}
				
			})
		})
	})
</script>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${AUTH == null }">
				<jsp:include page="FooterHeader/header.jsp" flush="false" />
			</c:when>
			<c:when test="${AUTH.admin == true }">
				<jsp:include page="FooterHeader/admin.jsp" flush="false" />
			</c:when>
			<c:when test="${AUTH.admin == false }">
				<jsp:include page="FooterHeader/guest.jsp" flush="false" />
			</c:when>
		</c:choose>
	</header>
	<div id="overduetable">
	<input type="button" value="전채 보기" id="bntAll">
	<select>
		<option value="memberNo">회원 번호</option>
		<option value="korName">이름</option>
		<option value="bookCode">도서 번호</option>
		<option value="title">도서 제목</option>
	</select>
	<input type="text" name="name" id="item">
	<input type="button" value="검색" id="search">
	
	<input type="checkbox" id="overdate">연채회원만 보기
		<table>
			<tr>
				<th>대여번호</th>
				<th>회원 이름</th>
				<th>회원 번호</th>
				<th>도서 제목</th>
				<th>도서 코드</th>
				<th>전화 번호</th>
				<th>연채 일수</th>			
			</tr>
			<c:forEach var="one" items="${list}" >
				<a href="#">
					<tr class="tr">
						<td>${one.rentalNo}</td>
						<td>${one.korName.korName}</td>
						<td>${one.memberNo}</td>
						<td>${one.title.title}</td>
						<td>${one.bookCode.bookCode}</td>
						<td>${one.phone.phone}</td>
						<td>${one.overday}</td>
					</tr>
				</a>     			
			</c:forEach>
		</table>
		<div id="popup" title="대여 상세 정보">

		</div>

	</div>
	<footer>

		<jsp:include page="FooterHeader/footer.jsp" flush="false" />

	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on("click","#overdate",function(event) {
			if($(this).val() == "전체 보기"){
				$(this).val("연채회원만 보기");
				$("#overduetable table").empty();
				
			}else {
				$(this).val("전체 보기");
				$("#overduetable table").empty();
			}
			$.ajax({
				url : "bookSearch.do",
				type : "post",
				data : {"over" : $(this).val()},
				dataType : "json", 
				success : function(list) {
					
				}
				
			})
		})
	})
</script>
</head>
<body>
	<div id="overduetable">
	<input type="button" value="연채회원만 보기" id="overdate">
	
	<select>
		<option>회원 번호</option>
		<option>이름</option>
		<option>도서 번호</option>
		<option>도서 제목</option>
	</select>
	<input type="text" name="name">
	<input type="button" value="검색">
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
	</div>
</body>
</html>
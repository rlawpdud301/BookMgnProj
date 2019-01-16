<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Pizza');
		data.addColumn('number', 'Populartiy');
		data.addRows([
			<c:forEach var="item" items="${ListCateB}">
				[ '${item.name}', ${item.count} ],
			</c:forEach>
		]);

		var options = { title : '나의 선호장르' };
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	
	<section>
		<form action="modify.do" method="post">
			<fieldset>
				<legend>나의 정보 보기</legend>
				<p>
					<label>회원 번호</label>
					<input type="text" value="${Member.memberNo }" readonly="readonly">
				</p>
				<p>
					<label>한글 이름</label>
					<input type="text" value="${Member.korName }" readonly="readonly">
				</p>
				<p>
					<label>영어 이름</label>
					<input type="text" value="${Member.engName }" readonly="readonly">
				</p>
				<p>
					<label>전화번호</label>
					<input type="text" value="${Member.phone }">
				</p>
				<p>
					<label>주민</label>
					<input type="text" value="${Member.jumin.substring(0,8) }******">
				</p>
				<p>
					<label>주소</label>
					<input type="text" value="${Member.address }">
				</p>
				<p>
					<label>이메일</label>
					<input type="text" value="${Member.email }">
				</p>
				<p>
					<label>사진</label>
					<img src="/BookMgnProj/upload/${Member.photo }">
				</p>
				<p>
					<a href="modify.do">정보수정하기</a>
				</p>
			</fieldset>
		</form>
		<div id="tab1">
			<table>
				<tr>
					<th>도서 번호</th>
					<th>도서명</th>
					<th>출판사</th>
					<th>저자</th>
					<th>대여 일자</th>
					<th>반납 기한</th>
				</tr>
				<c:forEach var="lists" items="${Lists }">
					<tr>
						<td>${lists.bookCode.bookCode }</td>
						<td>${lists.bookCode.title }</td>
						<td>${lists.publisher }</td>
						<td>${lists.bookCode.author }</td>
						<td><fmt:formatDate value="${lists.rentalDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${lists.returnSchedule }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="tab2">
			<table>
				<tr>
					<th>도서 번호</th>
					<th>도서명</th>
					<th>출판사</th>
					<th>저자</th>
					<th>대여 일자</th>
					<th>반납 일자</th>
					<th>반납 기한</th>
					<th>반납 여부</th>
				</tr>
				<c:forEach var="list" items="${List }">
					<tr>
						<td>${list.bookCode.bookCode }</td>
						<td>${list.bookCode.title }</td>
						<td>${list.publisher }</td>
						<td>${list.bookCode.author }</td>
						<td><fmt:formatDate value="${list.rentalDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${list.returnDate }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${list.returnSchedule }" pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${list.returnDate == null}">
								미반납
							</c:if>
							<c:if test="${list.returnDate != null}">
								반납
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="chart_div" style="width: 900px; height: 500px;"></div>
	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
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
<style>
	ul.tabs {
		margin: 0;
		padding: 0;
		float: left;
		list-style: none;
		height: 32px;
		border-bottom: 1px solid #eee;
		border-left: 1px solid #eee;
		width: 100%;
		font-family: "dotum";
		font-size: 12px;
	}
	
	ul.tabs li {
		float: left;
		text-align: center;
		cursor: pointer;
		width: 24.5%;
		height: 31px;
		line-height: 31px;
		border: 1px solid #eee;
		border-left: none;
		font-weight: bold;
		background: #fafafa;
		overflow: hidden;
		position: relative;
	}
	
	ul.tabs li.active {
		background: #FFFFFF;
		border-bottom: 1px solid #FFFFFF;
	}
	
	.tab_container {
		border: 1px solid #eee;
		border-top: none;
		clear: both;
		float: left;
		width: 100%;
		min-height: 500px;
		background: #FFFFFF;
	}
	
	.tab_content {
		padding: 5px;
		font-size: 12px;
		display: none;
	}
	
	.tab_container .tab_content ul {
		width: 100%;
		margin: 0px;
		padding: 0px;
	}
	
	.tab_container .tab_content ul li {
		padding: 5px;
		list-style: none
	}

	#container {
		width: 60%;
		margin: 50px auto;
	}
	
	table {
		margin-top: 10px;
		border-collapse: collapse;
		width: 90%;
		margin: 0 auto;
		text-align: center;
	}
	
	th, td {
		border: 1px solid black;
		font-size: 15px;
	}
	
	.td1 {
		width: 10%;
	}
	
	.td2 {
		width: 25%;
	}
	
	.td3 {
		width: 10%;
	}
	
	.td4 {
		width: 10%;
	}
	
	.td5, .td6, .td7 {
		width: 10%;
	}
	
	.td8 {
		width: 5%;
	}
</style>
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

		var options = { 'title' : '나의 선호장르', 'width': 800, 'height': 500 };
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	$(function () {

	    $(".tab_content").hide();
	    $(".tab_content:first").show();

	    $("ul.tabs li").click(function () {
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
	        $(".tab_content").hide()
	        var activeTab = $(this).attr("rel");
	        $("#" + activeTab).fadeIn()
	    });
	})
</script>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	
	<section>
		<div id="container">
			<ul class="tabs">
				<li class="active" rel="tab1">대여정보</li>
				<li rel="tab2">대여이력</li>
				<li rel="tab3">선호장르</li>
				<li rel="tab4">정보보기</li>
			</ul>
			
			<div class="tab_container">
				<div id="tab1" class="tab_content">
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
								<td class="td1">${lists.bookCode.bookCode }</td>
								<td class="td2">${lists.bookCode.title }</td>
								<td class="td3">${lists.publisher }</td>
								<td class="td4">${lists.bookCode.author }</td>
								<td class="td5"><fmt:formatDate value="${lists.rentalDate }"
										pattern="yyyy-MM-dd" /></td>
								<td class="td6"><fmt:formatDate value="${lists.returnSchedule }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- #tab1 -->
				
				<div id="tab2" class="tab_content">
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
								<td class="td1">${list.bookCode.bookCode }</td>
								<td class="td2">${list.bookCode.title }</td>
								<td class="td3">${list.publisher }</td>
								<td class="td4">${list.bookCode.author }</td>
								<td class="td5"><fmt:formatDate value="${list.rentalDate }"
										pattern="yyyy-MM-dd" /></td>
								<td class="td7"><fmt:formatDate value="${list.returnDate }"
										pattern="yyyy-MM-dd" /></td>
								<td class="td6"><fmt:formatDate value="${list.returnSchedule }"
										pattern="yyyy-MM-dd" /></td>
								<td class="td8">
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
				<!-- #tab2 -->
				
				<div id="tab3" class="tab_content">
					<div id="chart_div" style="width: 900px; height: 500px;"></div>
				</div>
				<!-- #tab3 -->
				
				<div id="tab4" class="tab_content">
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
				</div>
				<!-- #tab4 -->
				
			</div>
			<!-- .tab_container -->
			
		</div>
		<!-- #container -->
		
	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
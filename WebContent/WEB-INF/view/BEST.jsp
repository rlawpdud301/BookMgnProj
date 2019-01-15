<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
#best3cont .lankimg {
	width: 200px;
}

#best3cont div:HOVER img {
	width: 300px;
}

#best1 {
	border: 5px solid #FFD700;
}

#best2 {
	border: 5px solid #B8B8B2;
}

#best3 {
	border: 5px solid #964b00;
}
.other{
	border: 1px solid black;
}
</style>
<script>
  $( function() {
	  google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      $(list).each(function(index, obj) {
    	  
      })
      function drawVisualization() {
          var data = google.visualization.arrayToDataTable([
            ['제목', '${fristrentalDate}', '${lastrentalDate}', 'Average'],
            ['2004/05',    998,           450,      614.6],
            ['2005/06',    1268,          288,      682],
            ['2006/07',     807,           397,      623],
            ['2007/08',  968,           215,      609.4],
            ['2008/09',    1026,          366,      569.6],         
          ]);

          var options = {
            title : 'Monthly Coffee Production by Country',
            vAxis: {title: 'Cups'},
            hAxis: {title: 'Month'},
            seriesType: 'bars',
            series: {2: {type: 'line'}} 
          };

          var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
          chart.draw(data, options);
        }
	  
	var rangeDate = 31; // set limit day
	var setSdate, setEdate;
    $( "#fristrentalDate" ).datepicker({
    	showOn: "button",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: true, 
        buttonText: "Select date",
        dateFormat: 'yy-mm-dd',
        maxDate: 0,
        onSelect : function(selectDate){
            setEdate = selectDate;
            console.log(setEdate)
        }
      /* date = maxDate */
    });
    $( "#lastrentalDate" ).datepicker({
    	showOn: "button",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: true, 
        buttonText: "Select date",
        dateFormat: 'yy-mm-dd',
        maxDate: 0,
        onSelect: function(selectDate){
            var stxt = selectDate.split("-");
                stxt[1] = stxt[1] - 1;
            var sdate = new Date(stxt[0], stxt[1], stxt[2]);
            var edate = new Date(stxt[0], stxt[1], stxt[2]);
                edate.setDate(sdate.getDate() + rangeDate);
     
            $('#fristrentalDate').datepicker('option', {
                minDate: selectDate,
                maxDate: 0,
                beforeShow : function () {
                    $("#to").datepicker( "option", "maxDate", edate );
                    setSdate = selectDate;
                    console.log(setSdate)
            }});
            //to 설정
        }
      });
  } );
  </script>
</head>
<body>
	<div id="best3cont">
		<h1>Best!</h1>
		<p>검색하실 날짜를선택해주세요 : 
			<input type="text" id="lastrentalDate" value="${lastrentalDate }"> ~ 
			<input type="text" id="fristrentalDate" value="${fristrentalDate }"> 		 
			<input type="button" value="검색">
		</p>
		<c:forEach var="one" items="${list}" varStatus="Index">
			<c:choose>
				<c:when test="${Index.index == 0 }">
					<div id="best1">
						<input type="hidden" value="${one.bookCode.bookCode }" >
						<img src="${pageContext.request.contextPath }/images/1.jpg" class="lankimg">
						<h1>.st</h1>
						<img src="/BookMgnProj/upload/${one.image.image }">
						<h1>${one.title.title }</h1>
					</div>
				</c:when>
				<c:when test="${Index.index == 1 }">
					<div id="best2">
						<input type="hidden" value="${one.bookCode.bookCode }">
						<img src="${pageContext.request.contextPath }/images/2.jpg" class="lankimg">
						<h1>.st</h1>
						<img src="/BookMgnProj/upload/${one.image.image }">
						<h1> ${one.title.title }</h1>
					</div>
				</c:when>
				<c:when test="${Index.index == 2 }">
					<div id="best3">
						<input type="hidden" value="${one.bookCode.bookCode }">
						<img src="${pageContext.request.contextPath }/images/3.jpg" class="lankimg">
						<h1>.st</h1>
						<img src="/BookMgnProj/upload/${one.image.image }">
						<h1>${one.title.title }</h1>
					</div>
				</c:when>
				<c:otherwise>
					<div class="other"> 
						<input type="hidden" value="${one.bookCode.bookCode }">
						<h2>${Index.index+1}.st</h2>
						<img src="/BookMgnProj/upload/${one.image.image }">
						<b>${one.title.title }</b>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<div id="chart_div"></div>
	</div>
	
</body>
</html>
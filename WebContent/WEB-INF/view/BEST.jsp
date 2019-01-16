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
#best1,#best2,#best3,.other{
	width: 100%;
	background: white;
}
#best3cont div:HOVER .lankimg {
	width: 210px;
}
#best3cont *{
	float: left;
}
#best3cont div{
	
	margin-bottom: 20px ;	
}
best3cont img{
	width: 150px;
}

#best1 {
	/* border: 5px solid #FFD700; */	
} 
#best1 h1{
	/* color: #FFD700; */
}

#best2 {
	/* border: 5px solid #B8B8B2;  */
}
#best2 h1{
	/* color: #B8B8B2; */
}
#best3 { 
	/* border: 5px solid #964b00; */
}
#best3 h1{
	/* color: #964b00; */
}
.other{

	/* border: 5px solid black; */

}
</style>
<script>
  $( function() {
	 
      
	var rangeDate = 31; // set limit day
	var setSdate, setEdate;
    $( "#fristrentalDate" ).datepicker({
    	showOn: "button",
        buttonImage: "${pageContext.request.contextPath }/images/calendar.gif",
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
        buttonImage: "${pageContext.request.contextPath }/images/calendar.gif",
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
    
    /* $("#searchbnt").click(function() {
    	
    }) */
    $(document).on("click","#searchbnt",function(event) {
			$("#best3cont").empty();
			$.ajax({
				url : "${pageContext.request.contextPath }/best.do",
				type : "post",
				data : {"lastrentalDate" : $("#lastrentalDate").val() , "fristrentalDate" : $("#fristrentalDate").val()},
				dataType : "json", 
				success : function(list) {
					console.log(list);
					$(list).each(function(index, obj) {
						if(index==0){
							$("#best3cont").append("<div id='best1'><input type='hidden' value='"+ obj.bookCode.bookCode +"' ><img src='${pageContext.request.contextPath }/upload/"+ obj.image.image +"'><h1>"+ (index+1) +".st  "+ obj.title.title +"</h1></div>");
						}else if(index==1){
							$("#best3cont").append("<div id='best1'><input type='hidden' value='"+ obj.bookCode.bookCode +"' ><img src='${pageContext.request.contextPath }/upload/"+ obj.image.image +"'><h1>"+ (index+1) +".st  "+ obj.title.title +"</h1></div>");
						}else if(index==2){
							$("#best3cont").append("<div id='best2'><input type='hidden' value='"+ obj.bookCode.bookCode +"' ><img src='${pageContext.request.contextPath }/upload/"+ obj.image.image +"'><h1>"+ (index+1) +".st  "+ obj.title.title +"</h1></div>");
						}else{
							
						
							$("#best3cont").append("<div class='other'><input type='hidden' value='"+ obj.bookCode.bookCode +"' ><img src='${pageContext.request.contextPath }/upload/"+ obj.image.image +"'><h1>"+ (index+1) +".st  "+ obj.title.title +"</h1></div>");
						}
					})
				}
				
			})
									
		})
  } );
  </script>
</head>
<body>
	<h1>Best!</h1>
		<p>날짜를선택해주세요 : 
			<input type="text" id="lastrentalDate" value="${lastrentalDate }" readonly="readonly"> ~ 
			<input type="text" id="fristrentalDate" value="${fristrentalDate }" readonly="readonly"><input type="button" value="검색" id="searchbnt">
		</p>
	<div id="best3cont">
		
		<c:forEach var="one" items="${list}" varStatus="Index">
			<c:choose>
				<c:when test="${Index.index == 0 }">
					<div id="best1">
						<input type="hidden" value="${one.bookCode.bookCode }" >						
						
						<img src="${pageContext.request.contextPath }/upload/${one.image.image }">
						<h1>${Index.index+1}.st  ${one.title.title }</h1>
					</div>
				</c:when>
				<c:when test="${Index.index == 1 }">
					<div id="best2">
						<input type="hidden" value="${one.bookCode.bookCode }">
						
						<img src="/BookMgnProj/upload/${one.image.image }"><br>
						<h1>${Index.index+1}.st  ${one.title.title }</h1>
					</div>
				</c:when>
				<c:when test="${Index.index == 2 }">
					<div id="best3">
						<input type="hidden" value="${one.bookCode.bookCode }">
						
						
						<img src="/BookMgnProj/upload/${one.image.image }">
						<h1>${Index.index+1}.st ${one.title.title }</h1>
					</div>
				</c:when>
				<c:otherwise>
					<div class="other"> 
						<input type="hidden" value="${one.bookCode.bookCode }">
						
						<img src="/BookMgnProj/upload/${one.image.image }">
						<h2>${Index.index+1}.st  ${one.title.title }</h2>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
</body>
</html>
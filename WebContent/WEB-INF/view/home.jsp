<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

section{
	width: 60%; 
	margin: 50px auto; 
}

#banner img{
	width: 100%;
}
#searchBookTitle{
	width: 30%;
	height: 500px;
	background: #5D5D5D;
	color: white; 
	text-align: center;
	font-size: 30px;
}
#searchBookTitle p{
	/* margin-top: 60px; */
}
#searchBookTitle #text { 
	font-size: 30px;
	width: 200px;
}
#searchBookTitle #bnt{
	font-size: 26px;
	background: white;
	color: black;
	border: 1px solid white;
} 
#searchBookTitle p{
	margin-top: 200px;
	margin-bottom: 10px;  
}
section #bookSearch{
	width: 100%;
	margin-top: 100px;
	margin-bottom: 500px;
}
#best{
	background: #9FD4CA;
	/* border: 10px solid #E1527D; */
	border-radius: 5px  5px 0 0;
}
</style>
 
</head>
<body>   
	<header>
		<jsp:include page="FooterHeader/header.jsp" flush="false" />  
	</header> 

	

	<section>
		<div id="banner">
			<img src="${pageContext.request.contextPath }/images/베너2.jpg">
					
		</div>
		<div id="bookSearch">
			<jsp:include page="/WEB-INF/view/bookSearch.jsp" flush="false" />
		</div>
		<div id="best">
			<jsp:include page="/WEB-INF/view/BEST.jsp" flush="false" />
		</div>				
	</section>
	
	<footer>
		<jsp:include page="FooterHeader/footer.jsp" flush="false" />
	</footer>

</body>
</html>
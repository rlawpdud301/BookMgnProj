<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


#img{
	width: 60%;
  
}
#contaa{
	width: 20%;

}
</style>
 
</head>
<body>   
	<header>
		<jsp:include page="FooterHeader/header.jsp" flush="false" />  
	</header>
	
	<section>
		<%-- <div id="bookSearch">
			<jsp:include page="/WEB-INF/view/bookSearch.jsp" flush="false" />
		</div> --%>
		
		<%-- <div id="best">
			<jsp:include page="/WEB-INF/view/BEST.jsp" flush="false" />
		</div> --%>
	</section>

	<footer>
		<jsp:include page="FooterHeader/footer.jsp" flush="false" />
	</footer>

</body>
</html>
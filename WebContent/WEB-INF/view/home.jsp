<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
 
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
	<section>
		<div id="bookSearch">
			<jsp:include page="/WEB-INF/view/bookSearch.jsp" flush="false" />
		</div>
	</section>
	<%-- <section id="best">
		<jsp:include page="/WEB-INF/view/BEST.jsp" flush="false" />
	</section> --%>

	<footer>

		<jsp:include page="FooterHeader/footer.jsp" flush="false" />

	</footer>

</body>
</html>
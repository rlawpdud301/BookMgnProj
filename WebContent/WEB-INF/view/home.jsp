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

#img{
	width: 60%;
}
#contaa{
	width: 20%;
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
	border:2px solid #E1527D;  
	
}
#search #bntBookSearch{ 
	background:#E1527D;
	color:#FFFEC6;
	width: 100px;
	height: 24px;
	border: 0;
	margin-top: 0;
	padding-top: 0;
	border-bottom:3px solid #E1527D; 
}
#selectOption{
	width: 100%;
	height:53px;
	background: #9FD4CA;
	border-radius: 5px 5px 0 0;
	line-height: 70px; 
	/* border: 3px solid #AB4A12; */  
}
section{
	height: 700px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on("click","#bntBookSearch",function(event) {
			alert($("#BookCode").val());
			location.href = "bookSearch.do?title="+$("#BookCode").val();
		})
		
	})
</script>
</head>
<body>   
	<header>
		<jsp:include page="FooterHeader/header.jsp" flush="false" />  
	</header> 

	

	<section>
		<div id="banner">
			<div id="selectOption">
				<dir id="search">
					<input type="text" id="BookCode" placeholder="제목을 입력해주세요"><input type="button" value="검색" id="bntBookSearch"> <span>아무것도입력하지않으면 모든책정보를확인하실수 있습니다.</span>						
				</dir>
			</div>
			<img src="${pageContext.request.contextPath }/images/베너2.jpg">
					
		</div>
		<%-- <div id="bookSearch">
			<jsp:include page="/WEB-INF/view/bookSearch.jsp" flush="false" />
		</div>
		<div id="best">
			<jsp:include page="/WEB-INF/view/BEST.jsp" flush="false" />
		</div> --%>				
	</section>
	
	
	
	<footer>
		<jsp:include page="FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
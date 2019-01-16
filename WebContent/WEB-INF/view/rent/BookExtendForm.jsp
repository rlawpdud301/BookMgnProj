<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	$("#go").click(function() {
		if($("#bookCode").val() == ""){
			alert("도서코드를 입력해주세요");
		}else{
			$.ajax({
				url : "bookExtend.do",
				type : "post",
				data : {"bookCode" : $("#bookCode").val()},
				dataType : "json", 
				success : function(st) {
					console.log(st);
					alert(st);
					location.reload();
				}
				
			})
		}
	})
	$("#bookBtn").click(function() {
			$("#Overdueinfo").css("display","block");
			
		})
});  

</script>
<style>
	.butt {
	width: 80px;
	height: 20.5px;
}
body, html {
	width: 100%;
	height: 100%;
	background: #FFFFF8;
	color: #353535;
}

#Home {
	width: 75%;
	margin: 0 auto;
}

#null {
	height: 55px;
}

#header {
	width: 100%;
	height: 55px;
	border-bottom: 3px solid #510000;
	position: fixed;
	background: white;
}

#header img {
	margin: 5px;
	width: 100px;
}

#menu {
	width: 80%;
	margin: 0 auto;
	color: #cd853f;
	height: 55px;
	font-size: 14px;
}

#header a {
	color: #cd853f;
	text-decoration: none;
	text-align: center;
	font-size: 13px;
	padding: 5px;
}

#header a:HOVER {
	font-size: 16px;
	color: #751400;
}

#header #login {
	font-size: 15px;
	color: #cd853f;
	float: right;
}

#header #login:HOVER {
	font-size: 16px;
	color: #cd853f;
}

#header #insert {
	font-size: 15px;
	float: right;
}

#cont {
	clear: both;
}

#null {
	height: 57px;
}

#footer {
	border-top: 3px solid #510000;
	text-align: center;
	font-size: 15px;
	color: #6F6F6F;
	clear: both;
	background: white;
}

#footer ul {
	padding: 10px;
	margin: 10px;
	list-style: none;
}

#footer ul a {
	text-decoration: none;
	font-size: 14px;
	color: #6F6F6F;
}
#Overdueinfo {
	display: none;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>

	<section>
		<fieldset>
			<p>
				<label>도서 코드</label>
				<input type="text" name="bookCode" id="bookCode">
				<input type="button" value="도서 검색" id="bookBtn">
			</p>
			<p>
				<input type="submit" value="연장" id="go">
				<input type="reset" value="취소">
			</p>
		</fieldset>
	<div id="Overdueinfo">
			<jsp:include page="/WEB-INF/view/rent/bookReturnOverdueinfo.jsp" flush="false" />
		</div>
	</section>
	<footer>

		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />

	</footer>
</body>
</html>
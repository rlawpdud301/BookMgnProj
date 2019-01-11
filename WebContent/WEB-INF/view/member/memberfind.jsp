<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#find {
	width: 70%;
	margin: 0 auto;
}

#find h1 {
	float: left;
	width: 100%;
	margin-top: 200px;
	margin-left: 40px;
	color: #510000;
}

#find legend {
	font-size: 1.2em;
	font-weight: bold;
	margin: 20px;
}

#feldid {
	width: 500px;
	float: left;
	margin: 20px 20px;
	background: white;
}

#feldpw {
	width: 500px;
	float: left;
	margin: 20px 20px;
	background: white;
}

#find label {
	float: left;
	width: 80px;
	text-align: right;
	margin-right: 10px;
}

#find input {
	width: 80px;
}

#find p {
	margin: 20px;
}

#find p #bntid {
	float: right;
	margin: 10px;
}

#find p #bntpw {
	float: right;
	margin: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on("click","#bntid",function(event) {
			if ($("#name").val().trim()=="") {
				alert("이름을 입력해주세요."); 
				return;
			}
			var pattern = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
			if(pattern.test($("#name").val().trim())==false){
				alert("이름을 정확하게 입력해주세요.");
				return;
			}
		})
		
	})
</script>
</head>
<body>
	<header>
		<c:choose>
			<c:when test="${AUTH == null }">
				<jsp:include page="/WEB-INF/view/FooterHeader/header.jsp"
					flush="false" />
			</c:when>
			<c:when test="${AUTH.admin == true }">
				<jsp:include page="/WEB-INF/view/FooterHeader/admin.jsp"
					flush="false" />
			</c:when>
			<c:when test="${AUTH.admin == false }">
				<jsp:include page="/WEB-INF/view/FooterHeader/guest.jsp"
					flush="false" />
			</c:when>
		</c:choose>
	</header>
	<section>
		<div id="find">
			<h1>아이디 / 비밀번호 찾기</h1>

			<fieldset id="feldid">
				<legend>아이디 찾기 </legend>
				<p>
					<label>이름 </label> <input type="text" id="name">
				</p>
				<p>
					<label>전화 번호 </label> <select id="idtel1">
						<option value="010">010</option>
						<option value="017">017</option>
						<option value="011">011</option>
						<option value="016">016</option>
					</select> - <input type="number" id="idtel2"> - <input type="number"
						id="idtel3">
				</p>
				<p>
					<input type="button" value="찾기" id="bntid">
				</p>
			</fieldset>


			<fieldset id="feldpw">
				<legend>비밀번호 찾기</legend>
				<p>
					<label>아이디 </label> <input type="text" name="nameid">
				</p>
				<p>
					<label>전화 번호 </label> <select id="pwtel1">
						<option value="010">010</option>
						<option value="017">017</option>
						<option value="011">011</option>
						<option value="016">016</option>
					</select> - <input type="number" id="pwtel2"> - <input type="number"
						id="pwtel3">
				</p>
				<p>
					<input type="button" value="찾기" id="bntpw">
				</p>
			</fieldset>

		</div>
	</section>
	<footer>

		<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp"
			flush="false" />

	</footer>
</body>
</html>
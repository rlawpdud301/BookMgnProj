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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$( "#dialog" ).dialog();
		$(document)
				.on(
						"submit",
						"#f1",
						function(event) {
							if ($("#name").val().trim() == "") {
								alert("이름을 입력해주세요.");
								return false;
							}
							var patternname = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
							if (patternname.test($("#name").val().trim()) == false) {
								alert("이름을 정확하게 입력해주세요.");
								return false;
							}
							var patternphone = /^\d{3}-\d{3,4}-\d{4}$/;
							var phone = $("#idtel1").val() + "-"
									+ $("#idtel2").val() + "-"
									+ $("#idtel3").val()
							if (patternphone.test(phone) == false) {
								alert("휴대폰 번호를 정확하게 입력해주세요.");
								return false;
							}

						})

		$(document).on(
				"submit",
				"#f2",
				function(event) {
					if ($("#id").val().trim() == "") {
						alert("아이디를 입력해주세요.");
						return false;
					}
					var patternid = /^[A-Z]{1}[0-9]{4}$/;
					if (patternid.test($("#id").val().trim()) == false) {
						alert("아이디를 정확하게 입력해주세요.");
						return false;
					}
					var patternphone2 = /^\d{3}-\d{3,4}-\d{4}$/;
					var phone2 = $("#pwtel1").val() + "-" + $("#pwtel2").val()
							+ "-" + $("#pwtel3").val()
					if (patternphone2.test(phone2) == false) {
						alert("휴대폰 번호를 정확하게 입력해주세요.");
						return false;
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
			<form action="find.do" method="post" id="f1">
				<fieldset id="feldid">
					<legend>아이디 찾기 </legend>
					<p>
						<label>이름 </label> <input type="text" id="name"
							placeholder="이름 입력" name="name">
					</p>
					<p>
						<label>전화 번호 </label> <select id="idtel1" name="tel1">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select> - <input type="tel" id="idtel2" maxlength="4"
							title="전화번호를 입력하세요." name="tel2"> - <input type="tel"
							maxlength="4" title="전화번호를 입력하세요." id="idtel3" name="tel3">
					</p>
					<p>
						<input type="submit" value="찾기" id="bntid">
					</p>
				</fieldset>
			</form>
			<form action="find.do" method="post" id="f2">
				<fieldset id="feldpw">
					<legend>비밀번호 찾기</legend>
					<p>
						<label>아이디 </label> <input type="text" id="id"
							placeholder="아이디 입력" name="id">
					</p>
					<p>
						<label>전화 번호 </label> <select id="pwtel1" name="tel1">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select> - <input type="tel" id="pwtel2" maxlength="4"
							title="전화번호를 입력하세요." name="tel2"> - <input type="tel"
							maxlength="4" title="전화번호를 입력하세요." id="pwtel3" name="tel3">
					</p>
					<p>
						<input type="submit" value="찾기" id="bntpw">
					</p>
				</fieldset>
			</form>
		</div>
		<c:choose>
			<c:when test="${result != null }">
				<div id="dialog" title="">
					<p>${result}</p>				
				</div>
			</c:when>
		</c:choose>
	</section>
	<footer>

		<jsp:include page="/WEB-INF/view/FooterHeader/footer.jsp"
			flush="false" />

	</footer>
</body>
</html>
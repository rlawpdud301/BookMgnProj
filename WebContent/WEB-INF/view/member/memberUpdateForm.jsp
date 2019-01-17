<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#reset").click(function(){
			location.href = "search.do";
		})
	})


</script>
<style>
	fieldset {
		width: 600px;
		margin:0 auto;
	}
	label {
		width: 120px;
		float: left;
		padding-left: 157px;
	}

	.telbox {
		width: 41px;
	}
	
	.emailbox {
		width: 70px;
	}

	#emailbox {
		width: 70px;
	}

	#ebox {
		width: 90px;
		height: 25px;
	}
	.error,.error2,.error3{
			color:red;
			display: none;
			font-size:12px;
	}
	
	#input_text{
		display:none;
	}
	
	#adminpass{
		display:none;
	}
	.ju{
		width:75px;
	}
	img{
		text-align: center;
		padding-left: 177px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
		<form action="update.do" method="post">
			<fieldset>
				<legend>특이사항 입력</legend>
				<p>
				<!-- <label>사진</label> -->
				<img src="${pageContext.request.contextPath }/upload/${Member.photo }" width=200 height=200>
				</p>
				<br>
				<p>
					<label>회원번호</label>
					<input type="text" name="no" value="${Member.memberNo }" readonly="readonly"> 
				</p>
				<br>
				<p>
					<label>한글이름</label> 
					<c:set var="kname" value="${Member.korName }"></c:set>
					<input type="text" name="korName" maxlength="4" id="korName" value="${fn:substring(kname,0,2)}*" readonly="readonly">
				</p>
				<br>
				<p>
					<c:set var="ename" value="${Member.engName }"></c:set>
					<label>영어이름</label> 
					<input type="text" name="engName" maxlength="50" id="engName" value="${fn:substring(ename,0,2)}*" readonly="readonly">
				</p>
				<br>
				<p>
					<label>전화번호</label> 
					<c:set var='phone' value="${Member.phone }"></c:set>
					<input type="text"  class="telbox" value="${fn:substring(phone,0,3)}" readonly="readonly">
					- <input type="text" name="tel2" class="telbox" maxlength="4" id="tel2" value="${fn:substring(phone,4,8)}" readonly="readonly">			
					- <input type="text" name="tel3" class="telbox" maxlength="4" id="tel3" value="${fn:substring(phone,0,0)}****" readonly="readonly">
				</p>
				<br>
				<p>	
					<label>주민등록번호</label>
					<c:set var='jumin' value="${Member.jumin }"></c:set>
					<input type="text" name="jumin1" class="ju" id="jumin1" maxlength="6" value="${fn:substring(jumin,0,6) }" readonly="readonly"> 
					- <input type="password" name="jumin2" class="ju" id="jumin2" maxlength="7" value="${fn:substring(jumin,0,0)}******" readonly="readonly">
				</p>
				<br>	
				<p>
				<c:set var="email" value="${fn:split(Member.email,'@')}"></c:set>
				<label>이메일</label> 
				<input type="text" class="emailbox" name="email1" id="email1" value="${email[0] }" readonly="readonly">
				@ <input type="text" class="emailbox" name="email2" id="email2" value="${fn:substring(email[1],0,0) }*******" readonly="readonly">				
				</p>
				<br>
				<p>
					<c:set var="address" value="${fn:split(Member.address,',') }"></c:set>
					<label>우편번호</label> 
					<input type="text" size="20" id="address" name="address" id="address" value="${address[0]}" readonly="readonly">
				</p>
				<br>
				<p>
					<label>주소</label> 
					<input type="text" id="address2" name="address2" id="address2" value="${fn:substring(address[1],0,0) }*******" readonly="readonly">
				</p>
				<br>
				<p>
				<label>특이사항</label>
				<input type="text" name="uni" id="uni">
				</p>
				<br>
				<p align="center">
					<input type="submit" value="완료">
					<input type="button" value="돌아가기" id="reset">
				</p>
				<input type="text" maxlength="0" id="input_text">
			</fieldset>
		</form>
	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
	$('#emailbox').change(function(){
		$("#emailbox option:selected").each(function(){
			if($(this).val() == "1"){
				$("#email2").val('');
				$("#email2").attr("disabled",false);
			}else{
				$('#email2').val($(this).text());
				$('#email2').attr("disabled",true);
			}
		});
	});
});	
	$(function(){	
	$("#checkbox").click(function(){
			$("input[name=checkbox]:checked").each(function(){
			var password = "1234";
			var inputString = prompt('문자열을 입력하세요', '기본 값 문자열');
			if(inputString == password){
				$('input[name=checkbox]').prop('checked',true);
			}else{
				confirm("틀렸습니다.");
				$('input[name=checkbox]').prop('checked',false);
			}
		})
	});
	$(function(){
		$("#button").click(function(){
			window.open("/BookMgnProj/post.do",'window','width=400, height=200');
		})
	});
	$(function(){
			
		$("#f1").submit(function(){
			$(".error").css("display","none");
			var pass = $("input[name='password']").val();
			var pass2 = $("input[name='repassword']").val();
			var korname = $("input[name='korName']").val();
			var engname = $("input[name='engName']").val();
			var tel1 = $("input[name='tel']").val();
			var tel2 = $("input[name='tel2']").val();
			var tel3 = $("input[name='tel3']").val();
			var email1 = $("input[name='email1']").val();
			var email2 = $("input[name='email2']").val();
			var address = $("input[name='address']").val();
			var address2 = $("input[name='address2']").val();
			var regpass = /^[a-z0-9!@#$%]{8,15}$/i;
			var regName = /^[a-zA-Z]{3,20}$/;
			if(pass == ""){
				$("input[name='password']").nextAll(".error").css("display","inline");
				$("input[name='password']").focus();
				return false;
			}
			if(!regpass.test(pass)){
				$("input[name='password']").nextAll(".error2").css("display","inline");
				$("input[name='password']").focus();
				return false;
			}	
			if(pass2 == ""){
				$("input[name='repassword']").nextAll(".error").css("display","inline");
				$("input[name='repassword']").focus();
				return false;
			}
			if(pass != pass2){
				$("input[name='repassword']").nextAll(".error2").css("display","inline");
				$("input[name='repassword']").focus();
				return false;
			}
			if(korname == ""){
				$("input[name='korName']").nextAll(".error").css("display","inline");
				$("input[name='korName']").focus();
				return false;
			}	
			if(engname == ""){
				$("input[name='engName']").nextAll(".error2").css("display","inline");
				$("input[name='engName']").focus();
				return false;
			}
			if(!regName.test(engname)){
				$("input[name='engName']").nextAll(".error").css("display","inline");
				$("input[name='engName']").focus();
				return false;
			}	
			if(tel1 == ""){
				$("input[name='tel1']").nextAll(".error").css("display","inline");
				$("input[name='tel1']").focus();
				return false;
			}
			if(tel2 == ""){
				$("input[name='tel2']").nextAll(".error2").css("display","inline");
				$("input[name='tel2']").focus();
				return false;
			}
			if(tel3 == ""){
				$("input[name='tel3']").nextAll(".error3").css("display","inline");
				$("input[name='tel3']").focus();
				return false;
			}
			if(email1 == ""){
				$("input[name='email1']").nextAll(".error").css("display","inline");
				$("input[name='email1']").focus();
				return false;
			}
			if(email2 == ""){
				$("input[name='email2']").nextAll(".error2").css("display","inline");
				$("input[name='email2']").focus();
				return false;
			}
			if(address == ""){
				$("input[name='address']").nextAll(".error").css("display","inline");
				$("input[name='address']").focus();
				return false;
			}
			if(address2 == ""){
				$("input[name='address2']").nextAll(".error").css("display","inline");
				$("input[name='address2']").focus();
				return false;
			}
			alert("회원가입을 축하합니다.")
		})
		$("#password").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='password']").nextAll(".error").css("display","none");
				$("input[name='password']").nextAll(".error2").css("display","none");
			}
		})
		$("#repassword").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='repassword']").nextAll(".error").css("display","none");
				$("input[name='repassword']").nextAll(".error2").css("display","none");
			}
		})
		$("#korName").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='korName']").nextAll(".error").css("display","none");
			}
		})
		$("#engName").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='engName']").nextAll(".error").css("display","none");
				$("input[name='engName']").nextAll(".error2").css("display","none");
			}
		})
		$("#tel2").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='tel2']").nextAll(".error2").css("display","none");
			}
		})
		$("#tel3").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='tel3']").nextAll(".error3").css("display","none");
			}
		})
		$("#email1").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='email1']").nextAll(".error").css("display","none");
			}
		})
		$("#email2").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='email2']").nextAll(".error2").css("display","none");
			}
		})
		$("#address").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='address']").nextAll(".error").css("display","none");
			}
		})
		$("#address2").keyup(function() {
			if($(this).val().length > $("#input_text").attr('maxlength')){
				$("input[name='address2']").nextAll(".error").css("display","none");
			}
		})
		
		
	})
});
</script>
<style>
fieldset {
	width: 600px;
}

label {
	width: 120px;
	float: left;
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
</style>
</head>
<body>
	<form action="" method="post" id="f1">
		<fieldset>
			<legend>회원가입하기</legend>
			<p>
				<label>비밀번호</label> <input type="password" name="password" id="password">
				<span class="error">비밀번호를 입력하세요</span>
				<span class="error2">영어,숫자,특수문자(8~15)자로 입력해주세요</span>
			</p>
			<p>
				<label>비밀번호 확인</label> <input type="password" name="repassword" id="repassword">
				<span class="error">비밀번호를 입력하세요</span>
				<span class="error2">비밀번호가 일치하지않음</span>
			</p>
			<p>
				<label>한글이름</label> 
				<input type="text" name="korName" maxlength="4" id="korName">
				<span class="error">이름을 입력해주세요</span>
			</p>
			<p>
				<label>영어이름</label> <input type="text" name="engName" maxlength="50" id="engName">
				<span class="error">영어로만 입력해주세요</span>
				<span class='error2'>영어이름을 입력해주세요</span>
			</p>
			<p>
				<label>전화번호</label> 
				<select name="tel1">
					<option>010</option>
					<option>017</option>
					<option>011</option>		
				</select>
				<span class="error">앞자리를 입력해주세요</span> 
				- <input type="text" name="tel2" class="telbox" maxlength="4" id="tel2">			
				- <input type="text" name="tel3" class="telbox" maxlength="4" id="tel3">
				<span class="error2">중간자리를 입력해주세요</span> 
				<span class="error3">마지막 자리를 입력해주세요</span> 
			</p>
			<label>이메일</label> 
			<input type="text" class="emailbox" name="email1" id="email1">
			@ <input type="text" class="emailbox" name="email2" id="email2">
			<select name="emailbox" id="emailbox">
				<option value="" selected>선택하세요</option>
				<option value="naver.com">naver.com</option>
				<option value="google.com">google.com</option>
				<option value="daum.net">daum.net</option>
				<option value="1">직접입력</option>
			</select>				
				<span class="error">이메일 앞자리를 입력하세요</span>
				<span class="error2">이메일 뒷자리를 입력하세요</span>
			<p>
				<label>우편번호</label> 
				<input type="text" size="20" id="address" name="address" id="address">
				<input type="button" value="검색" id="button">
				<span class="error">우편번호를 입력해주세요</span> 
			</p>
			<p>
				<label>주소</label> 
				<input type="text" id="address2" name="address2" id="address2">
				<span class=error>상세주소를 입력해주세요</span>
			</p>
			<p>
				<label>관리자</label> <input type="checkbox" id="checkbox" name="checkbox">관리
			</p>
			<p>
				<label>특이사항</label> <input type="text">
			</p>
			<p align="center">
				<input type="submit" value="가입하기">
				<input type="reset" value="취소">
			</p>
			<input type="text" maxlength="0" id="input_text">
		</fieldset>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="modify.do" method="post" id="f1" enctype="multipart/form-data">
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
				<input type="text" name="korName" maxlength="4" id="korName" value="${Member.korName }">
				<span class="error">이름을 입력해주세요</span>
			</p>
			<p>
				<label>영어이름</label> <input type="text" name="engName" maxlength="50" id="engName" value="${Member.engName }">
				<span class="error">영어로만 입력해주세요</span>
				<span class='error2'>영어이름을 입력해주세요</span>
			</p>
			<p>
				<label>전화번호</label> 
				<select name="tel1">
					<option>010</option>
					<option>017</option>
					<option>011</option>
					<option>016</option>		
				</select>
				<span class="error">앞자리를 입력해주세요</span> 
				- <input type="text" name="tel2" class="telbox" maxlength="4" id="tel2">			
				- <input type="text" name="tel3" class="telbox" maxlength="4" id="tel3">
				<span class="error2">중간자리를 입력해주세요</span> 
				<span class="error3">마지막 자리를 입력해주세요</span> 
			</p>
			<p>	
				<label>주민등록번호</label>
				<input type="text" name="jumin1" class="ju" id="jumin1" maxlength="6">
				- <input type="password" name="jumin2" class="ju" id="jumin2" maxlength="7">
				<input type="button" id="duplejumin" name="duplejumin" value="중복체크">
				<span class="error">주민등록 앞번호자리를 입력해주세요</span>
				<span class="error2">주민등록번호 뒷자리를 입력해주세요</span>
			</p>	
			<p>
			
			<p>
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
			</p>
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
			<label>파일명선택</label>
			<input type="file" name="file1" id="file1">
			</p>
			<p align="center">
				<input type="submit" value="수정하기">
				<input type="reset" value="취소">
			</p>
			<input type="text" maxlength="0" id="input_text">
		</fieldset>
	</form>
</body>
</html>
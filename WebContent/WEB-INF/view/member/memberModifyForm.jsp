<%@page import="com.yi.BookMgnProj.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#emailbox').change(function() {
			$("#emailbox option:selected").each(function() {
				if ($(this).val() == "1") {
					$("#email2").val('');
					$("#email2").attr("disabled", false);
				} else {
					$('#email2').val($(this).text());
					$('#email2').attr("disabled", true);
				}
			});
		});

		$("#button").click(
				function() {
					window.open("/BookMgnProj/post.do", 'window',
							'width=400, height=200');
				});

		$("#f1").submit(
				function() {
					$(".error").css("display", "none");

					var pass = $("input[name='password']").val();
					var pass2 = $("input[name='repassword']").val();

					var tel1 = $("input[name='tel']").val();
					var tel2 = $("input[name='tel2']").val();
					var tel3 = $("input[name='tel3']").val();

					var email1 = $("input[name='email1']").val();
					var email2 = $("input[name='email2']").val();

					var address = $("input[name='address']").val();
					var address2 = $("input[name='address2']").val();

					var regpass = /^[a-z0-9!@#$%]{8,15}$/i;
					var regName = /^[a-zA-Z]{3,20}$/;

					if (pass != "" || pass != "") {
						if (!regpass.test(pass)) {
							$("input[name='password']").nextAll(".error2").css(
									"display", "inline");
							$("input[name='password']").focus();
							return false;
						}

						if (pass != pass2) {
							$("input[name='repassword']").nextAll(".error2")
									.css("display", "inline");
							$("input[name='repassword']").focus();
							return false;
						}
						
						$("#password").keyup(
								function() {
									if ($(this).val().length > $("#input_text").attr(
											'maxlength')) {
										$("input[name='password']").nextAll(".error").css(
												"display", "none");
										$("input[name='password']").nextAll(".error2").css(
												"display", "none");
									}
								});

						$("#repassword").keyup(
								function() {
									if ($(this).val().length > $("#input_text").attr(
											'maxlength')) {
										$("input[name='repassword']").nextAll(".error").css(
												"display", "none");
										$("input[name='repassword']").nextAll(".error2").css(
												"display", "none");
									}
								});
					}

					if (tel1 == "") {
						$("input[name='tel1']").nextAll(".error").css(
								"display", "inline");
						$("input[name='tel1']").focus();
						return false;
					}

					if (tel2 == "") {
						$("input[name='tel2']").nextAll(".error2").css(
								"display", "inline");
						$("input[name='tel2']").focus();
						return false;
					}

					if (tel3 == "") {
						$("input[name='tel3']").nextAll(".error3").css(
								"display", "inline");
						$("input[name='tel3']").focus();
						return false;
					}

					if (email1 == "") {
						$("input[name='email1']").nextAll(".error").css(
								"display", "inline");
						$("input[name='email1']").focus();
						return false;
					}

					if (email2 == "") {
						$("input[name='email2']").nextAll(".error2").css(
								"display", "inline");
						$("input[name='email2']").focus();
						return false;
					}

					if (address == "") {
						$("input[name='address']").nextAll(".error").css(
								"display", "inline");
						$("input[name='address']").focus();
						return false;
					}

					if (address2 == "") {
						$("input[name='address2']").nextAll(".error").css(
								"display", "inline");
						$("input[name='address2']").focus();
						return false;
					}
				});

		$("#tel2").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='tel2']").nextAll(".error2").css(
								"display", "none");
					}
				});

		$("#tel3").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='tel3']").nextAll(".error3").css(
								"display", "none");
					}
				});

		$("#email1").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='email1']").nextAll(".error").css(
								"display", "none");
					}
				});

		$("#email2").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='email2']").nextAll(".error2").css(
								"display", "none");
					}
				});

		$("#address").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='address']").nextAll(".error").css(
								"display", "none");
					}
				});

		$("#address2").keyup(
				function() {
					if ($(this).val().length > $("#input_text").attr(
							'maxlength')) {
						$("input[name='address2']").nextAll(".error").css(
								"display", "none");
					}
				});
		
		$("#imgInp").on('change', function() {
			readURL(this);
		})
		
	});
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style>
	fieldset {
		width: 600px;
		margin: 0 auto;
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
	
	.error, .error2, .error3 {
		color: red;
		display: none;
		font-size: 12px;
	}
	
	#input_text {
		display: none;
	}
	
	#adminpass {
		display: none;
	}
	
	.ju {
		width: 75px;
	}
</style>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	
	<section>
		<form action="modify.do" method="post" id="f1" enctype="multipart/form-data">
			<fieldset>
				<legend>내 정보수정</legend>
				
				<p>
					<label>회원번호</label>
					<input type="text" value="${Member.memberNo }" readonly="readonly">
				</p>
				
				<p>
					<label>새 비밀번호</label> <input type="password" name="password" id="password">
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
					<input type="text" value="${Member.korName }" readonly="readonly">
				</p>
				
				<p>
					<label>영어이름</label>
					<input type="text" value="${Member.engName }" readonly="readonly">
				</p>
				
				<p>
					<label>전화번호</label>
					<c:set var='phone1' value="${fn:substring(Member.phone, 0, 3) }"></c:set>
					<select name="tel1">
						<option value="010" ${phone1=='010'?'selected':''}>010</option>
						<option value="017" ${phone1=='017'?'selected':''}>017</option>
						<option value="011" ${phone1=='011'?'selected':''}>011</option>
						<option value="016" ${phone1=='016'?'selected':''}>016</option>		
					</select>
					<span class="error">앞자리를 입력해주세요</span> - 
					<input type="text" name="tel2" value="${fn:substring(Member.phone, 4, 4+fn:indexOf(fn:substringAfter(Member.phone,'-'),'-')) }"> - 
					<input type="text" name="tel3" value="${fn:substring(Member.phone, 9, 13) }">
					<span class="error2">중간자리를 입력해주세요</span>
					<span class="error3">마지막 자리를 입력해주세요</span>
				</p>
				
				<p>	
					<label>주민등록번호</label>
					<c:set var="jumin" value="${fn:split(Member.jumin,'-')}" />
					<input type="text" name="jumin1" class="ju" id="jumin1" maxlength="6" value="${jumin[0] }"  readonly="readonly">	- 
					<input type="password" name="jumin2" class="ju" id="jumin2" maxlength="7" value="${fn:substring(jumin[1], 0, 1) }******"  readonly="readonly">
				</p>
				
				<p>
					<label>이메일</label>
					<c:set var="email" value="${fn:split(Member.email,'@')}" />
					<input type="text" class="emailbox" name="email1" id="email1" value="${email[0] }"> @ 
					<input type="text" class="emailbox" name="email2" id="email2" value="${email[1] }">
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
					<c:set var="address" value="${fn:split(Member.address,',')}" />
					<label>우편번호</label> 
					<input type="text" size="20" id="address" name="address" id="address" value="${address[0] }">
					<input type="button" value="검색" id="button">
					<span class="error">우편번호를 입력해주세요</span> 
				</p>
				
				<p>
					<label>주소</label>
					<input type="text" id="address2" name="address2" id="address2" value="${address[1] }">
					<span class=error>상세주소를 입력해주세요</span>
				</p>
				
				<p>
					<label>사진</label>
					<input type="file" name="photo" id="imgInp">
					<img src="/BookMgnProj/upload/${Member.photo }" id="blah">
				</p>
	
				<p align="center">
					<input type="submit" value="수정하기">
					<input type="reset" value="취소">
				</p>
			</fieldset>
		</form>
	</section>
</body>
</html>
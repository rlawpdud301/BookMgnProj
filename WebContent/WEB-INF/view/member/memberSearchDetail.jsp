<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여확인</title>
<style>
	section{
		margin-top: 10px;
	}
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width:600px;
		margin:0 auto;
	}
	tr,th,td{
		border:1px solid black;
		padding:10px;
	}
	#menu{
		width:600px;
		margin:0 auto;
		text-align: center;
	}
	table td:FIRST-CHILD {
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#out").click(function(){
			var con_test = confirm("정말로 탈퇴하시겠습니까?");
			if(con_test == true){
				location.href = "out.do";
				return true;
			}else if(con_test == false){
				return false;
			}
		})
	})	

</script>
</head>
<body>
	<header>
		<jsp:include page="../FooterHeader/header.jsp" flush="false" />  
	</header>
	<section>
	<table>
		<tr>
		<td colspan="2"><img src="${pageContext.request.contextPath }/upload/${mno.photo }" width="200" height="200"></td>
		</tr>
		<tr>
		<th>회원번호</th>
		<td>${mno.memberNo }</td>
		</tr>
		<tr>
		<th>회원이름</th>
		<td>${mno.korName }</td>
		</tr>
		<tr>
		<th>영어이름</th>
		<td>${mno.engName }</td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td>${mno.phone }</td>
		</tr>
		<tr id="juminNo">
		<th>주민등록번호</th>
		<c:set var="jumin" value='${mno.jumin }' ></c:set>
		<td>${fn:substring(jumin, 0, 8)}******</td>
		</tr>
		<tr>
		<th>우편번호</th>
		<td>${mno.email }</td>
		</tr>
		<tr>
		<c:set var="address" value="${fn:split(mno.address,',')}"></c:set>
		<th>주소</th>
		<td>${address[0] }</td>
		</tr>
		<tr>
		<th>상세주소</th>
		<td>${address[1] }</td>
		</tr>
		<tr>
		<th>특이사항</th>
		<td>${mno.uniqueness}</td>
		</tr>
	</table>
	<div id="menu">
	<a href="update.do?no=${mno.memberNo}">[특이사항작성]</a>
	<a href="memberrent.do?no=${mno.memberNo }" onclick="window.open(this.href,'도서대여확인','width=900,height=200');return false;">[도서대여목록 보기]</a>
	<a href="out.do?no=${mno.memberNo}&password=${mno.password}" id="out">[탈퇴하기]</a>
	</div>

	</section>
	
	<footer>
		<jsp:include page="../FooterHeader/footer.jsp" flush="false" />
	</footer>
</body>
</html>
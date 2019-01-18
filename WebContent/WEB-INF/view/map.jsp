<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#map {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 200px; 
}
#map img{
	margin: 20px;
}
#map #img{
	width: 440px;
}
#map #mapimg{
	width: 400px;
}

#map #img{
	float: left;
}
#map #text{
	float: left;
}

#map #text .mt10{ 
	width: 100px;
}
dt{
	text-align: center;
}
.red{
	color: red;
}
</style>
</head>
<body>	
	<div id="map">
		<h1>우리도서관 오시는길.</h1><br>
		<hr>
		<div id="img">
			<img src="${pageContext.request.contextPath }/images/KakaoTalk_20190117_162244485.png" id="mapimg">
		</div>
		<div id="text">
			
		</div>
		<div class="introduction_04">
			
			<dl class="con_type01 ">
				<dt>
					<img src="${pageContext.request.contextPath }/images/02_intit_01.gif" class="mt10">
				</dt>
				<dd>
					<strong class="red">본관: 대구광역시 서구 서대구로 30(내당동 230-6번지 파워마트
						3층) </strong>
				</dd>
				<dd>
					<strong class="red">별관1(전기관): 대구광역시 서구 서대구로 37 (내당동
						245-16번지 3층,4층)</strong>
				</dd>
				<dd>
					<strong class="red">별관2(IT 관) : 대구광역시 서구 서대구로 7길2 (내당동
						245-4번지 2층)</strong>
				</dd>
				<dd>
					<strong>전화</strong> :053-555-1333 / <strong>팩스</strong> :
					053-566-3318
				</dd>
				<dd>
					<strong>이메일</strong> :yiorkr@naver.com
				</dd>
			</dl>



			<dl class="con_type01">
				<dt>
					<img src="${pageContext.request.contextPath }/images/02_intit_02.gif" alt="" class="mt10">
				</dt>
				<dd>
					<strong>버스</strong> : 356번, 425번, 623번, 순환 3번 내당삼익맨션 건너 정거장
				</dd>
				<dd>
					<strong>지하철</strong> : 지하철 2호선 두류역 18번 출구 서구청 방향 도보 5분이내
				</dd>
			</dl>
		</div>

	</div>

</body>
</html>
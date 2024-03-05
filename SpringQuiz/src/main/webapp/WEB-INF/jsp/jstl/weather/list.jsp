<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
 <link rel="stylesheet" href="/jstl/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<section class="contents d-flex">
			<nav class="main-menu">
				<div class="d-flex mt-2 justify-content-center">
					<div class="col-2">
						<img width="25" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" >
					</div>
					<h4 class="text-white col-7">기상청</h4>
				</div>
				
				<ul class="nav flex-column">
					<li class="nav-item"><a href="/jstl/weather/list" class="nav-link text-white">날씨</a></li>
					<li class="nav-item"><a href="/jstl/weather/input" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">관측기후</a></li>
				</ul>
			</nav>
			<article class="main-contents p-4">
				<h3>과거 날씨</h3>
				
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "weather" items="${weatherHistory }">
							<tr>
								<td><fmt:formatDate value = "${weather.date }" pattern="yyyy년 M월 dd일" /></td>
								<td>
									<c:choose>
										<c:when test = "${weather.weather eq '맑음' }">
											<img src ="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"/>
										</c:when>
										<c:when test ="${weather.weather eq '구름조금' }">
											<img src ="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg"/>
										</c:when>
												<c:when test ="${weather.weather eq '흐림' }">
											<img src ="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg"/>
										</c:when>
												<c:when test ="${weather.weather eq '비' }">
											<img src ="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg"/>
										</c:when>
										<c:otherwise>
											${weather.weather}		
										</c:otherwise>
									</c:choose>
								<td>${weather.temperatures }</td>
								<td>${weather.precipitation }</td>
								<td>${weather.microDust }</td>
								<td>${weather.windSpeed}</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			
			</article>
		</section>
		<footer class="d-flex">
			<div class="logo mt-3 ml-4">
				 <img width="120" src="https://www.weather.go.kr/w/resources/image/foot_logo.png">	
			</div>
			<div class="copyright">
				<div class="text-secondary small">
				(07062) 서울시 동작구 여의대방로16길 61  <br>
               Copyright@2020 KMA. All Rights RESERVED.</div>
			</div>
		</footer>
	</div>
	


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
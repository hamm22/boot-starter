<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 목록</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
				<h3 class="ml-4 mt-5">날씨 입력</h3>
					<form method="get" action="/jstl/weather/create">
	                <div class="d-flex justify-content-between ml-3 mt-5">
	                    <div class="d-flex align-items-center">
	                        <label class="input-lable">날짜</label> 
	                        <input type="text" class="form-control" id="dateInput" name="date">
	                    </div>
	                    <div class="d-flex align-items-center">
	                        <label class="input-lable">날씨</label> 
	                        <select class="form-control" name="weather">
	                            <option>맑음</option>
	                            <option>구름조금</option>
	                            <option>흐림</option>
	                            <option>비</option>
	                        </select>
	                    </div>
	
	                    <div class="d-flex align-items-center">
	                        <label class="input-lable">미세먼지</label> 
	                        <select class="form-control" name="microDust">
	                            <option>좋음</option>
	                            <option>보통</option>
	                            <option>나쁨</option>
	                            <option>최악</option>
	                        </select>
	                    </div>
	                </div>
	
	                <div class="d-flex justify-content-between mt-5">
	                    <div class="d-flex align-items-center">
	                        <label class="col-3">기온</label> 
	                        <div class="input-group">
	                            <input type="text" class="form-control" name="temperatures">
	                            <div class="input-group-append">
	                                <span class="input-group-text">℃</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="d-flex align-items-center">
	                        <label class="col-4">강수량</label> 
	                        <div class="input-group">
	                            <input type="text" class="form-control" name="precipitation">
	                                <div class="input-group-append">
	                                    <span class="input-group-text">mm</span>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="d-flex align-items-center">
	                        <label class="col-3">풍속</label> 
	                        <div class="input-group">
	                            <input type="text" class="form-control" name="windSpeed"> 
	                                <div class="input-group-append">
	                                    <span class="input-group-text">km/h</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="text-right mt-4 mb-5">
	                    <button type="submit" class="btn btn-success">저장</button>
	                </div>
				</form>
			</article>
		</section>
		<footer class="d-flex">
			<div class="logo mt-3 ml-4">
				 <img width="120" src="https://www.weather.go.kr/w/resources/image/foot_logo.png">	
			</div>
			<div class="copyright">
				<div class="text-secondary small">
				(07062) 서울시 동작구 여의대방로16길 61  <br>
               Copyright@2023 KMA. All Rights RESERVED.</div>
			</div>
		</footer>
	</div>
	


<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		
		$("#dateInput").datepicker({
			dateFormat:"yy년 m월 d일"
		});
	});

</script>
</body>
</html>
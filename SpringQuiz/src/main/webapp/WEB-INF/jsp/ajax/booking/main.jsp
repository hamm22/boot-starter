<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/booking/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" >
	    <header class="mt-4">
	        <div class="text-center display-4">통나무 팬션</div>
	        <nav class="mt-4">
	            <ul class="nav nav-fill">
	                <li class="nav-item"><a class="nav-link" href="#">팬션소개</a></li>
	                <li class="nav-item"><a class="nav-link" href="#">객실보기</a></li>
	                <li class="nav-item"><a class="nav-link" href="/ajax/booking/input">예약하기</a></li>
	                <li class="nav-item"><a class="nav-link" href="/ajax/booking/list">예약목록</a></li>
	            </ul>
	        </nav>
	    </header>
	
	    <section class="banner">
	        <img src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" id="bannerImage">
	    </section>
	    <section class="d-flex">
	        <article class="reservation d-flex justify-content-center align-items-center">
	            <div class="display-4">
	                실시간 <br>
	                예약 하기 
	            </div>
	        </article>
	        <article class="reservation-confirm">
	            <div class="m-4">
	                <div class="d-flex align-items-end">
	                    <h3 class="mr-4">예약 확인</h3>
	                
	                </div>
	
	                <div class="no-member-input mt-3y" id="nonMember">
	                    <div class="input-gorup form-inline">
	                        <label class="input-label">이름 </label>
	                        <input type="text" class="form-control text-input" id="name">
	                    </div>
	                    <div class="input-gorup form-inline mt-3">
	                        <label class="input-label">전화번호 </label>
	                        <input type="text" class="form-control text-input" id="phoneNumber">
	                    </div>
	               
	                </div>
	                <div class="d-flex justify-content-end">
	                    <button class="btn btn-success mt-3 mr-5" id = "requestBtn">조회 하기</button>
	                </div>
	            </div>

			</article>
	        <article class="reservation-call d-flex justify-content-center align-items-center">
	            <div>
	                <h3>예약문의 : </h3>
	                <h1>010-</h1>
	                <h1>000-1111</h1>
	            </div>
	        </article>
	    </section>
	
	    <footer class="mt-3 ml-4">
	        <address>
	            제주특별자치도 제주시 애월읍  <br>
	            사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목 <br>
	            Copyright 2025 tongnamu All right reserved
	        </address>
	
	    </footer>
	
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	<script>
	
		$(document).ready(function(){
			
			$("#requestBtn").on("click", function(){

				
				if($("#name").val() == '') {
                    alert("이름을 입력하세요.");
                    return;
                }

                if($("#phoneNumber").val() == '')   {
                    alert("전화번호를 입력하세요.");
                    return;
                }

                if(!$("#phoneNumber").val().startsWith("010"))   {
                    alert("010으로 입력해주세요 ");
                    return;
                }
                
                let name = $("#name").val();
                let phoneNumber = $("#phoneNumber").val();
                
				$.ajax({
					type : "get"
					, url :  "/ajax/booking/select"
					, data : {"name" : name, "phoneNumber" : phoneNumber}
					, success : function(data){
						if(data.result == "success"){
							alert("성공");
						} else{
							// 중복 아님
							alert("실패");
						}
					}
					, error : function(){
						alert("에러");
					}
				});
				
			});
		});
	</script>

</body>
</html>
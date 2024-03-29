<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>예약하기</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
            
            <section>
             <h2 class="my-4 text-center">예약 하기</h2>
	        
		        <div class="d-flex justify-content-center">
		            <div class="w-50">
		                <label>이름</label>
		                <input type="text" class="form-control" id = "nameInput">
		
		                <label class="mt-3">예약날짜</label>
		                <input type="text" class="form-control" id = "dateInput">
		
		                <label class="mt-3">숙박일수</label>
		                <input type="text" class="form-control" id = "dayInput">
		
		                <label class="mt-3">숙박인원</label>
		                <input type="text" class="form-control" id = "headcountInput">
		
		                <label class="mt-3">전화번호</label>
		                <input type="text" class="form-control" id = "phoneNumberInput">
		
		                <button class="btn btn-warning btn-block mt-3" id = "requestBtn">예약하기</button>
		            </div>
		        </div>
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
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
	
		$(document).ready(function() {
				
				$("#dateInput").datepicker({
					dateFormat:"yy년 m월 d일"
				});
			});
			
		$(document).ready(function(){
			
			$("#requestBtn").on("click", function(){
				let name = $("#nameInput").val();
				let date = $("#dateInput").val();
				let day = $("#dayInput").val();
				let headcount = $("#headcountInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				
				if(date == ""){
					alert("날짜를 입력하세요");
					return;
				}
				
				if(day == ""){
					alert("숙박일수를 입력하세요");
					return;
				}
				
				if(headcount == ""){
					alert("숙박인원을 입력하세요");
					return;
				}
				
				if(phoneNumber == ""){
					alert("폰번호를 입력하세요");
					return;
				}
				
				// 숙박일수가 숫자가 아닌경우 true를 리텅
				// is NaN(day)
				// Not a number
				if(is NaN(headcount)){
					alert("숙박인원은 숫자만 입력 가능합니다.");
				}
				
				if(is NaN(day)){
					alert("숙박일수는 숫자만 입력 가능합니다.");
				}
				
				$.ajax({
						type : "get"
						, url : "/ajax/booking/create"
						, data  : {"name" : name, "date" : date, "day" : day, "headcount" : headcount, "phoneNumber" : phoneNumber}
						, success : function(data){
							
							if(data.result == "success"){
								
								location.href = "/ajax/booking/list";
							} else{
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
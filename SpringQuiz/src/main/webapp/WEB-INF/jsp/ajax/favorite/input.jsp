<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>즐겨찾기 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class = "container">
		<h3>즐겨찾기 추가하기</h3>
		
		<div>
		<label>제목</label><br>
		<input type="text" id ="nameInput" class="form-control">
		</div>
		
		<div>
		<label>주소</label><br>
		<div class ="d-flex">
		<input type="text" id = "urlInput" class="form-control">  <button type = "button" id = "duplicateBtn" class = "btn btn-primary">중복확인</button>
		<div class = "small text-danger d-none"> 중복된 url 입니다.</div>
		<div class = "small text-info d-none"> 저장 가능한 url 입니다.</div>
		</div>
		
		<div>
			<button type="button" id = "requestBtn" class="btn btn-success btn-block mt-4">추가</button>
		</div>
	</div>	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	<script>
		$(document).ready(function(){
			
			$("#requestBtn").on("click", function(){
					
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				if(name == ""){
					alert("제목을 입력하세요");
					return;
				}
				
				if(url == ""){
					alert("주소를 입력하세요");
					return;
				}
				
				// http://로 시작하지 않고 https://로 시작하지않으면 잘못된 주소 규격
				if(!url.startsWith("http://") && !url.startsWith("https://") ){
					alert("주소를 확인하세요");
					return;
				}				
				
				// 즐겨찾기 추가 API 요청
				$.ajax({
						type : "post"
						, url : "/ajax/favorite/create"
						, data : {"name" : name, "url" : url}
						, success : function(data){
							
							if(data.result == "success"){
								location.href = "/ajax/favorite/list";
								
							} else {	// 실패
								 alert("실패");
							}
						}
						
						, error : function(){
							alert("에러");
						}
					});
			});
			
			// url 중복확인 버튼
			$("#duplicateBtn").on("click", function(){
				let url = $("#urlInput").val();
				
				if(url == ""){
					alert("주소를 입력하세요");
					return;
				}
				
				// http://로 시작하지 않고 https://로 시작하지않으면 잘못된 주소 규격
				if(!url.startsWith("http://") && !url.startsWith("https://") ){
					alert("주소를 확인하세요");
					return;
				}	
				
				$.ajax({
					type : "post"
					, url : "/ajax/favorite/duplicate-url"
					, data : {"url" : url}
					, success : function(data){
						if(data.isDuplicate == true){
							 $(".text-danger").removeClass("d-none");
						     $(".text-info").addClass("d-none");
						     // 부트스트랩 no일때는 show 사용못함
						} else{
							// 중복 아님
							 $(".text-danger").addClass("d-none");
						     $(".text-info").removeClass("d-none");
						}
					}
					, error : function(){
						alert("중복 확인 에러");
					}
					
				});
				
			});
			
		});
		
	</script>
	
</body>
</html>
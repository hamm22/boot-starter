<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<div class="container">
	
		<h2>즐겨찾기 목록</h2>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
				
			</thead>
			
			<tbody>
				<c:forEach var="favorite" items="${favoriteList }">
				<tr>
					<td>${favorite.id }</td>
					<td>${favorite.name }</td>
					<td>${favorite.url }</td>
					<td><button type="button" class="btn btn-danger btn-sm delete-btn" data-favorite-id="${favorite.id }">삭제</button> </td>
					<%-- 클래스는 - 하고 id는 camel식
								value속성을 통해서 해당하는 버튼의 id값을 가져옴 value 대신 data 속성임 
								속성이름에는 대문자 쓰면 안되서 data-favorite-id 이렇게 나타내야함 --%>
					
				</tr>
				</c:forEach>
				
			</tbody>
		
		</table>
	
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		
		$(".delete-btn").on("click", function() {
			
			// 어떤 버튼에 대한 이벤트 
			// 이벤트가 발생한 태그
			// data-favorite-id 속성값 얻어오기 
			let favoriteId = $(this).data("favorite-id");
			
			$.ajax({
				type:"get"
				, url:"/ajax/favorite/delete"
				, data:{"id" : favoriteId}
				, success:function(data) {
					// responseBody에 있는것을 대상으로
					// 성공 : {"result":"success"} 
					// 실패 : {"result":"fail"}
					if(data.result == "success") {
						// 새로고침
						location.reload();
					} else {
						alert("삭제 실패");
					}
					
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
			
		});
		
	});


</script>
</body>
</html>
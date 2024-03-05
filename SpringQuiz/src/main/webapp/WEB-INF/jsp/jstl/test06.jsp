<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<title>function library</title>
</head>
<body>
	<div class="container">
		<h2>회원 정보 리스트</h2>

		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${member.name}</td>
						<c:choose>
							<c:when test = "${fn:startsWith(member.phoneNumber, '010') }">
								<td>${member.phoneNumber}</td>
							</c:when>
							
							<c:otherwise>
								<td>유효하지 않은 전화번호</td>
							</c:otherwise>
						</c:choose>
						
						<%-- 삼국시대 촉한 -> 삼국 - 촉한
							삼국시대 -> 삼국 -
						 --%>
						<td>${fn:replace(member.nationality, "삼국시대", "삼국 - ")}</td>
						<td><b>${fn:split(member.email, "@")[0]}</b>@${fn:split(member.email, "@")[1] }</td>
						<td>${fn:substring(member.introduce, 0, 15)}
							<c:if test="${fn:length(member.introduce) > 15 }">
								...
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
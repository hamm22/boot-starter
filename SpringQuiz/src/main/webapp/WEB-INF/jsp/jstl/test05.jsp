<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<title>2. JSTL Formatter 통화, 날짜</title>
</head>
<body>
	
	<div class="container">
		<h2>2.카드명세서</h2>
		
		<table class="table text-center">
		<thead>
			<tr>
				<th>사용처</th>
				<th>가격</th>
				<th>사용날짜</th>
				<th>할부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var= "cardBill" items="${cardBills }" >
			<tr>
				<td>${cardBill.store }</td>
				<td><fmt:formatNumber value ="${cardBill.pay }" type = "currency" /></td>
				
				<td>
				<fmt:parseDate value="${cardBill.date}" pattern="yyyy-MM-dd" var="parsedDate" />
				<fmt:formatDate value="${parsedDate}" pattern="yyyy년 M월 dd일"/>
				</td>

				<td>${cardBill.installment }</td>
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
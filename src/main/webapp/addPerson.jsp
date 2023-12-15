<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 네비게이션.jsp에 있는 내용을 포함하겠다! -->
	<%@ include file="navigation.jsp" %>

	<h1>신규 인원 추가하는 페이지</h1>
	
	<!-- action : 최종 submit하면 넘어가는 페이지 주소 -->
	<form action="addPerson_proc.jsp" method="post"> <!-- get : /addPerson_proc.jsp?name=뚜벅뚜벅, post : /addPerson_proc.jsp -->
		<label>이름:</label><input type="text" name="name"> <!-- name="컬럼별명" -->
		
		<button type="submit">추가</button>	
	</form>
</body>
</html>
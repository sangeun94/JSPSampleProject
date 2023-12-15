<%@page import="db.dto.HobbyDTO"%>
<%@page import="db.dao.HobbyDAO"%>
<%@page import="java.util.List"%>
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

	<h1>취미목록</h1>
<!-- <a href="./index.jsp">메인 페이지로</a> -->
	
	<% 
	//select로 t_hobby_list 보여주기
		HobbyDAO hobbyDAO = new HobbyDAO();
		
		List<HobbyDTO> hobbyList = hobbyDAO.findHobbyList();
		
	//jsp 에서 자바코드가 바뀌면 restart해줘야 한다!
	%>
		<table> <!-- 반복되는애가 아니니까 for문안에 들어가면 안되지~ -->
			<tr>
				<th>아이디</th>
				<th>순번</th>
				<th>취미</th>
				<th>선호도</th>
			</tr>
		
	<%
		if(hobbyList != null) { //hobbyList가 null이 아니면!
			for(HobbyDTO hobbyInfo : hobbyList) {
			
	%>		 	
			<tr>
				<td><%=hobbyInfo.getId()%></td>
				<td><%=hobbyInfo.getNo()%></td>
				<td><%=hobbyInfo.getHobby()%></td>
				<td><%=hobbyInfo.getPrefer()%></td>
			</tr>
		
	<%
			}
		}
	%>
	</table>
</body>
</html>
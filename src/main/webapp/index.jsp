
<%@page import="db.dto.PersonInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.PersonInfoDAO"%>
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
	
	<h1>index.jsp 페이지</h1>	
	
<!-- <a href="./addPerson.jsp">신규 인원 추가</a> -->
<!-- <a href="./hobbyList.jsp">취미목록으로 이동</a> -->
	
	
	<hr/> <!-- 화면에 가로로 선을 긋는 태그 -->
	
	<% 
	//select로 t_person_info 보여주기
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		
		List<PersonInfoDTO> personList = personInfoDAO.findPersonInfoList();
		
	//jsp 에서 자바코드가 바뀌면 restart해줘야 한다!
		for(PersonInfoDTO personInfo : personList) {
			
	%>	
		<!-- <a href="./personInfo.jsp?id=5"> -> ? 는 파라미터! id=5를 가지고 넘어간다! -->
		<p> <%=personInfo.getId()%> <a href="./personInfo.jsp?id=<%=personInfo.getId()%>"><%=personInfo.getName()%></a> </p>
	<%
		}
	%>
	
</body>
</html>
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
	<%
		String id = request.getParameter("id"); //getParameter("가져올컬럼별명")
		System.out.println("deletePerson_proc 파라미터 : " + id);
		int intId = Integer.parseInt(id); //String 이라서 int로 바꿔준다!
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		
		int result = personInfoDAO.removePersonInfoById(intId); //삭제 성공
		//int result = 0; //일부러 실패나오게 0으로 저장
		
		if(result > 0) {
	%>	
		<script>
			alert('삭제 성공');
			location.href = 'index.jsp'; //해당 경로로 페이지 이동
		</script>
	<%	
		} else {
	%>	
		<script>
			alert('삭제 실패');
			//location.href = 'addPerson.jsp'; //신규인원추가로 가면 안되짘ㅋㅋ
			history.back(); //뒤로가기
		</script>
	<%	
		}
	%>
</body>
</html>
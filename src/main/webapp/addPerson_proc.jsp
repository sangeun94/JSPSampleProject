<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.PersonInfoDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- insert -->
	<h1>신규인원추가 로직을 처리하는 곳</h1>	
	
	<%
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 -> 콘솔창에 제대로 한글로 나오게끔!
		String name = request.getParameter("name"); //getParameter("가져올컬럼별명")
		//request 객체를 생성시키지않아도 태어나있는 상태! 그래서 그냥 쓸 수있다~!
		System.out.println(name); //콘솔창에 출력
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		
		int result = personInfoDAO.savePersonInfo(name); //저장 성공
		//int result = 0; //일부러 실패나오게 0으로 저장
		
		if(result > 0) {
	%>	
		<script>
			alert('저장 성공');
			location.href = 'index.jsp'; //해당 경로로 페이지 이동
		</script>
	<%	
		} else {
	%>	
		<script>
			alert('저장 실패');
			location.href = 'addPerson.jsp'; //해당 경로로 페이지 이동
			history.back(); //뒤로가기
		</script>
	<%	
		}
	%>
</body>
</html>
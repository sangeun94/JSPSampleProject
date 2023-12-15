<%@page import="db.dto.PersonInfoDTO"%>
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
		//insert할때 addPerson_proc에서 필요했지 name이 나와야 하니까!
		//delete할때는 필요가 없었어 숫자만 나오니까 근데 여기선 name이 나와야 하니까! 필요!
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 -> 콘솔창에 제대로 한글로 나오게끔!
		
		//id name 둘다 넘겨줘야한다!
		String id = request.getParameter("id"); //getParameter("가져올컬럼별명")
		String name = request.getParameter("name"); //getParameter("가져올컬럼별명")
		
		if(name == null) { //안전하게 하기위해 앞에 script에다가도 걸어놓고 여기다가도 걸어놓고!
			//이름이 안넘어왔는데?
		}
		
		System.out.println("modifyPerson_proc 파라미터 : " + id + " " + name);
		int intId = Integer.parseInt(id); //String 이라서 int로 바꿔준다!
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		PersonInfoDTO personInfo = new PersonInfoDTO(intId, name);
		
		//매개변수에 personInfoDTO 객체를 넣어줘야 하니까 위에 DTO객체 생성!
		int result = personInfoDAO.modifyPersonInfo(personInfo); //수정 성공
		//int result = 0; //일부러 실패나오게 0으로 저장
		
		if(result > 0) {
	%>	
		<script>
			alert('수정 성공');
			location.href = 'personInfo.jsp?id=<%=id%>'; //해당 경로로 페이지 이동
		</script>
	<%	
		} else {
	%>	
		<script>
			alert('수정 실패');
			//location.href = 'addPerson.jsp'; //신규인원추가로 가면 안되짘ㅋㅋ
			history.back(); //뒤로가기
		</script>
	<%	
		}
	%>
</body>
</html>
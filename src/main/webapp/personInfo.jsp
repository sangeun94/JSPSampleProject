
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
		//index.jsp 페이지에서 선택한 사람의 정보가 필요하다!
		//그 사람의 정보를 select 하려면 "누구를 선택했는가?" -> id가 필요!
		
		String id = request.getParameter("id"); //getParameter("가져올컬럼별명")
		System.out.println(id);
		
		int intId = 0; //try절 밑에서 써먹어야 하니까
		try {
			intId = Integer.parseInt(id); //String을 int로 바꿔주고!
			 						          //예외가 발생하는경우 : 예외처리!!
		} catch (Exception e) {
			e.printStackTrace(); //예외 발생 기록
			intId = 0; //밑에 null 이면 걸리는 로직이 있어! 거기서 걸러지겠지
		}
		
		PersonInfoDAO personInfoDAO = new PersonInfoDAO();
		PersonInfoDTO personInfo = personInfoDAO.findPersonInfoById(intId);
	%>
	
	<!-- 네비게이션.jsp에 있는 내용을 포함하겠다! -->
	<%@ include file="navigation.jsp" %>
	
	<h1>사람 상세 정보 페이지</h1>
	
	<%
		//오류페이지 뜨게하지 않기 위해! 예외처리해줌 
		if (personInfo == null) {
	%>		
			<h2>해당 사용자 정보가 없습니다.</h2>
		<script> //alert창 뜨고 메인페이지로 보내버리는!
			alert('잘못된 접근입니다.');
			location.href = "index.jsp";
		</script>
	<%	
		} else {
	%>
			<h2>이 사람의 아이디는 <%=personInfo.getId() %></h2>
			<h2>이 사람의 이름은 <%=personInfo.getName() %></h2>
			
			<!-- 삭제 delete -->
			<!-- post로 해주게되면 주소창에 id가 안나온다 -->
			<!-- action : 최종 submit하면 넘어가는 페이지 주소 -->
			<form id="personForm" action="deletePerson_proc.jsp" method="post"> <!-- post: body안에 숨기는(주소창에 안보이는) -->
				<!-- form안에 name이 있어야 post가 먹힌다! 그리고 hidden으로 하면 된다~! -->
				<input type="hidden" name="id" value="<%=personInfo.getId()%>">
				
				<label>이름 : </label><input type="text" id="input_name" name="name" value="<%=personInfo.getName()%>">
				
				<button id="deleteBtn" type="button">삭제하기</button>
				<button id="modifyBtn" type="button">수정하기</button>
			</form>
	
	<script>
		document.getElementById('deleteBtn').addEventListener('click', ()=> {
			//alert('삭제버튼눌림');
			if (confirm('삭제 하시겠습니까?')) {
				//확인 - true -> 여기가 실행! 삭제
				
				//get 방식으로 id값 전달!
				//location.href = "deletePerson_proc.jsp?id=<%=personInfo.getId()%>";
			
				//form submit을 발생시켜서, post 방식으로 id값 전달!
				//document.getElementById('personForm').submit();
				
				//위에 액션이 delete지만 확실하게 하기 위해서!
				let form = document.getElementById('personForm');
				//submit 날리기전에 action 지정! (확실하게 하기위해!)
				form.action = 'deletePerson_proc.jsp';
				//form submit을 발생시켜서, post 방식으로 id값 전달!
				form.submit();
								
			} 
		});
		
		document.getElementById('modifyBtn').addEventListener('click', ()=> {
			//이름이 있는지 혹시 비어있는지 체크! (수정할때 null인 상태이면 수정이 안되게끔)
			// + 공백도 제외!!! -> trim()
			let input_name = document.getElementById('input_name');
			if(input_name.value.trim() == '') { // trim() : 공백도 제외!!!
				//비어있는경우
				alert('이름은 필수 입력입니다.');
				input_name.focus();
				return; //함수 종료 (밑에 if로 가게 하지 않기위해)
			}  
			
			if (confirm('수정 하시겠습니까?')) {
				let form = document.getElementById('personForm');
				//submit 날리기전에 action 지정! (위에 액션은 delete할때라) 
				form.action = 'modifyPerson_proc.jsp';
				//form submit을 발생시켜서, post 방식으로 id값 전달!
				form.submit();
			}
			
		});
	</script>
	<% 
		}
	%>
	
	
</body>
</html>
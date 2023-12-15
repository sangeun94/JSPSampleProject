package description;

//설명 작성용 파일
public class Description {

	/*
	프로젝트 파일 구조
	Java Resources 폴더 (위)
		src/main/java : 자바 소스 파일 작성!(ex.DAO DTO)
		
	webapp 폴더 (아래)
		화면(jsp, css, js 등) 관련 파일 작성
		
	
	.jsp 파일은 서버에서 실행 후, 사용자에게 돌아갈때는
	3총사(HTML,CSS,Javascript) 형태로 전송
	
	.jsp 파일 내부에서 자바 코드를 작성할 때는
	<% 
		감싸여진 범위에서 작성가능
	%>
	
	
	form 요청 시, method 선택
		-get  : 주소창 뒤에 ? 붙어서 날라감 (주소창에 보이는)
				ex) /addPerson_proc.jsp?name=뚜벅뚜벅
				form에서 요청가능
				주소창에 바로 입력해서도 가능
				주소창 문자열 길이로 제한
				공개해도 되는 정보를 파라미터에 포함
				
		-post : body안에 숨겨서 날라감 (주소창에 보이지 않는)
				ex) /addPerson_proc.jsp
				주소창에서 바로 접근 불가!
				제한 없이 전송 가능 (WAS apache 2GB - 설정에 따라 다름)
				아이디/비밀번호 -> 숨길 항목들을 넘길때 post 사용
				
				
	request.getParameter("키값"); 값 획득
	
	
	 */
}

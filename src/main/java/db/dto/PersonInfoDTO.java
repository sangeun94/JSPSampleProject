package db.dto;

public class PersonInfoDTO {
	//DTO Data Transfer Object
	
	public int id;  //숫자 NUBMER
	public String name; //문자열 VARCHAR2
	
	//생성자
	public PersonInfoDTO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	//메소드
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

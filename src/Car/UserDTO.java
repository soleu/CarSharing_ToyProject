package Car;

public class UserDTO {
private String name;//�̸�
private String id;//���̵�
private String pw;//��й�ȣ
private String phone;//��ȭ��ȣ

public UserDTO(){}

public UserDTO(String name,String id,String pw,String phone){
	this.name=name;
	this.id=id;
	this.pw=pw;
	this.phone=phone;
}

public String getName() {
	return name;
}

public String getPw() {
	return pw;

}

public String getId() {
	return id;
}

public String getPhone() {
	return phone;
}
}

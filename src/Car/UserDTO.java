package Car;

public class UserDTO {
private String name;//이름
private String id;//아이디
private String pw;//비밀번호
private String phone;//전화번호

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

package Car;


import java.util.Vector;

public class CarDTO {
private int no;//차 번호
private String name;//차 이름
private String img;//이미지 주소
private int price;//시간 당 가격
private int oil;//0:휘발유,1:경유,2:LPG
private int carSize;//0:경차,1:소형,2:중형,3:대형
private boolean reserved;//예약중인지. 0:예약가능 1:예약중
private Vector<CarReply> repList=new Vector<CarReply>();//관련 댓글

public CarDTO(){}
CarDTO(int no,String name,String img,int price,int carSize,int oil ){
	this.no=no;
	this.name=name;
	this.img=img;
	this.price=price;
	this.carSize=carSize;
	this.oil=oil;
	reserved=false;
	repList=new Vector<>();
}

CarDTO(int no,String name,String img,int price,int carSize,int oil,boolean reserved){
	this.no=no;
	this.name=name;
	this.img=img;
	this.price=price;
	this.carSize=carSize;
	this.oil=oil;
	this.reserved=reserved;
	repList=new Vector<>();
}
public int getNo() {
	return no;
}
public String getName() {
	return name;
}

public String getImg() {
	return img;
}

public int getOil() {
	return oil;
}

public int getCarSize() {
	return carSize;
}

public boolean getReserved() {
	return reserved;
}

public int getPrice() {
	return price;
}

public Vector<CarReply> getRepList(){
	return repList;
}

public void setReserved() {
	reserved=true;
}

}

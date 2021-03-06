package Car;


import java.util.Vector;

public class CarDTO {
	
private String name;//�� �̸�
private String img;//�̹��� �ּ�
private int price;//�ð� �� ����
private int oil;//0:�ֹ���,1:����,2:LPG
private int carSize;//0:����,1:����,2:����,3:����
private boolean reserved;//����������. 0:���డ�� 1:������
private Vector<CarReply> repList=new Vector<CarReply>();//���� ���

public CarDTO(){}
CarDTO(String name,String img,int price,int carSize,int oil,boolean reserved ){
	this.name=name;
	this.img=img;
	this.price=price;
	this.carSize=carSize;
	this.oil=oil;
	this.reserved=reserved;
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

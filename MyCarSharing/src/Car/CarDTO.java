package Car;


import java.util.Vector;

public class CarDTO {
private int no;//�� ��ȣ
private String name;//�� �̸�
private String img;//�̹��� �ּ�
private int price;//�ð� �� ����
private int oil;//0:�ֹ���,1:����,2:LPG
private int carSize;//0:����,1:����,2:����,3:����
private boolean reserved;//����������. 0:���డ�� 1:������
private Vector<CarReply> repList=new Vector<CarReply>();//���� ���

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

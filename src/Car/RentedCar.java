package Car;

import java.util.Date;

public class RentedCar {
private int carNo;//����ȣ
private Date beginDate;//���� ��¥
private Date endDate;//���� ��¥
private int Day;//������ �� ��
private long Time;//������ �ð�
private long price;//�� ����
private String way;//��,�պ�
private String rentloc;//������ ��
private String backloc;//�δ� ��


public RentedCar() {}


public RentedCar(int carNo,Date beginDate,Date endDate,int Day,long Time,long price,String way,String rentloc,String backloc) {
	this.carNo=carNo;
	this.beginDate=beginDate;
	this.endDate=endDate;
	this.Day=Day;
	this.Time=Time;
	this.price=price;
	this.way=way;
	this.rentloc=rentloc;
	this.backloc=backloc;
	
}

public int getCarNo() {
	return carNo;
}

public Date getBeginDate() {
	return beginDate;
}
public Date getEndDate() {
	return endDate;
}
public int getDay() {
	return Day;
}
public long getTime() {
	return Time;
}
public long getPrice() {
	return price;
}

public String getWay() {
	return way;
}

public String getRentloc() {
	return rentloc;
}
public String getBackloc() {
return backloc;
}
}

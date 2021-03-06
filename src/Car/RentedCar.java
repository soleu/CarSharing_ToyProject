package Car;

import java.util.Date;

public class RentedCar {
private int carNo;//차번호
private Date beginDate;//시작 날짜
private Date endDate;//종료 날짜
private int Day;//빌리는 일 수
private long Time;//빌리는 시간
private long price;//총 가격
private String way;//편도,왕복
private String rentloc;//빌리는 곳
private String backloc;//두는 곳


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

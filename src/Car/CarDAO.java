package Car;

import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class CarDAO {
	private CarDAO() {
	};

	private static CarDAO dao = new CarDAO();

	public static CarDAO getInstance() {
		return dao;
	}

	Vector<CarDTO> CarList = new Vector<CarDTO>();
	Vector<UserDTO> UserList = new Vector<UserDTO>();
	Vector<RentedCar> RentedCarList = new Vector<RentedCar>();//예약완료 차
	RentedCar rc=new RentedCar();
	public Map<String, RentedCar> reservedList=new HashMap<String, RentedCar>();
	
	public void initCarList() {
		String[] name = { "모닝", "레이", "아반떼", "크루즈", "K3", "소나타", "SM6", "K5", "K7", "K9", "그랜져", "제네시스" };
		String[] img = { "0_morning.jpg", "0_ray.jpg", "1_Avante.jpg", "1_Cruze.jpg", "1_K3.jpg", "2_sonata.jpg",
				"2_sm6.jpg", "2_K5.jpg", "3_k7.jpg", "3_k9.jpg", "3_grandeur.jpg", "3_genesis_G80.jpg" };
		int[] price = { 4000, 4000, 4500, 4500, 5000, 5500, 5500, 6000, 6500, 7000, 7000, 9000 };
		int[] carSize = { 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3 };
		int[] oil = { 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

		for (int i = 0; i < name.length; i++) {
			CarList.add(new CarDTO(name[i], img[i], price[i], carSize[i], oil[i]));
		}
	}

	public boolean idCheck(String id) {
		for (int i = 0; i < UserList.size(); i++) {
			if (UserList.get(i).getId().equals(id)) {
				return false;
			}
		}
		return true;
	}

	public int idpwCheck(String id, String pw) {
		for (int i = 0; i < UserList.size(); i++) {
			if (UserList.get(i).getId().equals(id)) {
				if (UserList.get(i).getPw().equals(pw)) {
					return i;
				}
			}
		}
		return -1;
	}
	
	public void beReserved(String id,int no) {
		reservedList.put(id, RentedCarList.get(no));
		int no2=RentedCarList.get(no).getCarNo();
		CarList.get(no2).setReserved();
	}
	
	public boolean reservedId(String id) {
		boolean check=reservedList.containsKey(id);
		return check;
	}

	public Vector<UserDTO> getUserList() {
		return UserList;
	}

	public Vector<CarDTO> getCarList() {
		return CarList;
	}
	
	public Vector<RentedCar> getRentedCarList() {
		return RentedCarList;
	}

	
	public UserDTO getUser(int no) {
		return UserList.get(no);
	}

	public CarDTO getCar(int no) {
		return CarList.get(no);
	}

	public String getOilName(int no) {
		if (CarList.get(no).getOil() == 0) {
			return "휘발유";
		} else if (CarList.get(no).getOil() == 1) {
			return "경유";
		} else {
			return "LPG";
		}
	}

	public String getSizeName(int no) {
		if (CarList.get(no).getCarSize() == 0) {
			return "경차";
		} else if (CarList.get(no).getCarSize() == 1) {
			return "소형차";
		} else if (CarList.get(no).getCarSize() == 2) {
			return "중형차";
		} else {
			return "대형차";
		}
	}
}

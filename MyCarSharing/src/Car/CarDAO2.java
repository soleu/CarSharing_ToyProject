
package Car;

import java.sql.*;
import java.util.Vector;
import java.util.Date;

public class CarDAO2 {
//JDBC 활용 데이터베이서 연결 단계
// 1. JDBC 드라이버 로드
// 2. 데이터베이스와 연결
// 3. SQL문 실행
// 4. 데이터베이스와 연결 해제

	private CarDAO2() {
	}

	private static CarDAO2 dao = new CarDAO2();

	public static CarDAO2 getInstance() {
		return dao;
	}

	Connection conn = null;// DB연결
	PreparedStatement pstmt = null; // 질의,갱신,실행
	ResultSet rs = null; // 결과물 얻음

	public Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/carSharingdb?serverTimezone=UTC";
		String uid = "root";
		String pwd = "1111";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// JDBC 드라이브를 DriverManager에 등록
			conn = DriverManager.getConnection(url, uid, pwd);// 클래스(객체) 초기화
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void insertUserList(UserDTO user) {
		try {
			conn = getConnection();
			String sql = "INSERT INTO user VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getPhone());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void insertCarList(CarDTO car) {
		try {
			conn = getConnection();

			String sql = "INSERT INTO car VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, car.getNo());
			pstmt.setString(1, car.getName());
			pstmt.setString(2, car.getImg());
			pstmt.setInt(3, car.getPrice());
			pstmt.setInt(4, car.getOil());
			pstmt.setInt(5, car.getCarSize());
			pstmt.setBoolean(6, car.getReserved());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public void insertReserved(RentedCar rx) {

		String sql = "INSERT INTO reservedcar (id,carNo,beginDate,endDate,Day,Time,price,way,rentloc,backloc) VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rx.getId());
			pstmt.setInt(2, rx.getCarNo());
			pstmt.setLong(3, rx.getBeginDate().getTime());
			pstmt.setLong(4, rx.getEndDate().getTime());
			pstmt.setInt(5, rx.getDay());
			pstmt.setLong(6, rx.getTime());
			pstmt.setLong(7, rx.getPrice());
			pstmt.setString(8, rx.getWay());
			pstmt.setString(9, rx.getRentloc());
			pstmt.setString(10, rx.getBackloc());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		getCarList().get(rx.getCarNo()).setReserved();
	}

	public boolean idCheck(String id) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM user WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getInt(1) > 0)
					check = false;
				else {
					check = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return check;
	}

	public boolean idpwCheck(String id, String pw) {
		boolean result = false;

		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM user WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getInt(1) > 0)
					result = true;
				else {
					result = false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}

	public int getUserListCount() {
		int num = 0;
		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return num;
	}

	public int getCarListCount() {
		int num = 0;
		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM car";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return num;
	}

	public Vector<UserDTO> getUserList() {
		Vector<UserDTO> userList = new Vector<>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserDTO user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return userList;
	}

	public Vector<RentedCar> getRentedCarList() {
		Vector<RentedCar> rentedcarList = new Vector<>();
		RentedCar rtcar = new RentedCar();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM car";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rtcar = new RentedCar(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4), rs.getInt(5),
						rs.getLong(6), rs.getLong(7), rs.getString(8), rs.getString(9), rs.getString(10));
				rentedcarList.add(rtcar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return rentedcarList;
	}

	public Vector<CarDTO> getCarList() {
		Vector<CarDTO> carList = new Vector<>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM car";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CarDTO car = new CarDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getBoolean(7));
				carList.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}
		return carList;
	}

	public String getOilName(int no) {
		if (getCarList().get(no).getOil() == 0) {
			return "휘발유";
		} else if (getCarList().get(no).getOil() == 1) {
			return "경유";
		} else {
			return "LPG";
		}
	}

	public String getSizeName(int no) {
		if (getCarList().get(no).getCarSize() == 0) {
			return "경차";
		} else if (getCarList().get(no).getCarSize() == 1) {
			return "소형차";
		} else if (getCarList().get(no).getCarSize() == 2) {
			return "중형차";
		} else {
			return "대형차";
		}
	}

	public RentedCar findReserved(String id) {

		RentedCar rc = new RentedCar();
		String sql = "SELECT * FROM reservedcar WHERE id= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rc = new RentedCar(id, rs.getInt(2), new java.util.Date(rs.getLong(3)),
						new java.util.Date(rs.getLong(4)), rs.getInt(5), rs.getLong(6), rs.getLong(7), rs.getString(8),
						rs.getString(9), rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
		}

		return rc;
	}
}
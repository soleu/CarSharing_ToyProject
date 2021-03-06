package Car;

import java.sql.*;
import java.util.Vector;

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

	public Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/carSharingdb?serverTimezone=UTC";
		String uid = "root";
		String pwd = "1111";

		Class.forName("com.mysql.cj.jdbc.Driver");// JDBC 드라이브를 DriverManager에 등록
		// 클래스(객체) 초기화
		conn = DriverManager.getConnection(url, uid, pwd);
		return conn;
	}

	public void insertCarList(CarDTO car) {
		try {
			conn = getConnection();

			String sql = "INSERT INTO car VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
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

	public boolean idCheck(String id) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "SELECT * from user WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getBoolean(0)) {
					check = true;
				} else {
					check = false;
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

	public int idpwCheck(String id, String pw) {
		int result = -1;

		try {
			conn = getConnection();
			String sql = "SELECT count(*) FROM user WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
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
		try {
			conn = getConnection();
			String sql = "SELECT * FROM car";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				RentedCar rtcar = new RentedCar(rs.getInt(1), rs.getDate(2), rs.getDate(3), rs.getInt(4), rs.getLong(5),
						rs.getLong(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
				CarDTO car = new CarDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
						rs.getBoolean(6));
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

	public UserDTO getUser(int no) {
		UserDTO temp = new UserDTO();
		try {
			conn = getConnection();

			String sql = "select * from (select rownum as num from user) a where a.num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				temp = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
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
		return temp;
	}
	
	public CarDTO getCar(int no) {
		CarDTO temp= new CarDTO();
		try {
			conn=getConnection();
			
			String sql="select * from (select rownum as num from car) a where a.num=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				temp=new CarDTO(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getBoolean(6));
			}}
				catch (Exception e) {
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
				return temp;
	}
	
	

}
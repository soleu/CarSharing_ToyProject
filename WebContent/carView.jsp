<%@page import="Car.CarDAO2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
img {
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<table>
		<%
			String[] oilName = { "휘발유", "경유", "LPG" };
			String[] sizeName = { "경차", "소형차", "중형차", "대형차" };
			int sizeN = -1;
			if (request.getParameter("size") != null) {
				sizeN = Integer.parseInt(request.getParameter("size"));
			}

			CarDAO2 dao = CarDAO2.getInstance();

			if (sizeN == -1) {//받은게 없을땐 전체출력
		%>
		<th>전체 차량</th>
		<%
			for (int i = 0; i < dao.getCarListCount(); i++) {
					if (dao.getCarList().get(i).getReserved() == false) {//출력
						Car.CarDTO temp = dao.getCarList().get(i);
		%>
		<tr>
			<td rowspan=3><img src="img/<%=temp.getImg()%>"></td>
			<td><b><%=temp.getName()%> / <%=oilName[temp.getOil()]%></b></td>
		</tr>
		<tr>
			<td>시간 당 금액 : <%=temp.getPrice()%>원
			</td>
		</tr>
		<tr>
			<td><button type="button"
					onclick="window.location.href='carReservation3.jsp?no=<%=i%>'">예약하기</button>
				<%
					}
						}
					} else {
				%>
			<th><%=sizeName[sizeN]%></th>
			<%
				for (int i = 0; i < dao.getCarListCount(); i++) {
						if (dao.getCarList().get(i).getReserved() == false
								&& dao.getCarList().get(i).getCarSize() == sizeN) {//출력
							Car.CarDTO temp = dao.getCarList().get(i);
			%>
		
		<tr>
			<td rowspan=3><img src="img/<%=temp.getImg()%>"></td>
			<td><b><%=temp.getName()%> / <%=oilName[temp.getOil()]%></b></td>
		</tr>
		<tr>
			<td>시간 당 금액 : <%=temp.getPrice()%>원
			</td>
		</tr>
		<tr>
			<td><button type="button"
					onclick="window.location.href='carReservation3.jsp?no=<%=i%>'">예약하기</button>
				<%
					}
						}
					}
				%>
	</table>
</body>
</html>
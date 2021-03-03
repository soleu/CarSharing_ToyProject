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
			String[] oilName = { "�ֹ���", "����", "LPG" };
			String[] sizeName = { "����", "������", "������", "������" };
			int sizeN = -1;
			if (request.getParameter("size") != null) {
				sizeN = Integer.parseInt(request.getParameter("size"));
			}

			CarDAO2 dao = CarDAO2.getInstance();

			if (sizeN == -1) {//������ ������ ��ü���
		%>
		<th>��ü ����</th>
		<%
			for (int i = 0; i < dao.getCarListCount(); i++) {
					if (dao.getCarList().get(i).getReserved() == false) {//���
						Car.CarDTO temp = dao.getCarList().get(i);
		%>
		<tr>
			<td rowspan=3><img src="img/<%=temp.getImg()%>"></td>
			<td><b><%=temp.getName()%> / <%=oilName[temp.getOil()]%></b></td>
		</tr>
		<tr>
			<td>�ð� �� �ݾ� : <%=temp.getPrice()%>��
			</td>
		</tr>
		<tr>
			<td><button type="button"
					onclick="window.location.href='carReservation3.jsp?no=<%=i%>'">�����ϱ�</button>
				<%
					}
						}
					} else {
				%>
			<th><%=sizeName[sizeN]%></th>
			<%
				for (int i = 0; i < dao.getCarListCount(); i++) {
						if (dao.getCarList().get(i).getReserved() == false
								&& dao.getCarList().get(i).getCarSize() == sizeN) {//���
							Car.CarDTO temp = dao.getCarList().get(i);
			%>
		
		<tr>
			<td rowspan=3><img src="img/<%=temp.getImg()%>"></td>
			<td><b><%=temp.getName()%> / <%=oilName[temp.getOil()]%></b></td>
		</tr>
		<tr>
			<td>�ð� �� �ݾ� : <%=temp.getPrice()%>��
			</td>
		</tr>
		<tr>
			<td><button type="button"
					onclick="window.location.href='carReservation3.jsp?no=<%=i%>'">�����ϱ�</button>
				<%
					}
						}
					}
				%>
	</table>
</body>
</html>
<%@page import="Car.CarDAO2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		CarDAO2 dao = CarDAO2.getInstance();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if (dao.idpwCheck(id, pw) == true) {
			System.out.println("user:"+dao.getUserListCount());
			for (int i = 0; i < dao.getUserListCount(); i++) {
				if (dao.getUserList().get(i).getId().equals(id)) {
					session.setAttribute("log", i);
					System.out.println("i: "+i);
					break;
				}
			}
	%>
	<script>
	alert("<%=id%>�� ȯ���մϴ�!");
		window.location.href = "MainPage.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("�α��� ������ ��ġ���� �ʽ��ϴ�.");
		window.location.href = "SignIn.jsp";
	</script>
	<%
		}
	%>
</body>
</html>
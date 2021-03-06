<%@page import="Car.CarDTO"%>
<%@page import="Car.CarDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%	request.setCharacterEncoding("utf-8");
		SimpleDateFormat dfhm = new SimpleDateFormat("yyyyMMddHHmm");
		SimpleDateFormat dfhm2 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

		Date beginDate;
		Date finalDate;
		int Day;
		long Time;
		long price;

		if (request.getParameter("startDate") != null) {
			String startDate = request.getParameter("startDate").replace("-", "");
			String startTime = request.getParameter("startTime").replace(":", "");
			String endDate = request.getParameter("endDate").replace("-", "");
			String endTime = request.getParameter("endTime").replace(":", "");
			System.out.println(startDate + " ");
			System.out.println(startTime + " ");
			beginDate = dfhm.parse(startDate + startTime);
			finalDate = dfhm.parse(endDate + endTime);

			long diff = finalDate.getTime() - beginDate.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			long diffTime = (diff / (60 * 60 * 1000)) - diffDays * 24;

			Day = (int) (long) diffDays;
			Time = diffTime;
			price = Day * 10000 + Time * 1000;
			session.setAttribute("beginDate", beginDate);
			session.setAttribute("finalDate", finalDate);
			session.setAttribute("Day", Day);
			session.setAttribute("Time", Time);
			session.setAttribute("price", price);
		} else {
			beginDate = (Date) session.getAttribute("beginDate");
			finalDate = (Date) session.getAttribute("finalDate");
			Day = (int) session.getAttribute("Day");
			Time = (long) session.getAttribute("Time");
			price = (long) session.getAttribute("price");
		}
		String carV = "carView.jsp";
	%>
	<h2>요금 안내</h2>
	<div>
		대여 시작 시간 :
		<%=dfhm2.format(beginDate)%><br> 대여 종료 시간 :
		<%=dfhm2.format(finalDate)%><br> 총 사용 시간은
		<%=Day%>일
		<%=Time%>
		시간 이고, 예상 요금은
		<%=price%>원 입니다.<br>
		<form method="post" action="carReservation2.jsp?carV=carView.jsp">
			선택 가능 차랑 : <select name="size">
				<option value="0">경차</option>
				<option value="1">소형차</option>
				<option value="2">중형차</option>
				<option value="3">대형차</option>
			</select> <input type="submit" value="선택">
		</form>


		<section>
			<jsp:include page="<%=carV%>"></jsp:include>
		</section>

	</div>
</body>
</html>
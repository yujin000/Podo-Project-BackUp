<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty ticket }">
			<c:forEach items="${ticket }" var="t">
			${t.performSeq }
			${t.performTitle }
			${t.theaterName }
			${t.performPrice }
			${t.seatNum }
			${t.ticketDate }
			${t.rating }
			</c:forEach>
		</c:when>
	</c:choose>
</body>
</html>
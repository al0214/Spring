<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="board.jsp">글작성</a>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr>
				<td><c:out value="${board.bno} }" /></td>
				<td><c:out value="${board.title} }" /></td>
				<td><c:out value="${board.detail} }" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value=${board.crate_date } /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value=${board.change_date } /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input values</title>
<style>
#wrap {
	width: 971px; /* 1024*768로 해상도를 맞추어서 설계 */
	/* 가운데 정렬을 위한 바깥쪽 여백 설정 */
	margin: 0;
	margin-left: auto;
	margin-right: auto;
}

h1 {
	color: #000; /* 글 색상 */
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: 12px; /* 글꼴 크기 */
	line-height: 24px; /* 줄 간격 */
}

table td,th {
	border: #d3d3d3 solid 1px; /* 경계선 색상 스타일 굵기 */
	padding: 5px; /* 안쪽 여백 */
}

th {
	background: #346aff;
}

img {
	width: 220px; /* 이미지 너비(가로) */
	height: 300px; /* 이미지 높이(세로) */
}

a {
	text-decoration: none; /* 링크 밑줄 없애기 */
	color: black; /* 글 색상 */
}

a:HOVER {
	text-decoration: underline; /* 밑줄 */
	color: #346aff;
}
</style>
</head>
<body>
	<h3>Is work?</h3>
	<h2>Input information</h2>
	<hr>
	<div class="email">
		<span>email(ID): </span> ${ inputInfo.email }
	</div>
	<hr>
	<div class="psw">
		<span>password: </span> ${ inputInfo.password }
	</div>
	<hr>
	<div class="name">
		<span>name: </span> ${ inputInfo.name }
	</div>
	<hr>
	<div class="phone">
		<span>phone: </span> ${ inputInfo.phone }
	</div>
	<hr>
	<h2>CheckBox status</h2>
	<c:forEach items="${agrees}" var="agrees">
		${agrees}
	</c:forEach>
	
	<div id="wrap" align="center">
		<h1>회원리스트 - DB에서 읽은 결과</h1>
		<table class="list">
			
			<tr>
				<th>number</th>
				<th>email</th>
				<th>password</th>
				<th>name</th>
				<th>phone</th>
				<th>postcode</th>
				<th>address</th>
				<th>joindate</th>
				<th>grade</th>
			</tr>
			
			<c:forEach var="memberList" items="${memberList}">
				<tr class="record">
					<td> ${memberList.memberNumber} </td>
					<td> ${memberList.email} </td>
					<td> ${memberList.password} </td>
					<td> ${memberList.name} </td>
					<td> ${memberList.phone} </td>
					<td> ${memberList.postCode} </td>
					<td> ${memberList.address} </td>
					<td> ${memberList.joinDate} </td>
					<td> ${memberList.memberGrade} </td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
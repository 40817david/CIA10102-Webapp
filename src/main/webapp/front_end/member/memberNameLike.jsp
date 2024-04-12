<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員名稱模糊比對查詢結果!</title>
</head>



<body>

<h3>---搜尋的會員資料結果---</h3>
<br>
<h4><a href="<%=request.getContextPath()%>/front_end/member/select_page.jsp">回首頁</a></h4>
<br>

<table>
	<tr>
		<th>會員編號</th>
		<th>Email</th>
		<th>會員姓名</th>
		<th>密碼</th>
		<th>生日</th>
		<th>性別</th>
		<th>電話</th>
		<th>地址</th>
		<th>會員圖片</th>
	</tr>
			
			
	<c:forEach var="memVO" items="${memList}">
	<tr>
			<td>${memVO.memberId}</td>
			<td>${memVO.email}</td>
			<td>${memVO.memberName}</td>
			<td>${memVO.password}</td>
			<td>${memVO.birthday}</td>
				<c:if test="${memVO.gender==0}">
					<td>男</td>
				</c:if>
				<c:if test="${memVO.gender==1}">
					<td>女</td>
				</c:if>
				<c:if test="${memVO.gender==2}">
					<td>其他</td>
				</c:if>
			<td>${memVO.phone}</td>
			<td>${memVO.address}</td>
				<c:if test="${memVO.memberPic==null}">
					<td>無圖片</td>
				</c:if>
				<c:if test="${memVO.memberPic!=null}">
					<td><img src="<%=request.getContextPath()%>/ShowPic?memberId=${memVO.memberId}"></td>
				</c:if>
	</tr>
	</c:forEach>
		
	
	
</table>
</body>
</html>
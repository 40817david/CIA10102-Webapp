<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>


<%
	MemberVO memVO = (MemberVO)request.getAttribute("memVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>One Member -- From listOneMember.jsp</title>
</head>


<body>

<h3>---�j�M���|����Ƶ��G---</h3>
<br>
<h4><a href="select_page.jsp">�^����</a></h4>
<br>

<table>
	<tr>
		<th>�|���s��</th>
		<th>Email</th>
		<th>�|���m�W</th>
		<th>�K�X</th>
		<th>�ͤ�</th>
		<th>�ʧO</th>
		<th>�q��</th>
		<th>�a�}</th>
		<th>�|���Ϥ�</th>
	</tr>
	
	<tr>
			<td>${memVO.memberId}</td>
			<td>${memVO.email}</td>
			<td>${memVO.memberName}</td>
			<td>${memVO.password}</td>
			<td>${memVO.birthday}</td>
				<c:if test="${memVO.gender==0}">
					<td>�k</td>
				</c:if>
				<c:if test="${memVO.gender==1}">
					<td>�k</td>
				</c:if>
				<c:if test="${memVO.gender==2}">
					<td>��L</td>
				</c:if>
			<td>${memVO.phone}</td>
			<td>${memVO.address}</td>
				<c:if test="${memVO.memberPic==null}">
					<td>�L�Ϥ�</td>
				</c:if>
				<c:if test="${memVO.memberPic!=null}">
					<td>${memVO.memberPic}</td>
				</c:if>
		</tr>
	
	
</table>
</body>
</html>
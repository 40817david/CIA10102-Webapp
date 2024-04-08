<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Members -- From listAllMember.jsp</title>
</head>

<body>

<h3>---所有會員資料---</h3>
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
		<th>修改</th>
	</tr>
	
	<c:forEach var="memVO" items="${list}">
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
				
			<td>
			  <form method="post" action="<%=request.getContextPath()%>/member.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memberId"  value="${memVO.memberId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>

</html>
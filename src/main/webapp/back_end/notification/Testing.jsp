<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="notification.model.*"%>

<% 
	NotificationListVO notiVO = new NotificationListService().findByMemberId(8);
%>
<!DOCTYPE html>

<html>

<head>

<meta>
<title>Insert title here</title>
</head>


<body>

<table>
				<tr>
					<th>通知編號</th>
					<th>會員編號</th>
					<th>通知種類</th>
					<th>通知時間</th>
					<th>通知狀態</th>
					<th>通知標題</th>
					<th>通知內容</th>
				</tr>


				<tr> 
					<td><%=notiVO.getNotiId()%></td>
					<td><%=notiVO.getMember().getMemberId()%></td>
					<td><%=notiVO.getType()%></td>
					<td><%=notiVO.getTime()%></td>
					<td><%=notiVO.getStatus()%></td>					
					<td><%=notiVO.getTitle()%></td>
					<td><%=notiVO.getContent()%></td>
				</tr>


</body>

</html>
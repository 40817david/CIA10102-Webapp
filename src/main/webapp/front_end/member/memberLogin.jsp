<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>



<!DOCTYPE html>

<html>
<head>
<meta charset="BIG5">
<title>Login</title>
</head>



<body>
	<form method="post" action="" enctype="">
		<label>會員帳號<input type="text" name="" value=""></label><br>
		<label>會員密碼<input type="text" name="" value=""></label><br>
		
		<input type="hidden" name="action" value="login">
		<input type="submit" value="登入">
	</form>
	
	
	<br>
	<a href="${pageContext.request.contextPath}/front_end/member/forgetPassword.jsp">忘記密碼</a>
	
	<a href="${pageContext.request.contextPath}/front_end/member/memberRegister.jsp">註冊會員</a>

</body>

</html>
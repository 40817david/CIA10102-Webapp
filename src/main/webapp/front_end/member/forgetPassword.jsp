<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>



<!DOCTYPE html>

<html>
<head>
<meta charset="BIG5">
<title>Forget Password</title>
</head>
	
	<form method="post" action="" enctype="">
		<label>請輸入註冊之電子信箱<input type="text" name="memberEmail" value=""></label><br>
		
		<input type="hidden" name="action" value="forget">
		<input type="submit" value="確認">
	</form>
	
	<br>
	<a href="${pageContext.request.contextPath}//front_end/member/memberLogin.jsp">返回登入畫面</a>
	
	


<body>



</body>

</html>
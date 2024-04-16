<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta>
<title>會員登入</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/member-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
</head>



<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">


	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="${pageContext.request.contextPath}/img/icons/LOGO.png" alt="sing up image">
						</figure>
						<br>
						<a href="${pageContext.request.contextPath}/front_end/member/memberRegister.jsp" class="signup-image-link">註冊會員</a>
						<br>
						<a href="${pageContext.request.contextPath}/front_end/member/forgetPassword.jsp" class="signup-image-link">忘記密碼</a>
					
					</div>

					<div class="signin-form">
						<h2 class="form-title">會員登入</h2>
						<form method="post" action="${pageContext.request.contextPath}/memberLogin" class="register-form" id="login-form">
							<div class="form-group">
								<label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input required type="email" name="email" id="username" placeholder="請輸入信箱..." />
							</div>
							
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> 
								<input required type="password" name="password" id="password" placeholder="請輸入密碼..." />
							</div>
									

							<div class="form-group form-button">
								<input type="hidden" name="action" value="login">
								<input type="submit" name="signin" id="signin" class="form-submit" value="登入" />
							</div>
						</form>
						
						
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/memberLogin.js"></script>
	
	
	
	<script>

		var status = $("#status").val();
		if (status == "failed"){
			swal("錯誤","帳號或密碼錯誤，請再試一次!","error")
		}
		
	</script>
	
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
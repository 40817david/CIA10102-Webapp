<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<% 
	MemberVO memVO = (MemberVO)request.getAttribute("memVO"); 
%>

<!DOCTYPE html>

<html>
<head>
<meta>
<title>Register</title>


<!-- Font Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/member_icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">

</head>



<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">



	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">會員註冊</h2>
						
						<%-- 錯誤訊息列表呈現處 --%>

						<c:if test="${not empty errorMsgs}">
							<font style="color:red">請修正以下錯誤:</font>
							<ul>
							    <c:forEach var="message" items="${errorMsgs}">
									<li style="color:red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					
						<form method="post" action="${pageContext.request.contextPath}/memberRegister" class="register-form"
							id="register-form" enctype="multipart/form-data">
							
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label>
								<input type="email" name="email" id="email" placeholder="請輸入信箱..."
								value="<%= (memVO==null) ? "" : memVO.getEmail()%>"/>
							</div>
							
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="memberName" id="name" placeholder="請輸入姓名..."
								value="<%=(memVO==null) ? "" : memVO.getMemberName()%>"/>
							</div>
						
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
								<input type="password" name="password" id="pass" placeholder="請輸入密碼..."
								value="<%=(memVO==null) ? "" : memVO.getPassword()%>"/>
							</div>
							
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="rePassword" id="re_pass" placeholder="請再次輸入密碼..."/>
							</div>
							
							<div class="form-group">
								<label for="bir"><i class="zmdi zmdi-cake"></i></label>
								<input type="text" name="birthday" id="bir" 
								value="<%=(memVO==null) ? "" : memVO.getBirthday()%>"/>
							</div>
							
							<div class="form-group">
								<label for="gender"><i class="zmdi zmdi-male-female"></i></label>
								<select name="gender" id="gender">
									<option value="-1">請選擇性別...</option>
									<option value="0">男</option>
									<option value="1">女</option>
									<option value="2">其他</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="phone"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="phone" id="phone" placeholder="請輸入電話..."
								value="<%=(memVO==null) ? "" : memVO.getPhone()%>"/>
							</div>
							
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-home"></i></label>
								<input type="text" name="address" id="address" placeholder="請輸入地址..."
								value="<%=(memVO==null) ? "" : memVO.getAddress()%>"/>
							</div>
							
							<div class="form-group">
								<label for="pic"><i class="zmdi zmdi-assignment-account"></i></label>
								<input type="file" name="memberPic" id="pic"/>
							</div>
							

							<div class="form-group form-button">
								<input type="hidden" name="action" value="login">
								<input type="submit" id="signup" class="form-submit" value="註冊"/>
							</div>
							
						</form>
						
						
					</div>
					<div class="signup-image">
					
						<figure>
							<img src="${pageContext.request.contextPath}/img/icons/LOGO.png" alt="sing up image">
						</figure>
						
						<a href="${pageContext.request.contextPath}/front_end/member/memberLogin.jsp" class="signup-image-link">返回登入畫面</a>
					</div>
				</div>
			</div>
		</section>


	</div>




<!-- JS -->

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/member.js"></script>
	

<% 
  java.sql.Date birthday = null;
  try {
	    birthday = memVO.getBirthday();
   } catch (Exception e) {
	   birthday = new java.sql.Date(System.currentTimeMillis());
   }
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh');
$('#bir').datetimepicker({
    theme: '',              //theme: 'dark',
    timepicker:false,       //timepicker:true,
    step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
    format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '<%=birthday%>'
    //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
    //startDate:	            '2017/07/10',  // 起始日
    //minDate:               '-1970-01-01', // 去除今日(不含)之前
    //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
 });
 
</script>

<script>

var status = $("#status").val();
if(status == "success"){
	swal("恭喜您~","帳號已成功申請，請回到登入頁面進行登入!","success");
}else if (status == "failed"){
	swal("請注意~","有些選項沒有填妥喔~請麻煩再確認一次!","warning")
}

</script>
	
</body>

</html>
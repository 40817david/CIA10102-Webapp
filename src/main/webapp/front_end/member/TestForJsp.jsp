<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="member.model.*"%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Cactus BackEnd</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="<%=request.getContextPath()%>/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&family=Pridi:wght@600&display=swap" rel="stylesheet">
    
    <!-- Tac One -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pridi:wght@600&display=swap" rel="stylesheet">
   

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<%=request.getContextPath()%>/lib/animate/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>

<body>


<div id="change_block">

</div>

<h3>---資料查詢---</h3>

<%-- 錯誤訊息列表呈現處 --%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>



<ul>
	<li>
	<a href = "<%=request.getContextPath()%>/front_end/member/listAllMember.jsp">秀出所有資料</a>
	</li>
	
	
	<br>
	
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>請輸入會員編號</label>
			<input type="text" name="memberId">
			<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="送出">
		</form>
	</li>
	
	
<jsp:useBean id="memSvc" scope="page" class="member.model.MemberService" />
	
	<li>
		<form method="post" action="<%=request.getContextPath()%>/member.do">
			<label>請選擇會員編號</label>
			<select size="1" name="memberId">
				<c:forEach var="memVO" items="${memSvc.all}" > 
          			<option value="${memVO.memberId}">${memVO.memberId}
         		</c:forEach>   
       		</select>
       		<input type="hidden" name="action" value="findByPK">
       		<input type="submit" value="送出">
		</form>
	</li>

</ul>



<br>
<br>




<ul>

<li> <a href="<%=request.getContextPath()%>/front_end/member/addMember.jsp">新增會員</a></li>

</ul>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/wow/wow.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/easing/easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/waypoints/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/counterup/counterup.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="<%=request.getContextPath()%>/js/main.js"></script>

    <!-- Kit Icon -->
    <script src="https://kit.fontawesome.com/8366d3754a.js" crossorigin="anonymous"></script>

<script>


	$.ajax({
		url:'../../backendwindow.html',
		type:'get',
		success:function(res){
			$('#change_block').html($(res));
		}
	})
	
	
	</script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>

<%
MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>


<!DOCTYPE html>




<head>

<meta charset="utf-8">
<title>Cactus BackEnd</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">



<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&family=Pridi:wght@600&display=swap"
	rel="stylesheet">

<!-- Tac One -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pridi:wght@600&display=swap"
	rel="stylesheet">


<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="<%=request.getContextPath()%>/backendweb/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/backendweb/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link
	href="<%=request.getContextPath()%>/backendweb/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<%=request.getContextPath()%>/backendweb/css/style.css"
	rel="stylesheet">

</head>



<body>

	<!-- Spinner Start  瀏覽器載入前的遮蓋頁面-->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border position-relative text-primary"
			style="width: 6rem; height: 6rem;" role="status"></div>
		<img class="position-absolute top-50 start-50 translate-middle"
			src="<%=request.getContextPath()%>/backendweb/img/icon-12.png"
			alt="Icon">
	</div>
	<!-- Spinner End -->


	<!-- Topbar Start 置頂列-->
	<div class="container-fluid green-bg p-0 wow fadeIn "
		data-wow-delay="0.1s">
		<div class="row gx-0 d-none d-lg-flex shadow ">

			<!-- 左側圖標 -->
			<div class="col-lg-7 px-4 text-start">
				<img src="<%=request.getContextPath()%>/backendweb//img/LOGO-7.png">
				<span class="navbar-brand2" href="#">CACTUS</span>
				<!-- <div class="h-100 d-inline-flex align-items-center py-3 me-3"> -->
				<!-- <a class="text-body px-2" href="tel:+0123456789"><i class="fa fa-phone-alt text-white me-2"></i>+012 345 6789</a>
                    <a class="text-body px-2" href="mailto:info@example.com"><i class="fa fa-envelope-open text-gold me-2"></i>info@example.com</a> -->
				<!-- </div> -->
			</div>

			<!-- 右側文字節點 -->
			<div class="col-lg-5  text-end">

				<!-- <div class="container-fluid2">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <a class="text-white px-2" href="">加入會員</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                </div> -->
				<div class=" d-inline-flex align-items-center   height-1 border-dot">
					<!-- <a class="text-white px-2" href="">English ｜</a>
                    <a class="text-white px-2" href="">日本語 ｜</a> -->
					<a class="text-white padding-set " href="">員工姓名</a>


				</div>
				<div
					class=" d-inline-flex align-items-center  me-2 height-1 border-dot">
					<!-- <a class="text-white px-2" href="">English ｜</a>
                    <a class="text-white px-2" href="">日本語 ｜</a> -->
					<a class="text-white px-4 " href="">登出</a>


				</div>
				<!-- <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-sm-square btn-outline-body me-0" href=""><i class="fab fa-instagram"></i></a>
                </div> -->
			</div>
		</div>
	</div>
	<!-- Topbar End -->




	<div class="display-a">


		<!-- 側邊欄 -->
		<div class="main-menu">

			<!-- <nav class="main-menu"> -->
			<ul class="list">

				<!-- 
                  <li class="list-set border-dot2">                                    
                    <a class="changecolor" href=""> 
                      <i class="fa fa-home fa-lg"></i> 
                      <span class="nav-text">首頁</span> 
                    </a> 
                  </li>     
                -->

				<!-- 
                  <li class="list-set border-dot2">                                 
                    <a class="changecolor" href="">
                      <i class="fa fa-user fa-lg"></i>
                      <span class="nav-text">會員管理系統</span>
                    </a>
                  </li>    
                -->


				<li class="border-dot2">
					<!--  單獨按鈕
                    <a  class="accordion" href="">
                      <i class="fa fa-envelope-o fa-lg"></i>
                      <span class="nav-text ">活動管理</span>
                    </a> 
                  -->

					<div class="accordion-item2 ">

						<h2 class="accordion-header" id="headingOne">

							<button class="accordion-button2 collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne">
								<i class="fa-solid fa-umbrella-beach padding-set2"></i>
								&nbsp;&nbsp;&nbsp;員工管理系統
							</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse "
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">


							<div class="accordion-body2">

								<ul class="list2">
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
								</ul>

							</div>
						</div>
					</div>

				</li>


				<li class="border-dot2">


					<div class="accordion-item2 ">

						<h2 class="accordion-header" id="headingTwo">

							<button class="accordion-button2 collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="true" aria-controls="collapseTwo">
								<i class="fa-solid fa-umbrella-beach padding-set2"></i>
								&nbsp;&nbsp;&nbsp;活動管理系統
							</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse "
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body2">
								<ul class="list2">
									<li class="list-set2"><a class="changecolor" href="">活動類別管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">活動管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">活動場次</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">活動圖片管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">活動訂單管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">活動促銷管理</a>
									</li>
								</ul>

							</div>
						</div>
					</div>

				</li>


				<li class="border-dot2">


					<div class="accordion-item2 ">

						<h2 class="accordion-header" id="headingThree">

							<button class="accordion-button2 collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree"
								aria-expanded="true" aria-controls="collapseThree">
								<i class="fa-solid fa-umbrella-beach padding-set2"></i>
								&nbsp;&nbsp;&nbsp;商城管理系統
							</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse "
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body2">
								<ul class="list2">
									<li class="list-set2"><a class="changecolor" href="">管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
								</ul>

							</div>
						</div>
					</div>

				</li>


				<li class="border-dot2">


					<div class="accordion-item2 ">

						<h2 class="accordion-header" id="headingFour">

							<button class="accordion-button2 collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseFour"
								aria-expanded="true" aria-controls="collapseFour">
								<i class="fa-solid fa-umbrella-beach padding-set2"></i>
								&nbsp;&nbsp;&nbsp;房務管理系統
							</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse "
							aria-labelledby="headingFour" data-bs-parent="#accordionExample">
							<div class="accordion-body2">
								<ul class="list2">
									<li class="list-set2"><a class="changecolor" href="">管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
									<li class="list-set2"><a class="changecolor" href="">管理</a></li>
									<li class="list-set2"><a class="changecolor" href="">管理</a>
									</li>
								</ul>

							</div>
						</div>
					</div>

				</li>
			</ul>



		</div>



		<!-- =========================================================================================== -->


		<!-- 主欄位 -->
		<div class="unique">
			<h3>---新增會員資料---</h3>
			<br>
			<h4>
				<a
					href="<%=request.getContextPath()%>/front_end/member/select_page.jsp">回首頁</a>
			</h4>
			<br>

			<%-- 錯誤訊息列表呈現處 --%>

			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<form method="post" action="<%=request.getContextPath()%>/member.do"
				enctype="multipart/form-data">

				<table>

					<tr>
						<td>會員信箱:</td>
						<td><input type="text" name="email"
							value="<%=(memVO == null) ? "" : memVO.getEmail()%>"></td>
					</tr>

					<tr>
						<td>會員名稱</td>
						<td><input type="text" name="memberName"
							value="<%=(memVO == null) ? "" : memVO.getMemberName()%>"></td>
					</tr>

					<tr>
						<td>會員密碼:</td>
						<td><input type="password" name="password"
							value="<%=(memVO == null) ? "" : memVO.getPassword()%>"></td>
					</tr>

					<tr>
						<td>會員生日:</td>
						<td><input id="f_date1" type="text" name="birthday"
							value="<%=(memVO == null) ? "" : memVO.getBirthday()%>"></td>
					</tr>

					<tr>
						<td>會員性別:</td>
						<td><select name="gender">
								<option value="0">男</option>
								<option value="1">女</option>
								<option value="2">其他</option>
						</select></td>
					</tr>

					<tr>
						<td>會員電話:</td>
						<td><input type="text" name="phone"
							value="<%=(memVO == null) ? "" : memVO.getPhone()%>"></td>
					</tr>

					<tr>
						<td>會員地址:</td>
						<td><input type="text" name="address"
							value="<%=(memVO == null) ? "" : memVO.getAddress()%>"></td>
					</tr>

					<tr>
						<td>會員圖片:</td>
						<td><input type="file" name="memberPic"></td>
					</tr>


				</table>

				<input type="hidden" name="action" value="insert"> <input
					type="submit" value="送出新增">

			</form>


		</div>




	</div>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/easing/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/waypoints/waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/counterup/counterup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="<%=request.getContextPath()%>/backendweb/js/main.js"></script>

	<!-- Kit Icon -->
	<script src="https://kit.fontawesome.com/8366d3754a.js"
		crossorigin="anonymous"></script>




	<%
	java.sql.Date birthday = null;
	try {
		birthday = memVO.getBirthday();
	} catch (Exception e) {
		birthday = new java.sql.Date(System.currentTimeMillis());
	}
	%>

	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

	<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

	<script>
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
    theme: '',              //theme: 'dark',
    timepicker:false,       //timepicker:true,
    step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
    format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '<%=birthday%>
		'
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	            '2017/07/10',  // 起始日
		//minDate:               '-1970-01-01', // 去除今日(不含)之前
		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		});
	</script>

</body>


</html>
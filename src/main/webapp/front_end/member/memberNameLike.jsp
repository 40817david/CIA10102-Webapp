<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.*"%>


<!DOCTYPE html>
<html>






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
			<h3>---搜尋的會員資料結果---</h3>
			<br>
			<h4>
				<a
					href="<%=request.getContextPath()%>/front_end/member/select_page.jsp">回首頁</a>
			</h4>
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
							<td><img
								src="<%=request.getContextPath()%>/ShowPic?memberId=${memVO.memberId}"></td>
						</c:if>
					</tr>
				</c:forEach>



			</table>


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


</body>








</html>
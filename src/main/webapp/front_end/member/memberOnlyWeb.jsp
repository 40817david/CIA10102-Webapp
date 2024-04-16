<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
	  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&family=Pridi:wght@600&display=swap" rel="stylesheet">
    
    <!-- Tac One -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pridi:wght@600&display=swap" rel="stylesheet">
   

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<%=request.getContextPath()%>/backendweb/lib/animate/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/backendweb/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%=request.getContextPath()%>/backendweb/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<%=request.getContextPath()%>/backendweb/css/style.css" rel="stylesheet">
  	
  	
  	
  	
  	<style>
  		.left_item{
			text-align:center;
  		}
  		
  		
  	
  	</style>
</head>






<body>

    <!-- Spinner Start  瀏覽器載入前的遮蓋頁面-->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <img class="position-absolute top-50 start-50 translate-middle" src="<%=request.getContextPath()%>/backendweb/img/icon-12.png" alt="Icon">
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start 置頂列-->
    <div class="container-fluid green-bg p-0 wow fadeIn " data-wow-delay="0.1s">
        <div class="row gx-0 d-none d-lg-flex shadow ">

            <!-- 左側圖標 -->
            <div class="col-lg-7 px-4 text-start">
                <img src="<%=request.getContextPath()%>/backendweb/img/LOGO-7.png">
                <span class="navbar-brand2" href="#">CACTUS</span>
            </div>

            <!-- 右側文字節點 -->
            <div class="col-lg-5  text-end">
                
              	
                <img src="<%=request.getContextPath()%>/backendweb/img/LOGO-7.png">           
                
                <div class=" d-inline-flex align-items-center   height-1 border-dot"> 
                    <a class="text-white padding-set " href="">會員姓名</a>            
                </div>
                
                <div class=" d-inline-flex align-items-center  me-2 height-1 border-dot">
                    <a class="text-white px-4 " href="">登出</a>
                </div>
                

            </div>
        </div>
    </div>
    <!-- Topbar End -->




    <div class="display-a">
    

    <!-- 側邊欄 -->
    <div class="main-menu">

        <!-- <nav class="main-menu"> -->
            <ul class="list">
  
                
                  <li class="list-set border-dot2">
                  <div class="left_item">                                    
	                    <a class="changecolor" href=""> 
	                      <i class="fa-solid fa-user"></i> 
	                      <span class="nav-text">修改會員資料</span> 
	                    </a>
                    </div> 
                  </li>     
                     
                  
                  <li class="list-set border-dot2">
                  <div class="left_item">                                    
	                    <a class="changecolor" href=""> 
	                      <i class="fa-solid fa-bell"></i> 
	                      <span class="nav-text">重要消息通知</span> 
	                    </a>
                    </div> 
                  </li>   
                  
                  <li class="list-set border-dot2">
                  <div class="left_item">                                    
	                    <a class="changecolor" href=""> 
	                      <i class="fa-solid fa-person-swimming"></i> 
	                      <span class="nav-text">活動訂單查看</span> 
	                    </a>
                    </div> 
                  </li>   
                  
                  <li class="list-set border-dot2">
                  <div class="left_item">                                    
	                    <a class="changecolor" href=""> 
	                      <i class="fa-solid fa-cart-shopping"></i> 
	                      <span class="nav-text">商品訂單查看</span> 
	                    </a>
                    </div> 
                  </li>   
                  
                  <li class="list-set border-dot2">
                  <div class="left_item">                                    
	                    <a class="changecolor" href=""> 
	                      <i class="fa fa-bed fa-lg"></i> 
	                      <span class="nav-text">房務訂單查看</span> 
	                    </a>
                    </div> 
                  </li>   

              </ul>
 
        </div>



<!-- =========================================================================================== -->
 
        
        <!-- 主欄位 -->
	    <div class="unique">

	          	
	
            </div>
        

       
     
    </div>


<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/wow/wow.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/easing/easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/waypoints/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/counterup/counterup.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="<%=request.getContextPath()%>/backendweb/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="<%=request.getContextPath()%>/backendweb/js/main.js"></script>

    <!-- Kit Icon -->
    <script src="https://kit.fontawesome.com/8366d3754a.js" crossorigin="anonymous"></script>


</body>





</html>
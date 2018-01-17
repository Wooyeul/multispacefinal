<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Welcome to Multi Space</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	

<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>
	
	<script>
	$(document).ready(function(){


		var url = "chk_login.do";
 		ajaxGet(url,function(rt){
 			
 				// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
 				if(rt =="10002"){ 
					$("#login_nav").hide();
					$("#non_login_nav").show();
				}
 					
 				// 로그인 시 : rt값 -> user_name
				else if(rt!=""){
					$("#login_nav").show();
					$("#non_login_nav").hide();
					$("#user_name").text(rt+"님");
				}
 			});	
		
		var scOffset = $('.navbar-Menu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > scOffset.top) {
					$('.navbar').addClass('navbar-fixed-top');
				} else {
					$('.navbar').removeClass('navbar-fixed-top');
				}
			});
			

		});
	</script>
</head>
<body>

	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_main.jsp"%>  
	<!-- *********************  header - end  ************************ -->


	

	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			
			<!-- **********************  i ************************* -->
				<li>
					<a href="#">
						<img src="./Resources/img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">서울</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>
				
				
				
				<li>
					<a href="#">
						<img src="./Resources/img/property_2.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$1000</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="./Resources/img/property_3.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="./Resources/img/property_1.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$2500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="./Resources/img/property_2.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$1000</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="./Resources/img/property_3.jpg" alt="" title="" class="property_img"/>
					</a>
					<span class="price">$500</span>
					<div class="property_details">
						<h1>
							<a href="#">Fuisque dictum tortor at purus libero</a>
						</h1>
						<div class="property_details_box">
							<div class="property_sub_details_left">
								<h2>5000 원/시간 </h2>
							</div>
							<div class="property_sub_details_right">
								<h2><span class="property_size">즐찾수 80</span></h2>
							</div>
						</div>
					</div>
				</li>

				
				
			</ul>
			

	</section>	



	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
	

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-112826214-1', 'auto');
	ga('send', 'pageview');

</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	

<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="common.js" type="text/javascript"></script>
 <script>
 
 	$(document).ready(function(){
 		if("${user.grade}" == "2"){
 			$("#add_space").css("display","block");
 		}
 		
 		$('#boy').on("load",function(){
 			var h = this.contentWindow.document.body.offsetHeight;
 			$(this).height(h);
 		});
 		

 		if("${space_code }"=="20007"){
			$("#status-modal-body").html("판매자만 공간 등록이 가능합니다");
			$("#status-modal").modal('show');
		}else if("${space_code}"=="20006"){
			$("#status-modal-body").html("게시글이 삭제되었습니다.");
			$("#status-modal").modal('show');
		}
 		
 		$("#status-modal").on("hidden.bs.modal",function(){
			location.replace("space_home.do");
		});
 		
 		var scOffset = $( '.navbar-Menu' ).offset();
 		$( window ).scroll( function() {
 		if ( $( document ).scrollTop() > scOffset.top ) {
 			$( '.navbar' ).addClass( 'navbar-fixed-top' );
 		}else {
 			$( '.navbar' ).removeClass( 'navbar-fixed-top' );
 		}
 		});
 		var url = "chk_login.do";
	 	 	ajaxGet(url,function(rt){	
	 	 	 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
	 	 	 if(rt =="10002"){ 
	 	 		$("#login_nav").hide();				$("#non_login_nav").show();
	 	 	}
	 	 	 					
	 	 	 // 로그인 시 : rt값 -> user_name
	 	 	else if(rt!=""){ 
	 	 	$("#login_nav").show();
	 	 	$("#non_login_nav").hide(); 
	 	 	$("#user_name").text(rt+"님");
	 	 		}
 	 	 });
	 	 	
	 	 	
 	});
 </script>
 <style>
    .iframe-design{
      overflow-x:hidden; 
      overflow-y:hidden;
      width: 100%;
   }
 	.listings{
 		padding-top: 20px;
 	}
 	
 	.sh_a{
 	color : black;
 	}
 	.form-wrapper{
		text-align : center;
	}
	
	
	/* 여기부터 수진이한테 보내지마 내가 보낼게 */
	.form_back{
		align :center;
		background-color: #bfd9f2;
		height : 300px;
	}
	input[type="radio"] { 
		display: none; 
	} 
	input[type="radio"] + label { 
		font-weight: 400; font-size: 14px; 
	} 
	input[type="radio"] + label span { 
		display: inline-block; 
		width: 18px; height: 18px;
		margin: -2px 10px 0 0; 
		vertical-align: middle; 
		cursor: pointer; 
		-moz-border-radius: 50%; 
		border-radius: 50%; 
		border: 3px solid #ffffff; 
	} 
	input[type="radio"] + label span { 
		background-color: #fff; 
	} 
	input[type="radio"]:checked + label { 
		color: #333; font-weight: 700; 
	} 
	input[type="radio"]:checked + label span { 
		background-color: #95badf; 
		border: 2px solid #ffffff;
		box-shadow: 2px 2px 2px rgba(0,0,0,.1); 
	} input[type="radio"] + label span, input[type="radio"]:checked + label span { 
		-webkit-transition: background-color 0.24s linear; 
		-o-transition: background-color 0.24s linear; 
		-moz-transition: background-color 0.24s linear;
		 transition: background-color 0.24s linear; 
	}
	
	.c_div{
		margin: 0 auto;
	}
	 .select_div3 {
	 	width: 400px;
		float: left;
		margin-right: 5px;
		margin-left: 5px;
	}
	.selectdiv1{
		vertical-align : middle;
		width: 800px;
		float: left;
	}
	.select_div2{
		width: 150px;
		float: left;
	}
	.select_div1{
		float: left;
	}
	.select_div4 {
	 	width: 100px;
		float: left;
	}
	.select_div0 {
		width: 600px;
		margin:0 auto;
		margin-top: 5px;
	}	
	
 </style>
</head>
<body>
	<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	
	<div class="form_back" >
		<div class="form-wrapper">
			<form target="boy" action="space_home_iframe.do">
				<br/><h3>지역별 선택</h3>
					<div class="c_div" >
						<jl:forEach var="local" items="${local_list}" varStatus="i">
							<%-- <label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label> --%>
							<input id="l_${i.count}" name="l_category_no" value="${local.l_category_no}" type="radio"> 
							<label for="l_${i.count}" class="category_label"><span></span>
								${local.l_category_name}
							</label>
						</jl:forEach>
					</div>
				<br/>
				<br/><h3>분야별 선택</h3>
				<div class="c_div">
					<jl:forEach var="category" items="${category_list }" varStatus="i">
						<%-- <label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label> --%>
						<input id="s_${i.count}" name="s_category_no" value="${category.s_category_no}" type="radio"> 
						<label for="s_${i.count}" style="margin-right: 20px;"><span></span>
							${category.s_category_name}
						</label>
					</jl:forEach>
				</div><br/>
				<div class="select_div0">
					<div class="selectdiv1">
						<div class="select_div2">
							<select name="search_option" class="form-control">
								<option value="0"></option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목+내용</option>
							</select>
						</div>
						<div class="select_div3">
							<input type="text" name="search_content" class="form-control selectdiv3"/>
						</div>
						<div class="select_div4">
							<input type="submit" id="submitBtn" value="검색" class="btn">
						</div>
					</div>
				</div>
			<!-- 	
				<select name="search_option">
					<option value="0"></option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
				</select>
				<input type="text" name="search_content"/>
				<input type="submit" value="제출"> -->
			</form>
		</div>
	</div>
	
	<div class="container">
		<section class="listings">
			<div class="wrapper">
				<div class="properties_list">
					<hr/>
					<iframe name="boy" src="space_home_iframe.do" class="iframe-design" scrolling="no" height="1400px" frameborder="0"></iframe>
					<div class="text-right">
						<a href="space_add.do" class="sh_a" id="add_space" style="display: none;"><button class="btn_square">공간 등록</button></a>
					</div>
				</div>
				<!-- 상태 모달 -->
				<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">진행상태</h4>
							</div>
							<div class="modal-body">
								<h2 id="status-modal-body">XX 완료</h2>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
		
		
		<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
		
			
		
</body>
</html>
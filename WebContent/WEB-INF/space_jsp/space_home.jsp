<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
 </style>
</head>
<body>
	<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	<div class="container">
		<section class="listings">
			<div class="wrapper">
				<div class="properties_list">
					<div class="form-wrapper">
						<form target="boy" action="space_home_iframe.do">
							<div class="form-group">
								<label for="s_category_no">카테고리</label>
								<jl:forEach var="category" items="${category_list }">
									<label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label>
								</jl:forEach>
							</div>
							<div class="form-group">
								<label for="l_category_no">지역</label>
								<jl:forEach var="local" items="${local_list }">
									<label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label>
								</jl:forEach>
							</div>
							<select name="search_option">
								<option value="0"></option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목+내용</option>
							</select>
							<input type="text" name="search_content"/>
							<input type="submit" value="제출">
						</form>
					</div>
				<hr/>
				<iframe name="boy" src="space_home_iframe.do" class="iframe-design" scrolling="no" frameborder="0"></iframe>
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
		</div>
	</section>
		
		
		<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
		
			
		
</body>
</html>
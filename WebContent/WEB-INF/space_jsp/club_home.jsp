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

<style type="text/css">
	 .selectdiv3 {
	 	width: 400px;
		padding : 5px;
	}
	.selectdiv1{
		width: 600px;
		margin:0 auto;
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
	
	.l_cate{
		text-align : center;
		line-height: 30px;


	}
	.form_back{
	align :center;
	background-color: #bfd9f2;
	height : 300px;
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
	
	
	<div class="form_back" >
			<form id="frm" target="club_list" action="club_list.do" method="post">
				<div class="form-wrapper">
					<br/><h3>지역별 선택</h3>
						<div class="c_div" >
							<jl:forEach items="${lmap}" var="l" varStatus="i">
								<%-- <input num="${i.count}" class="a" type="radio" value="${l.l_category_no}" name="l_category_no" /><span style="color: gray;">${l.l_category_name}</span> --%>
										<input id="l_${i.count}" name="l_category_no" value="${l.l_category_no}" type="radio"> 
										<label for="l_${i.count}" style="margin-right: 20px;"><span></span>
											${l.l_category_name}
										</label>
							</jl:forEach>
						</div>
					<br/>
					<br/><h3>분야별 선택</h3>
						<div class="c_div">
							<jl:forEach items="${cmap}" var="c" varStatus="i">
								<input id="c_${i.count}" name="c_category_no" value="${c.c_category_no}" type="radio"> 
								<label for="c_${i.count}" style="margin-right: 20px;"><span></span>
									${c.c_category_name}
								</label>
								<%-- <input type="radio" value="${c.c_category_no}" name="c_category_no" /><span style="color: gray;">${c.c_category_name}</span> --%>
							</jl:forEach>
						</div>
				</div><br/>
				<div class="selectdiv1">
					<select name="search_option" class="input-sm">
						<option value="0"></option>
						<option value="5">클럽 이름</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
						<option value="4">작성자 ID</option>
					</select>
						<input type="text" name="search_content" class="selectdiv3"/>
						<input type="button" id="submitBtn" value="검색" class="btn"><br/>
				</div>
				<input id="curPage" name="curPage" type="hidden" value="">
			</form>
		</div>
	<section class="listings">
		<div class="wrapper">
			<iframe id="boy" name="club_list" width="100%"></iframe>
			<div align="right">
				<button id="btn" class="btn_square" type="button">모임등록</button>
			</div>
		</div>
	</section>
	<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->

	<!-- 자바스크립트 -->	
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* 아이프레임 스크롤바 없애기 */
			$('#boy').on("load",function(){
	          var h = this.contentWindow.document.body.offsetHeight;
	          $(this).height(h);
	       });
			
			/* 로그인 안했으면 모임 등록 버튼 숨기기 */
			if('${user_id}'==''){
				$("#btn").attr("style","display:none;");
			}
			
			
			$("#a").on("click",function(){
				$(this).attr("checked","checked")
			})
			
			$("#frm").submit();
			
			$("#btn").on("click",function(){
				location.href="club_add_page.do";
			});
			
			$("#submitBtn").on("click",function(){
				$("#curPage").attr("value",1);
				$("#frm").submit();
			});
		});
	
		function setCurpage(page){
			if($("input[name=l_category_no]:checked").val()>0){
				$("#curPage").attr("value","");
			}else{
				$("#curPage").attr("value",page);
			}
			$("#frm").submit();
		}
		
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
			$("#login_nav").hide();				
			$("#non_login_nav").show();
		 }
		 					
		 // 로그인 시 : rt값 -> user_name
		 else if(rt!=""){ 
			 $("#login_nav").show();
			 $("#non_login_nav").hide(); 
			 $("#user_name").text(rt+"님이 로그인하셨습니다.");
		 }
		});	

	</script>
</body>
</html>
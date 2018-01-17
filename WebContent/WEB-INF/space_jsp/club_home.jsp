<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="euc-kr"%>
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

</head>
<body>


	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->

	<section class="listings">
		<div class="wrapper">
			<div class="properties_list">
			
	<div class="container">
		<h2>���� ������</h2>
		
		<form id="frm" target="club_list" action="club_list.do" method="post">
			<div style="display: inline;">
				<h4>������ ����</h4>
				<jl:forEach items="${lmap}" var="l" varStatus="i">
					<input num="${i.count}" class="a" type="radio" value="${l.l_category_no}" name="l_category_no" />${l.l_category_name}
				</jl:forEach>
				<br/>
				<h4>�оߺ� ����</h4>
				<jl:forEach items="${cmap}" var="c">
					<input type="radio" value="${c.c_category_no}" name="c_category_no" />${c.c_category_name}
				</jl:forEach>
			</div><br/>
			<select name="search_option">
				<option value="0"></option>
				<option value="1">����</option>
				<option value="2">����</option>
				<option value="3">����+����</option>
				<option value="4">�ۼ���</option>
			</select>
			<input type="text" name="search_content"/>
			<br/><input type="button" id="submitBtn" value="�˻�">
			<input id="curPage" name="curPage" type="hidden" value="">
		</form>
		<br/><br/>
		
		<div>
			<iframe name="club_list" width="100%" height="100%"></iframe>
		</div>
		
		<input id="btn" class="btn_square" type="button" value="���ӵ��"/>
	</div>

				</div>

		</div>
	</section>
	<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->

	<!-- �ڹٽ�ũ��Ʈ -->	
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* �α��� �������� ���� ��� ��ư ����� */
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
		 // �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
		 if(rt =="10002"){ 
			$("#login_nav").hide();				
			$("#non_login_nav").show();
		 }
		 					
		 // �α��� �� : rt�� -> user_name
		 else if(rt!=""){ 
			 $("#login_nav").show();
			 $("#non_login_nav").hide(); 
			 $("#user_name").text(rt+"���� �α����ϼ̽��ϴ�.");
		 }
		});	

	</script>
</body>
</html>
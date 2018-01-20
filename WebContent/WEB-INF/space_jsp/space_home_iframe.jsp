<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
	
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
	$(document).ready(function(){
		$(".page").on("click",function(){
			var href = $(this).attr("hrefd");
			$("#form_search").attr("action",href);
			$("#pg").val($(this).attr("pg"));
			$("#form_search").submit();
		});
	});
 </script>
 <style>
 .listings{
 	padding-top: 10px;
 }
 .listings ul.properties_list li img.property_img{
 	height: 185px !important;
 }
 .space_list_iframe{
 	margin:0px;
 }
 </style>

</head>
<body>
		<form id="form_search" action="hi">
			<input type="hidden" name="pg" value="" id="pg">
			<input type="hidden" name="s_category_no" value="${search.s_category_no }">
			<input type="hidden" name="l_category_no" value="${search.l_category_no }">
			<input type="hidden" name="search_content" value="${search.search_content }">
			<input type="hidden" name="search_option" value="${search.search_option }">
		</form>
		
		<section class="listings">
				<div class="c_cate_list">
					<ul class="properties_list">
					<jl:forEach var="vo" items="${list2 }">
					<li>
						<p onclick="parent.location.href='space_detail.do?space_no=${vo.space_no }'" class="space_list_iframe">
									<img src="space_img/${vo.space_thumb_img }" alt="" title="" 
									class="property_img" onerror="this.src='defualt/defualt.jpg'">

								</p>
								<span class="price">지역</span>
								<div class="property_details">
									<h1 onclick="parent.location.href='space_detail.do?space_no=${vo.space_no }'">
										${vo.space_title }
									</h1>
									<div class="property_details_box">
										<div class="property_sub_details_left">
											<h2>${vo.price } 원/시간 </h2>
										</div>
									</div>
								</div>
							</li>		
					</jl:forEach>
		
				</ul>
			</div>
		</section>	
		<div class="text-center">
			<ul class="pagination pagination-sm">
				<jl:if test="${pz.hasPrevPagination }">
					<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.paginationStart-1}">&lt;</a></li>
				</jl:if>
					<jl:if test="${pz.hasPrevPage }">
						<li><a class="page" hredf="space_home_iframe.do" pg="${pz.curPagination-1 }">&lt;</a></li>
					</jl:if>
					<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
						<jl:choose>
							<jl:when test="${vs.index!=pz.curPagination }">
								<li><a class="page" hrefd="space_home_iframe.do" pg="${vs.index }">${vs.index }</a></li>
							</jl:when>
							<jl:otherwise>
								<li class="active"><a class="page" hrefd="space_home_iframe.do" pg="${vs.index }">${vs.index }</a></li>
							</jl:otherwise>
						</jl:choose>
					</jl:forEach>
					<jl:if test="${pz.hasNextPage }">
						<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.curPagination+1}">&gt;</a></li>
					</jl:if>
				<jl:if test="${pz.hasNextPagination }">
					<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.paginationEnd+1 }">&gt;&gt;</a></li>
				</jl:if>
			</ul>
		</div>
</body>
</html>
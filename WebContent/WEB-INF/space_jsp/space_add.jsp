<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="jl"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/responsive.css">

<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>

<script>
	var imageAddFlag = 1;

	var titleTimeFlag = 0;
	var titleCheckFlag = 0;
	function titleCheckLoop() {
		var title = $("#space_title2").val();
		if (title == "") {
			$("#essential_space_title2").html("필수 입력사항입니다.");
			$("#essential_space_title2").css("color", "red");
			titleCheckFlag = 0;
		} else {
			$("#essential_space_title2").text("사용 가능한 제목입니다");
			$("#essential_space_title2").css("color", "green");
			titleCheckFlag = 1;
		}
		if (titleTimeFlag == 1) {
			window.setTimeout(function() {
				titleCheckLoop();
			}, 500);
		}
	}

	var contentTimeFlag = 0;
	var contentCheckFlag = 0;
	function contentCheckLoop() {
		var content = $("#space_content2").val();
		if (content == "") {
			$("#essential_space_content2").html("필수 입력사항입니다.");
			$("#essential_space_content2").css("color", "red");
			contentCheckFlag = 0;
		} else {
			$("#essential_space_content2").text("확인되었습니다.");
			$("#essential_space_content2").css("color", "green");
			contentCheckFlag = 1;
		}
		if (contentTimeFlag == 1) {
			window.setTimeout(function() {
				contentCheckLoop();
			}, 500);
		}
	}

	var priceTimeFlag = 0;
	var priceCheckFlag = 0;
	function priceCheckLoop() {
		var price = $("#price").val();
		if (price == "") {
			$("#essential_price").html("필수 입력사항입니다.");
			$("#essential_price").css("color", "red");
			priceCheckFlag = 0;
		} else {
			$("#essential_price").text("확인되었습니다.");
			$("#essential_price").css("color", "green");
			priceCheckFlag = 1;
		}
		if (priceTimeFlag == 1) {
			window.setTimeout(function() {
				priceCheckLoop();
			}, 500);
		}
	}
	
	function zipSearch(){
		window.open("find_space_zipcode.html", "zip", "width=600,height=450");
	}
	
	function openTimeChange() {
		var x = document.getElementById("open_time_range");
		var y = document.getElementById("open_time");
		y.value = x.value;
	}

	function closeTimeChange() {
		var a = document.getElementById("close_time_range");
		var b = document.getElementById("close_time");
		b.value = a.value;
	}

	$("document").ready(function() {
		$("#sub").on("click", function() {
			if(titleCheckFlag == 0 ) {
				$("#status-modal-body").html("제목을 입력해주세요.");
	 				$("#status-modal").modal("show");
			}else if(contentCheckFlag == 0){
				$("#status-modal-body").html("내용을 입력해주세요.");
 				$("#status-modal").modal("show");
			}else if(priceCheckFlag == 0 ) {
				$("#status-modal-body").html("가격을 입력해주세요.");
 				$("#status-modal").modal("show");
			}else if($("#space_thumb_img").val().length == 0){
				$("#status-modal-body").html("썸네일 이미지를 등록해주세요.");
 				$("#status-modal").modal("show");
			}else if($("#zipcode").val().length == 0){
				$("#status-modal-body").html("주소를 등록해주세요.");
 				$("#status-modal").modal("show");
			}else {
			$("#open_time").removeAttr("disabled");
			$("#close_time").removeAttr("disabled");
			$("#addr1").removeAttr("disabled");
			$("#zipcode").removeAttr("disabled");
			$("#sub").attr("type", "submit");
			
			}
		});
	});

	$("document").ready(function() {
		//시간 설정 기능
	 		var time_click_flag = "a";
	 		var first_click_time = 0;
	 		var second_click_time = 0;
	 		
	 		 $(".cb_time").on("click",function(){
		
	 			if(time_click_flag=="a"){
	 				$(".cb_time").removeClass("active");
	 				first_click_time = $(this).attr("time");
	 				time_click_flag="b";
	 			} else if(time_click_flag=="b"){
	 				second_click_time=$(this).attr("time");
	 				if(parseInt(first_click_time) > parseInt(second_click_time)){
	 					for(var a = parseInt(second_click_time) ; a < parseInt(first_click_time) ; a ++ ) {
	 						if($("#btn_time"+[a]).html()=="X"){
	 							$(".cb_time").removeClass("active");
	 							break;
	 						} else {
	 							$("#btn_time"+[a]).addClass("active");
	 							if(a+1 == first_click_time){
	 								$("#open_time").val(second_click_time);
	 								$("#close_time").val(first_click_time);
	 							}
	 						}
	 						
	 					}
	 				} else if(parseInt(first_click_time) < parseInt(second_click_time)){
	 					for(var b = parseInt(first_click_time) ; b < parseInt(second_click_time) ; b++ ) {
	 						if($("#btn_time"+[b]).html()=="X"){
	 							$(".cb_time").removeClass("active");
	 							break;
	 						} else {
	 							$("#btn_time"+[b]).addClass("active");
	 							if(b+1 == second_click_time){
	 								$("#open_time").val(first_click_time);
	 								$("#close_time").val(second_click_time);
	 							}
	 						}
 	 				}
	 				}
	 				time_click_flag="a";
	 			} 
	 		 });
	 		 //시간 설정 끝
		$("#test").on("click", function() {
			alert($("#image_one").val());
		});
		var scOffset = $('.navbar-Menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});
		var url = "chk_login.do";
		ajaxGet(url, function(rt) {
			// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
			if (rt == "10002") {
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}

			// 로그인 시 : rt값 -> user_name
			else if (rt != "") {
				$("#login_nav").show();
				$("#non_login_nav").hide();
				$("#user_name").text(rt + "님.");
			}
		});
		//유효성 검사
		$("#space_title2").on("focusin", function() {
			$("#essential_space_title2").show();
			titleTimeFlag = 1;
			titleCheckLoop();
		});

		$("#space_title2").on("focusout", function() {
			titleTimeFlag = 0;
		});

		$("#space_content2").on("focusin", function() {
			$("#essential_space_content2").show();
			contentTimeFlag = 1;
			contentCheckLoop();
		});

		$("#space_content2").on("focusout", function() {
			contentTimeFlag = 0;
		});

		$("#price").on("focusin", function() {
			$("#essential_price").show();
			priceTimeFlag = 1;
			priceCheckLoop();
		});

		$("#price").on("focusout", function() {
			priceTimeFlag = 0;
		});
		
		$("#")

		$("#btn_add_image").on("click", function() {

			imageAddFlag++;
			if (imageAddFlag > 7) {
				alert("사진은 최대 7장까지만 가능합니다");
			} else {
				alert(imageAddFlag);
				$("#image_" + [ imageAddFlag ]).show();
			}
		});
		

	});
</script>
<style>
	.essential {
		display: none;
		color: red;
	}
	.active{
 		background: #95BADF !important;
		 	}
	.btn-time{
		padding-left: 10%;
	}
	.space-label{
 	 		margin-bottom: 10px;
 	 	}
 	 .space_add_radio{
 	 	display: inline;
 	 }
</style>
</head>
<body>
	<!-- *********************  header  ************************ -->
	<%@include file="./jsp/header_page.jsp"%>
	<!-- *********************  header - end  ************************ -->
	<div class="container">
		<h1>공간 추가</h1>
		<form method="POST" action="space_add2.do"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="crn" class="space-label">사업자번호</label> <select name="crn" id="crn" class="form-control">
					<jl:forEach var="vo" items="${host }">
						<option value="${vo.crn }">${vo.crn }</option>
					</jl:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="space_title2" class="space-label">공간 이름</label> <input type="text"
					id="space_title2" name="space_title2" class="form-control" />
				<div class="essential" id="essential_space_title2">필수 입력 사항입니다</div>
			</div>
			<div class="form-group">
				<label for="space_title2" class="space-label">공간 소개</label> <input type="text"
					id="space_content2" name="space_content2" class="form-control" />
				<div class="essential" id="essential_space_content2">필수 입력
					사항입니다</div>
			</div>
			<div class="form-group">
				<label for="space_thumb_img" class="space-label">썸네일 이미지</label> <input type="file"
					id="space_thumb_img" name="space_thumb_img" class="form-control" />
			</div>




			<div class="form-group">
				<a href="#image-modal" data-toggle="modal"><button class="btn btn-default">사진
						첨부</button></a>
			</div>
			<div class="modal fade" id="image-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">사진 첨부</h4>
						</div>
						<div class="modal-body">
							<input type="file" name="image_one" class="form-control"
								id="image_1" /> <input type="file" name="image_two"
								class="form-control-file" id="image_2" style="display: none;" /> <input
								type="file" name="image_three" class="form-control-file" id="image_3"
								style="display: none;" /> <input type="file" name="image_four"
								class="form-control-file" id="image_4" style="display: none;" /> <input
								type="file" name="image_five" class="form-control-file" id="image_5"
								style="display: none;" /> <input type="file" name="image_six"
								class="form-control-file" id="image_6" style="display: none;" /> <input
								type="file" name="image_seven" class="form-control-file" id="image_7"
								style="display: none;" />
							<button type="button" class="btn btn-default" id="btn_add_image">사진
								추가</button>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-default"
								data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<label class="space-label">운영 시간</label><br/>
			<div class="btn-group btn-group-toggle btn-lg btn-time" data-toggle="buttons">
				<jl:forEach begin="0" end="24" varStatus="time">
					  <label class="btn btn-secondary btn-info cb_time"  time="${time.index }" id="btn_time${time.index }">
					    <input type="checkbox" autocomplete="off" id="input_time${time.index }"> ${time.index }
					  </label>
			  </jl:forEach>
			</div>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				지정하지 않을 시 기본 운영시간은 0시부터 24시까지 입니다.
			</div>
			
			<input id="open_time"	name="open_time" type="hidden" min="0" max="24" value="0"
					disabled="disabled"/>

				<input id="close_time"	name="close_time" type="hidden" min="0" max="24" value="24"
					disabled="disabled" />


			<div class="form-group">
				<label for="price" class="space-label">시간당 가격</label> <input id="price" type="number"
					name="price" class="form-control" />
				<div class="essential" id="essential_price">필수 입력 사항입니다</div>
			</div>

			<div class="form-group">
				<label for="min_people" class="space-label">최소 인원</label> <input id="min_people"
					type="number" name="min_people" class="form-control" placeholder="미입력시 최소인원 0명입니다."/>
			</div>

			<div class="form-group">
				<label for="max_people" class="space-label">최대 인원</label> <input id="max_people"
					type="number" name="max_people" class="form-control" placeholder="미입력시 최대인원 1000명입니다."/>
			</div>

			<div class="form-group">
				<label for="space_call" class="space-label">연락 받을 전화번호</label> <input id="space_call"
					type="tel" name="space_call" class="form-control" placeholder="미입력시 회원정보의 연락처로 등록됩니다."/>
			</div>
				
			
			<div class="form-group">
				<label class="space-label">우편번호</label>
				<input type="text" name="zipcode" size="8" id="zipcode" class="form-control"  disabled="disabled"/>
				<input type="button" name="findzip" value="찾기" class="btnzip btn btn-primary" onclick="zipSearch()"/>
			</div>

			<div class="from-group">
				<label class="space-label">주소</label>
				<input type="text" size="40" name="addr1" class="form-control" id="addr1" disabled="disabled"/>
			</div>
			<div class="form-group">
				<label for="l_category_no" class="space-label">지역</label>
				<jl:forEach var="local" items="${local_list }">
					<label class="radio-inline"><input checked="checked" type="radio"
						name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label>
				</jl:forEach>
			</div>
			<div class="form-group">
				<label for="s_category_no" class="space-label">카테고리</label>
				<jl:forEach var="category" items="${category_list }">
					<label class="radio-inline"><input checked="checked" type="radio"
						name="s_category_no" class="space_add_radio" value="${category.s_category_no }">${category.s_category_name }</label>
				</jl:forEach>
			</div>
			<input type="button" id="sub" class="btn btn-default" value="등록"/>
		</form>
		<br/>
		<br/>
		<br/>
	</div>
	<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title text-center">주의</h4>
							</div>
							<div class="modal-body">
								<h2 id="status-modal-body" class="text-center">XX 완료</h2>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>
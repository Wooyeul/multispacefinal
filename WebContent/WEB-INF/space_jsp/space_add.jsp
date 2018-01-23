<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%><%@taglib prefix="jl"
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
			$("#essential_space_title2").html("�ʼ� �Է»����Դϴ�.");
			$("#essential_space_title2").css("color", "red");
			titleCheckFlag = 0;
		} else {
			$("#essential_space_title2").text("��� ������ �����Դϴ�");
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
			$("#essential_space_content2").html("�ʼ� �Է»����Դϴ�.");
			$("#essential_space_content2").css("color", "red");
			contentCheckFlag = 0;
		} else {
			$("#essential_space_content2").text("Ȯ�εǾ����ϴ�.");
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
			$("#essential_price").html("�ʼ� �Է»����Դϴ�.");
			$("#essential_price").css("color", "red");
			priceCheckFlag = 0;
		} else {
			$("#essential_price").text("Ȯ�εǾ����ϴ�.");
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
				$("#status-modal-body").html("������ Ȯ�����ּ���.");
	 				$("#status-modal").modal("show");
			}else if(contentCheckFlag == 0){
				$("#status-modal-body").html("������ Ȯ�����ּ���.");
 				$("#status-modal").modal("show");
			}else if(priceCheckFlag == 0 ) {
				$("#status-modal-body").html("������ Ȯ�����ּ���.");
 				$("#status-modal").modal("show");
			}else if($("#space_thumb_img").val().length == 0){
				$("#status-modal-body").html("����� �̹����� ������ּ���.");
 				$("#status-modal").modal("show");
			}else if($("#zipcode").val().length == 0){
				$("#status-modal-body").html("�ּҸ� ������ּ���.");
 				$("#status-modal").modal("show");
			}else if($("#latitude").val()==""){
				$("#status-modal-body").html("��Ȯ�� ��ġ�� �������ּ���.");
 				$("#status-modal").modal("show");
			}
			else {
			$("#open_time").removeAttr("disabled");
			$("#close_time").removeAttr("disabled");
			$("#addr1").removeAttr("disabled");
			$("#zipcode").removeAttr("disabled");
			$("#sub").attr("type", "submit");
			
			}
		});
	});

	$("document").ready(function() {
		//�ð� ���� ���
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
	 		 //�ð� ���� ��
		
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
			// �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
			if (rt == "10002") {
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}

			// �α��� �� : rt�� -> user_name
			else if (rt != "") {
				$("#login_nav").show();
				$("#non_login_nav").hide();
				$("#user_name").text(rt + "��.");
			}
		});
		//��ȿ�� �˻�
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

		$("#btn_add_image").on("click", function() {

			imageAddFlag++;
			if (imageAddFlag > 7) {
				$("#status-modal-body").html("������ �ִ� 7����� ��� �����մϴ�.");
 				$("#status-modal").modal("show");
			} else {
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
		<h1>���� �߰�</h1>
		<form method="POST" action="space_add2.do"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="crn" class="space-label">����ڹ�ȣ</label> <select name="crn" id="crn" class="form-control">
					<jl:forEach var="vo" items="${host }">
						<option value="${vo.crn }">${vo.crn }</option>
					</jl:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="space_title2" class="space-label">���� �̸�</label> <input type="text"
					id="space_title2" name="space_title" class="form-control" />
				<div class="essential" id="essential_space_title2">�ʼ� �Է� �����Դϴ�</div>
			</div>
			<div class="form-group">
				<label for="space_title2" class="space-label">���� �Ұ�</label> <input type="text"
					id="space_content2" name="space_content" class="form-control" />
				<div class="essential" id="essential_space_content2">�ʼ� �Է�
					�����Դϴ�</div>
			</div>
			<div class="form-group">
				<label for="space_thumb_img" class="space-label">����� �̹���</label> <input type="file"
					id="space_thumb_img" name="space_thumb_img" class="form-control" />
			</div>




			<div class="form-group">
				<a href="#image-modal" data-toggle="modal"><button class="btn btn-default">����
						÷��</button></a>
			</div>
			<div class="modal fade" id="image-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">���� ÷��</h4>
						</div>
						<div class="modal-body">
							<input type="file" name="image_one" class="form-control"
								id="image_1" /> <input type="file" name="image_two"
								class="form-control" id="image_2" style="display: none;" /> <input
								type="file" name="image_three" class="form-control" id="image_3"
								style="display: none;" /> <input type="file" name="image_four"
								class="form-control" id="image_4" style="display: none;" /> <input
								type="file" name="image_five" class="form-control" id="image_5"
								style="display: none;" /> <input type="file" name="image_six"
								class="form-control" id="image_6" style="display: none;" /> <input
								type="file" name="image_seven" class="form-control" id="image_7"
								style="display: none;" />
							<button type="button" class="btn btn-default" id="btn_add_image">����
								�߰�</button>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-default"
								data-dismiss="modal">Ȯ��</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
				</div>
			</div>
			<label class="space-label">� �ð�</label><br/>
			<div class="btn-group btn-group-toggle btn-lg btn-time" data-toggle="buttons">
				<jl:forEach begin="0" end="24" varStatus="time">
					  <label class="btn btn-secondary btn-info cb_time"  time="${time.index }" id="btn_time${time.index }">
					    <input type="checkbox" autocomplete="off" id="input_time${time.index }"> ${time.index }
					  </label>
			  </jl:forEach>
			</div>
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				�������� ���� �� �⺻ ��ð��� 0�ú��� 24�ñ��� �Դϴ�.
			</div>
			
			<input id="open_time"	name="open_time" type="hidden" min="0" max="24" value="0"
					disabled="disabled"/>

				<input id="close_time"	name="close_time" type="hidden" min="0" max="24" value="24"
					disabled="disabled" />


			<div class="form-group">
				<label for="price" class="space-label">�ð��� ����</label> <input id="price" type="number"
					name="price" class="form-control" />
				<div class="essential" id="essential_price">�ʼ� �Է� �����Դϴ�</div>
			</div>

			<div class="form-group">
				<label for="min_people" class="space-label">�ּ� �ο�</label> <input id="min_people"
					type="number" name="min_people" class="form-control" placeholder="���Է½� �ּ��ο� 0���Դϴ�."/>
			</div>

			<div class="form-group">
				<label for="max_people" class="space-label">�ִ� �ο�</label> <input id="max_people"
					type="number" name="max_people" class="form-control" placeholder="���Է½� �ִ��ο� 1000���Դϴ�."/>
			</div>

			<div class="form-group">
				<label for="space_call" class="space-label">���� ���� ��ȭ��ȣ</label> <input id="space_call"
					type="tel" name="space_call" class="form-control" placeholder="���Է½� ȸ�������� ����ó�� ��ϵ˴ϴ�."/>
			</div>
				
			
			<div class="form-group">
				<label class="space-label">�����ȣ</label>
				<input type="text" name="zipcode" size="8" id="zipcode" class="form-control"  disabled="disabled"/>
				<input type="button" name="findzip" value="ã��" class="btnzip btn btn-info" onclick="zipSearch()"/>
			</div>

			<div class="from-group">
				<label class="space-label">�ּ�</label>
				<input type="text" size="40" name="addr1" class="form-control" id="addr1" disabled="disabled"/>
			</div>
			<div class="form-group">
			<select id="l_category_no" name="l_category_no" class="input-sm">
				<jl:forEach items="${local_list}" var="local">
					<option value="${local.l_category_no}">${local.l_category_name}</option>
				</jl:forEach>
			</select>
			<select id="s_category_no" name="s_category_no" class="input-sm">
				<jl:forEach items="${category_list}" var="category">
					<option value="${category.s_category_no}">${category.s_category_name}</option>
				</jl:forEach>
			</select>
			</div>
			<label class="sh-map">���</label>
			<p>������ Ŭ���Ͽ� ��Ȯ�� ��ġ�� ǥ�����ּ���.</p> 
			<div id="map" style="width:100%;height:600px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec027f4a7a75f9cd6ba56c97e88f31ae&libraries=services,clusterer,drawing"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new daum.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
				 
				var map = new daum.maps.Map(container, options);
				var marker = new daum.maps.Marker({ 
				    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
				    position: map.getCenter() 
				}); 
				// ������ ��Ŀ�� ǥ���մϴ�
				marker.setMap(map);

				// Ŭ���� ����, �浵 ������ �����ɴϴ� 
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {  
			    var latlng = mouseEvent.latLng;
			    marker.setPosition(latlng);
			    
			    $("#latitude").val(latlng.getLat());
			    $("#longitude").val(latlng.getLng());
			    
			});
				
			function panTo() {
			    // �̵��� ���� �浵 ��ġ�� �����մϴ� 
			    var moveLatLon = new daum.maps.LatLng(33.450580, 126.574942);
			    
			    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
			    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
			    map.panTo(moveLatLon);            
			}       
			var dongAddr = null;
			
			var geocoder = new daum.maps.services.Geocoder();
			
			function moveMap(){
				geocoder.addressSearch(dongAddr, function(result, status) {
				    // ���������� �˻��� �Ϸ������ 
				     if (status === daum.maps.services.Status.OK) {
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        map.setCenter(coords);
				     } 
				});
			}
			</script>
			<input type="hidden" id="latitude" name="latitude">
			<input type="hidden" id="longitude" name="longitude">
			<div class="text-center">
				<input type="button" id="sub" class="btn btn-info	 btn-lg" value="���"/>
			</div>
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
								<h4 class="modal-title text-center">����</h4>
							</div>
							<div class="modal-body">
								<h2 id="status-modal-body" class="text-center">XX �Ϸ�</h2>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
							</div>
						</div>
					</div>
				</div>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>
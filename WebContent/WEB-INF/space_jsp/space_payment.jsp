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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
	$("document").ready(function(){
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
</head>
<body>
				<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	<div class="container">
	<h1>결제페이지</h1>

<h1>주문하신 상품 결제가 완료되었습니다.</h1>
         <hr>  
          <p>양용석 고객님 안녕하세요? <br>
            저희 쇼핑몰을 이용해 주셔서 대단히 감사드립니다. <br>
            고객님께서 <strong>2014년 08월 05일</strong> 구매하신 상품에 대한 금액 <strong>771,070원</strong>이 결제완료 되었습니다.</p>
        <hr>
   
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">주문 내역</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-condensed">
                <thead>
                  <tr>
                    <th>상품코드</th>
                    <th class="text-center">제품명</th>
                    <th class="text-center">금액</th>
                    <th class="text-center">예약시간</th>
                    <th class="text-right">최종금액</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>BS-200</td>
                    <td>DLBP-114</td>
                    <td class="text-center">100,000원</td>
                    <td class="text-center">1</td>
                    <td class="text-right">100,000원</td>
                  </tr>
                  <tr>
                    <td>BS-400</td>
                    <td>DS214+ 2베이 [에이블] 시게이트|[시게이트 HDD 4TB(2TB*2)]| </td>  
                    <td class="text-center">622,000원</td>
                    <td class="text-center">1</td>
                    <td class="text-right">622,000원</td>
                  </tr>
                  <tr>
                    <td>BS-1000</td>
                    <td>[Transcend] CF, 400배속 [32GB]</td>
                    <td class="text-center">45,070원</td>
                    <td class="text-center">1</td>
                    <td class="text-right">45,070원</td>
                  </tr>
                  <tr>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line text-center"><strong>합계</strong></td>
                    <td class="thick-line text-right">767,070원</td>
                  </tr>
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>운송비</strong></td>
                    <td class="no-line text-right">4,000원</td>
                  </tr>
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>최종금액</strong></td>
                    <td class="no-line text-right"><strong>771,070원</strong></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">결제 정보</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td class="text-center gr"><strong>주문번호</strong> </td>
                    <td>D1235478</td>
                    <td class="text-center gr"><strong>주문일</strong> </td>
                    <td>2014년 07월 23일</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>주문총액</strong></td>
                    <td>771,070원 </td>  
                    <td class="text-center gr"><strong>할인금액</strong></td>
                    <td>0원</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>결제금액</strong></td>
                     <td>771,070원</td>
                    <td class="text-center gr"><strong>결제상태</strong></td>
                    <td>결제완료</td>
                  </tr>

                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">배송 정보</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td class="text-center gr"><strong>받으시는 분</strong> </td>
                    <td>양용석</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>주소</strong></td>
                    <td>제주 제주시 노형동 노형뜨란채아파트 20*동 ***호</td> 
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>전화번호 </strong></td>
                     <td>064-7898-7898</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>휴대폰 번호  </strong></td>
                     <td>010-1234-5678</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>배송방법  </strong></td>
                     <td>택배</td>
                  </tr>                  
                </tbody>
              </table>
            </div>
          </div>

    </div>
		<table>
			<tr><th colspan="2">호스트&공간 정보</th></tr>
			<tr>
				<td>호스트 이름</td>
				<td>${host.host_name }</td>
			</tr>
			<tr>
				<td>공간 이름</td>
				<td>${space.space_title }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${space.space_call }</td>
			</tr>
		</table>
		
		<hr/>
		
		<table>
			<tr><th colspan="2">예약자 정보</th></tr>
			<tr>
				<td>예약자명</td>
				<td>${booking.booking_user_name }</td>
			</tr>
			<tr>
				<td>예약자 연락처</td>
				<td>${booking.booking_phone }</td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td>${booking.booking_message }</td>
			</tr>
		</table>
		
		<hr/>
		
		<table>
			<tr><th colspan="2">환불 안내</th></tr>
			<tr>
				<td>예약 5일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 4일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 3일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 2일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 당일</td>
				<td>환불 불가</td>
			</tr>
			
		</table>
		
		<h3>계좌정보 : ${host.host_account }</h3>
		
		<form method="POST" action="space_payment_clear.do">
			<input type="hidden" value="${booking.space_no }" name="space_no">
			<input type="hidden" value="${booking.user_id }" name="user_id">
			<input type="hidden" value="${booking.booking_date }" name="booking_date">
			<input type="hidden" value="${booking.start_time }" name="start_time">
			<input type="hidden" value="${booking.end_time }" name="end_time">
			<input type="hidden" value="${booking.booking_people }" name="booking_people">
			<input type="hidden" value="${booking.booking_price }" name="booking_price">
			<input type="hidden" value="${booking.booking_user_name }" name="booking_user_name">
			<input type="hidden" value="${booking.booking_phone }" name="booking_phone">
			<input type="hidden" value="${booking.booking_email }" name="booking_email">
			<input type="hidden" value="${booking.booking_message }" name="booking_message">
			
			<input type="submit">
		</form>
	</div>
		<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>
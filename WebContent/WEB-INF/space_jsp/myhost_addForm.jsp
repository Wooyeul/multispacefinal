<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

.box{
border-top :3px solid #00A65A;

}

.box2{
border-bottom: 1px solid #EEEEEE;
}

.zip{
float: left;
padding-right: 5px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function zipSearch(){
		window.open("find_zipcode.html", "zip", "width=600,height=450");
	}
	</script>
</head>
<body>
<br/>
     <!-- Horizontal Form -->
          <div class="box">
            <div class="box2">
            <br/>
            <p class="fa fa-pencil">  <label> 판매자 등록 </label></p>
           
              <br/>
                 <br/>
            </div>
         
            <!-- /.box-header -->
            <!-- form start -->
            
	               <form action="myhost_addhost.do" method="POST" name="frm" class="form-horizontal" >
              <div class="box-body">
                <div class="form-group">
	                  <label for="name" class="col-sm-1">대표명</label>
	
	                  <div class="col-sm-4">
	                   <input type="text" name="host_name" class="form-control" />
	                  </div>
                </div>
                
                <div class="form-group">
                  <label for="password" class="col-sm-1">사업자번호</label>

                  <div class="col-sm-6">
                  <input type="text" name="crn"  class="form-control" />
                  </div>
                </div>
                
                
                   <div class="form-group">
                  <label for="postnumber" class="col-sm-1">우편번호</label>

                  <div class="col-sm-4">
                 <input type="text" name="zipcode"  id="zipcode" class="form-control" />
                 </div>
                 <div class="zip">
					<input type="button" name="findzip" value="찾기"
					class="btnzip btn btn-primary" onclick="zipSearch()" />
                  </div>
                </div>
                
                
                  <div class="form-group">
                  <label for="zipcode" class="col-sm-1">주소</label>

                  <div class="col-sm-6">
                 <input type="text" size="40" name="addr1"  class="form-control" />
                  </div>
                </div>
                
           
                  <div class="form-group">
                  <label for="zipcode" class="col-sm-1">입금계좌</label>

                  <div class="col-sm-6">
                <input type="text" name="host_account"  class="form-control" />
                  </div>
                </div>
                
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
              
				<input type="reset" value="취소하기" class="btn btn-default"/>
                <button type="submit" class="btn btn-info ">등록하기</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
            
            
            


</body>
</html>
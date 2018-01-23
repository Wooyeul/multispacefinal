<%@ page contentType="text/html; charset=UTF-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-112826214-1', 'auto');
ga('send', 'pageview');
</script>
<!-- End Google Analytics -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="./Resouces_admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>


<script>
 $("document").ready(function(){
	 var url = "chk_login.do";
	 	ajaxGet(url,function(rt){
	 			
	 // �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
	 if(rt =="10002"){ 
		$("#login_nav").hide();				$("#non_login_nav").show();
	}
	 					
	 // �α��� �� : rt�� -> user_name
	else if(rt!=""){ 
	$("#login_nav").show();
	$("#non_login_nav").hide(); 
	$("#user_name").text(rt+"���� �α����ϼ̽��ϴ�.");
		}
	 });
 });
 
 
 $(function(){

     $('.input-group.date').datepicker({

         calendarWeeks: false,

         todayHighlight: true,

         autoclose: true,

         format: "yyyy/mm/dd",

         language: "kr"

     });
     
     
 });

 </script>




</script>
</head>

<body>
  <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" target="iframe1"  href="admin_main.html"> <!-- <i class="fa fa-heart"></i>  --> ������ ������ </a>
               	&nbsp;<a style="text-align: right; color:blue;" class="navbar-brand"  href="main.do"> <i class="fa fa-home"></i>Ȩ����</a>
                
                
            </div>
            
     	<aside id="left">
            <!-- /.navbar-top-links -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        
                        
                        <!-- left ��  -->
                       

                        <li>
                            <a target="iframe1" href="admin_users.do"> <i class="fa fa-user fa-fw"></i> ȸ�� ���� �׸�<span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                    <a id="admin_users.do" target="iframe1" href="admin_users.do">�Ϲ� ȸ�� ����</a>
                                </li>
                                <li>
                                	<a href="https://analytics.google.com/analytics/web/#embed/report-home/a112826214w168079406p168230732/">�湮�� ���</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> �Ǹ��� ���� �׸� <span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                    <a target="iframe1" href="admin_hosts.do">�Ǹ��� ȸ�� ����</a>
                                </li>
                                <li>
                                    <a target="iframe1" href="admin_host_request.do">��û ����Ʈ</a>
                                </li>
                            </ul>
                        </li>
                        
                          
                        <li>
                            <a target="iframe1" href="admin_spaces.do"><i class="fa  fa-list-alt fa-fw"></i> ���� ���� </a>
                        </li>
                        
                        
                        <li>
                            <a target="iframe1" href="admin_clubs.do"><i class="fa fa-gamepad   fa-fw"></i> ���� ���� </a>
                        </li>
                        
                        
                        <li>
                            <a href="#"><i class="fa  fa-comments fa-fw"></i> Ŀ�´�Ƽ ���� �׸� <span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                    <a target="iframe1" href="admin_community_board_list.do">�����Խ��� ����</a>
                                </li>
                                <li>
                                    <a target="iframe1" href="admin_community_qna_list.do">Q&A�Խ��� ����</a>
                                </li>
                                 <li>
                                    <a target="iframe1" href="admin_community_review_list.do">�ı�Խ��� ����</a>
                                </li>
                            </ul>
                        </li>
                        
                       <li>
                            <a href="#"><i class="fa fa-warning   fa-fw"></i> ���� �׸� ���� <span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                   <a target="iframe1" href="admin_notice_list.do">�������� ����</a>
                                </li>
                                <li>
                                    <a target="iframe1" href="admin_event_list.do">�̺�Ʈ ����</a>
                                </li>
                                 <li>
                                    <a target="iframe1" href="admin_faq.do">FAQ ����</a>
                                </li>
                            </ul>
                        </li>
                        
                        
                        
                         <li>
                            <a href="#"><i class="fa fa-question-circle  fa-fw"></i> �ϴ��� ����<span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                    <a target="iframe1" href="admin_o2oQnA.do">�ϴ��� ���� ����</a>
                                </li>
                                <li>
                                    <a target="iframe1" href="admin_o2oQnA_list.do">���� �� �亯 ����</a>
                                </li>
                                 <li>
                                    <a target="iframe1" href="admin_o2oQnA_list_reply.do">���� �亯 ����</a>
                                </li>
                            </ul>
                        </li>
                        
                         <li>
                            <a href="#"><i class="fa  fa-envelope-o  fa-fw"></i> ���� ����<span class="fa arrow"></span></a>
                            <ul class="nav nav-2-level">
                                <li>
                                    <a target="iframe1" href="admin_message_write.do">����������</a>
                                </li>
                                 <li>
                                    <a target="iframe1" href="admin_message_read_to.do">����������</a>
                                </li>
                            </ul>
                        </li>
         
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
	</aside>
			
	        </nav>
	
	        <!-- Page Content -->
	        <div id="page-wrapper">
	            <div class="container-fluid">
	            
	         <div class="col-lg-12">      
			<article id="article1">
				<iframe name="iframe1" src="admin_users.do" width="100%" height="1000px" frameborder="0"></iframe>	
			</article>

            </div>

                
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->


  	<!-- jQuery -->
    <script src="./Resouces_admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./Resouces_admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./Resouces_admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./Resouces_admin//dist/js/sb-admin-2.js"></script>



</body>
</html>
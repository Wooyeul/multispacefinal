<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
* {
    padding: 0px;
    margin: 0px;
}

aside#left {
    width: 175px;
    margin-top: 20px;
    float: left;
}

#left h4 {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
}

#left ul {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 15px;
    color: #FFF;
    list-style: none;
    text-indent: 15px;
}

    #left ul li {
        background: #3f3f3f;
        line-height: 28px;
        border-bottom: 1px solid #333;
    }

        #left ul li a {
            text-decoration: none;
            color: #FFF;
            display: block;
        }

            #left ul li a:hover {
                background: #d40203;
            }

        #left ul li#active {
            background: #d40203;
        }

#main {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    color: #464646;
    overflow: scroll;
    float: left;
    width: 1300px;
}

#user_manage {
	background: #FF7000 !important;
}
#user_stastic {
	background: #FF7000 !important;
}
#host_manage {
	background: #FF7000 !important;
}
#host_requests {
	background: #FF7000 !important;
}

#community_free {
	background: #FF7000 !important;
}
#community_review {
	background: #FF7000 !important;
}
#community_question {
	background: #FF7000 !important;
}


#admin_announcement {
	background: #FF7000 !important;
}
#admin_event {
	background: #FF7000 !important;
}
#admin_faq {
	background: #FF7000 !important;
}
#admin_one_one {
	background: #FF7000 !important;
}
#one_one_request {
	background: #FF7000 !important;
}
#one_one_un_reple {
	background: #FF7000 !important;
}
#one_one_reple_done {
	background: #FF7000 !important;
}
#sending_message {
	background: #FF7000 !important;
}
#have_messages {
	background: #FF7000 !important;
}
#to_messages {
	background: #FF7000 !important;
}

</style>
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

	// ȸ�� ���� �κ� 
	$("#user_manage").hide();
	$("#user_stastic").hide();
	// �Ǹ��� ���� �κ� 
	$("#host_manage").hide();
	$("#host_requests").hide();
	// Ŀ�´�Ƽ ���� �κ�
	$("#community_free").hide();
	$("#community_review").hide();
	$("#community_question").hide();
	// ������ ���� ���� �κ�
	$("#admin_announcement").hide();
	$("#admin_event").hide();
	$("#admin_faq").hide();
	// 1:1 ���� ���� �κ�
	$("#one_one_request").hide();
	$("#one_one_un_reple").hide();
	$("#one_one_reple_done").hide();
	// ���� ���� �κ�
	$("#sending_message").hide();
	$("#to_messages").hide();
	
	// ȸ�� ���� �׸� Ŭ�� ��
	$("#user").on("click",function(){
		$("#user_manage").show();
		$("#user_stastic").show();
		
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// �Ǹ��� ���� �׸� Ŭ�� ��
	$("#host").on("click",function(){
		$("#host_manage").show();
		$("#host_requests").show();
		
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// ���� ���� �׸� Ŭ�� ��
	$("#spaces").on("click",function(){
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// ���� ���� �׸� Ŭ�� ��
	$("#clubs").on("click",function(){
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// Ŀ�´�Ƽ ���� �׸� Ŭ�� ��
	$("#community").on("click",function(){
		$("#community_free").show();
		$("#community_review").show();
		$("#community_question").show();
		
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// ���� ���� �׸� Ŭ�� ��
	$("#admin_user").on("click",function(){
		$("#admin_announcement").show();
		$("#admin_event").show();
		$("#admin_faq").show();
		
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// 1:1 ���� �׸� Ŭ�� ��
	$("#one_one").on("click",function(){
		$("#one_one_request").show();
		$("#one_one_un_reple").show();
		$("#one_one_reple_done").show();
		
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#sending_message").hide();
		$("#to_messages").hide();
	});
	// ���� ���� �׸� Ŭ�� ��
	$("#message").on("click",function(){
		$("#sending_message").show();
		$("#to_messages").show();
		
		$("#user_manage").hide();
		$("#user_stastic").hide();
		$("#host_manage").hide();
		$("#host_requests").hide();
		$("#community_free").hide();
		$("#community_review").hide();
		$("#community_question").hide();
		$("#admin_announcement").hide();
		$("#admin_event").hide();
		$("#admin_faq").hide();
		$("#one_one_request").hide();
		$("#one_one_un_reple").hide();
		$("#one_one_reple_done").hide();
	});
 });
</script>
</head>
<body>

<div class="jbTitle">
	<h1>Multi Space</h1>
</div>

<!-- Fixed navbar -->
<nav class="navbar navbar-default ">
	<div class="container">
	 <div class="navbar-header">
	   <a class="navbar-brand" href="main.html">multi space</a>
	 </div>

 <div id="navbar" class="navbar-collapse collapse navbar-Menu ">
	<ul class="nav navbar-nav ">
 	 <li><a href="space_home.do">����</a></li>
	 <li><a href="club_home.do">����</a></li>
	 <li><a href="community_list.do">Ŀ�´�Ƽ</a></li>
	 <li><a href="event_user_list.do">�̺�Ʈ</a></li>	
	 <li><a href="notice_list.do">��������</a></li>
	 <li><a href="faq_list.do">FAQ</a></li>			
	 <li><a href="admin_main.do">������</a></li>			
	</ul>
			
<ul id="login_nav" class="nav navbar-nav navbar-right">
<li><a href="#" id="user_name"></a></li>
	<li><a href="mypage_moveMypageMainPage.do">����������</a></li>
	<li><a href="home_logout.do">�α׾ƿ�</a></li>	
</ul>
				
	<ul id="non_login_nav" class="nav navbar-nav navbar-right">
	     <li><a href="home_moveLoginPage.do">�α���</a></li>		
	</ul>

	   </div>
	</div>
</nav>
<!-- nav -->


	<aside id="left">
		<h4>���� �׸��</h4>
		<ul>
			<li id="user">ȸ�� ���� �׸�</li>
			<li id="user_manage"><a target="iframe1" href="admin_users.do">�Ϲ� ȸ�� ����</a></li>
			<li id="user_stastic"><a target="iframe1" href="admin_user_stastic.do">�湮�� ���</a></li>
			
			<li id="host">�Ǹ��� ���� �׸�</li>
			<li id="host_manage"><a target="iframe1" href="admin_hosts.do">�Ǹ��� ȸ�� ����</a></li>
			<li id="host_requests"><a target="iframe1" href="admin_host_request.do">��û����Ʈ</a></li>
			
			<li id="spaces"><a target="iframe1" href="admin_spaces.do">��ǰ ����</a></li>
			
			<li id="clubs"><a target="iframe1" href="admin_clubs.do">���� ����</a></li>
			
			<li id="community">Ŀ�´�Ƽ ����</li>
			<li id="community_free"><a target="iframe1" href="admin_community_board_list.do">���� �Խ��� ����</a></li>
			<li id="community_review"><a target="iframe1" href="admin_community_review_list.do">�ı� �Խ��� ����</a></li>
			<li id="community_question"><a target="iframe1" href="admin_community_qna_list.do">Q&A ����</a></li>
			
			<li id="admin_user">���� �׸� ����</li>
			<li id="admin_announcement"><a target="iframe1" href="admin_notice_list.do">���� ����</a></li>
			<li id="admin_event"><a target="iframe1" href="admin_event_list.do">�̺�Ʈ ����</a></li>
			<li id="admin_faq"><a target="iframe1" href="admin_faq.do">FAQ ����</a></li>
			
			<li id="one_one">1:1 ����</li>
			<li id="one_one_request"><a target="iframe1" href="admin_o2oQnA.do">1:1 ���� �ϱ�(�׽�Ʈ ��)</a></li>
			<li id="one_one_un_reple"><a target="iframe1" href="admin_o2oQnA_list.do">���� �� �亯 ����</a></li>
			<li id="one_one_reple_done"><a target="iframe1" href="admin_o2oQnA_list_reply.do">���� �亯 �Ϸ� ����</a></li>
			
			<li id="message">���� ����</li>
			<li id="sending_message"><a target="iframe1" href="admin_message_write.do">���� ������</a></li>
			<li id="to_messages"><a target="iframe1" href="admin_message_read_to.do">���� ������</a></li>
		</ul>
	</aside>
	
	
	<section id="main">
		<article id="article1">
			<iframe name="iframe1" src="admin_users.do" width="1300px" height="700px" seamless></iframe>	
		</article>
	</section>

</body>
</html>
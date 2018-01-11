<%@ page 
	contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

<link rel="stylesheet" href="css/style.css">

<style>
.login_div {
	margin: auto;
	width: 600px;
}

.wrapper2 {
	display: inline-block;
	width: 600px;
}

#sub-btn {
	width: 180px;
	margin: auto;
}
</style>

</head>
<body>
	<div class="login_div">
		<div class="wrapper">
			<form method="POST" action="home_login.do" class="form-signin">
				<h2 class="form-signin-heading">Please login</h2>
				
				<input type="text" class="form-control" name="user_id"
					placeholder="Email Address" autofocus="" /> 
				<input type="password" class="form-control" name="passwd" 
					placeholder="Password" />

				<button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
			</form>
			<span id="code">${code}</span>
		</div>
		
		<div class="wrapper2">
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_user_join.do" role="button">회원가입</a>
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_moveFindIdPage.do" role="button">ID 찾기</a>
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_moveFindPasswdPage.do" role="button">Passward 찾기</a>
		</div>
	</div>

</body>
</html>
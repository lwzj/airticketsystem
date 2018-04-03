<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>停车管理系统_管理员登录</title>

<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/login_704b305.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script>
function login(){
	
	var e=$("#j-tel").val();
	
	var s=$("#j-pwd").val();
	
	 var data = "{'username':'"+e+"','password':'"+s+"'}";
	$.ajax({
		 url: URL+"admin/login",
		 type: "POST",
		 data:'data='+data,
		 success: function(data){
			 if(data.code==200){
				 window.location.href="index.jsp";
			 }else if(data.code==100){
				 alert(data.message)
			 }
		 },
		 dataType: "json"
		});
}
</script>
</head>
<body>
	<div class="login_layer login_supernatant">
		<span class="vertical_middle"></span>
		<div class="login_box clearfix" id="login_box">
			<div class="login_title">
				<div class="login_logo">
					<img src="img/logo1.jpg" alt="考虫" />
				</div>
				<span>管理员登录</span>
			</div>
			<div class="login_tel">
				<input type="text" value="" id="j-tel"
					class="account_number account_input" placeholder="账号"
					autocomplete="off">
			</div>
			<div class="login_pwd">
				<input type="password" value="" id="j-pwd"
					class="account_password account_input" placeholder="密码">
			</div>
			<a href="javascript:;" id="j-login-btn" class="login_btn" onclick="login()">登录</a>
			<div class="login_hint clearfix">
				<!-- <a href="forget.html~forget.html" class="forget_pwd float_left">忘记密码？</a> -->
				<%--<a href="forgotPWD.jsp" class="skip_register float_left">忘记密码?</a> -->--%>
			</div>
			<div id="j-login-fall" class="login_fall">密码错误</div>
		</div>
	</div>
</body>
</html>

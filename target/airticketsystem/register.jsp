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
<title>停车管理系统_注册</title>

<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/login_704b305.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/forget_8985893.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
<script>
function register(){

	var e=$("#register_number").val(),t=/^1[0-9]{10}$/;
	if(!t.test(e))
		return $("#register_fall").show().html("请输入合法的手机号"),void $("#register_btn").html("注册");
	/* var r=$("#register_captcha").val(),i=/^[0-9]{4}$/;
	if(!i.test(r))
		return $("#register_fall").show().html("验证码不合法"),void $("#register_btn").html("注册"); */
	var l=$("#nickname").val();
	var a=/^([0-9a-zA-Z]|[\u4E00-\u9FA5])*$/;
	if(l==null || l=="")
		return $("#register_fall").show().html("昵称不能为空"),void $("#register_btn").html("注册");l=encodeURI(l);
	var s=$("#register_password").val(),n=/^[\w]{6,20}$/;
	if(!n.test(s))
		return $("#register_fall").show().html("密码需为6-20位英文及数字"),void $("#register_btn").html("注册");
	var o=$("#register_password_repeat").val();
	if(s!=o)
		return $("#register_fall").show().html("两次输入密码不一致"),void $("#register_btn").html("注册");
	var u = $("#usertype").val();
	var c = $("#carId").val();
	 var data = "{'tel':"+e+",'username':'"+l+"','password':'"+s+"','carId':'"+c+"','usertype':'"+u+"'}";
	$.ajax({
		 url: URL+"admin/register",
		 type: "POST",
		 data:'data='+data,
		 success: function(data){
			 if(data.code==100){
				 alert(data.message)
			 }else{
                 alert("注册成功!")
			 }
		 },
		 dataType: "json"
		});
}
</script>
<style type="text/css">
.fixed 
{ 
position:fixed;
right:300px; 
top:200px; 
width:200px;
height:200px;
background:#009999;
border:#336699 1px dashed;
+position:absolute; 
+top:expression(eval(document.body.scrollTop)+100); 
} 
</style>
</head>
<body>
	<div class="register_layer login_supernatant">
		<span class="vertical_middle"></span>
		<div class="login_box clearfix" id="register_box">
			<div class="login_title">
				<div class="login_logo">
					<img src="./img/logo1.jpg"
						alt="logo" width="97px;" height="54px;" style="margin-top: 0px;"/>
				</div>
				<span>注册</span>
			</div>
			<div class="login_tel">
				<input type="text" value="" id="register_number"
					class="account_number account_input" placeholder="手机号"
					autocomplete="off">
			</div>
			<div class="register_nickname">
				<input type="text" value="" id="nickname"
					class="account_number account_input" placeholder="昵称"
					autocomplete="off" maxlength="10">
			</div>
			<div class="register_nickname">
				<input type="text" value="" id="carId"
					   class="account_number account_input" placeholder="车牌号"
					   autocomplete="off" maxlength="10">
			</div>
			<!-- <div class="login_captcha">
				<div class="float_left captcha">
					<input type="text" value="" id="register_captcha"
						class="captcha_btn account_input" placeholder="验证码">
				</div>
				<span
					class="get_captcha float_right get_register_captcha j-get-captcha"
					id="j-get-register-captcha">获取验证码</span>
			</div> -->
			<div class="login_pwd">
				<input type="password" value="" id="register_password"
					class="account_password account_input" placeholder="密码">
			</div>
			<div class="login_pwd">
				<input type="password" value="" id="register_password_repeat"
					class="account_password_repeat account_input" placeholder="重复密码">
			</div>
			<div class="register_nickname">
				<select class="register_nickname" id="usertype">
					<option value="c1">普通会员</option>
					<option value="c2">黄金会员</option>
					<option value="c3">铂金会员</option>
					<option value="c4">钻石会员</option>
				</select>
			</div>
			<button  id="register_btn" class="login_btn" onclick="register()">注册</button>
			<%--<div class="login_hint clearfix register_hint">--%>
				<%--<a href="login_manager.jsp" class="float_right skip_login">已有账号，去登录></a>--%>
			<%--</div>--%>
			<!-- <div class="voice_code">
				<div class="voice_code_hint">
					没收到短信验证码？
					<div class="voice_btn">
						<span>20s</span>点击获取语音验证码
					</div>
				</div>
				<div class="voice_code_con">
					语音验证码已发出，请耐心等待。<br> 您将接到0571-89936434的电话为您播报验证码。<br>
					若号码被识别为骚扰电话，请撤销屏蔽后
					<div class="voice_btn">
						重新获取<span>(60s)</span>
					</div>
				</div>
			</div> -->
			<div id="register_fall" class="login_fall">手机号填写错误</div>
		</div>
		<%--<div class="register_success">--%>
			<%--注册成功，<span>3</span>秒后自动登录--%>
		<%--</div>--%>
	</div>
	<%--<div class="fixed">--%>
		<%--<img alt="erds" src="./img/weixin.jpg" style="width: 200px;height: 200px;">--%>
	<%--</div>--%>
</body>
</html>

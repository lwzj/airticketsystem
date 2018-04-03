<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
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
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
                url: "http://localhost:38080/admin/register",
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
<c:if test="${not empty admin}">
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-gear"></i> <strong>PARK</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="regist.jsp"><i class="fa fa-user fa-fw"></i>信息维护</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>系统管理</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/logout2"><i class="fa fa-sign-out fa-fw"></i>退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
		<div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="regist.jsp"><i class="fa fa-dashboard"></i> 注册用户</a>
                    </li>


                    <li>
                        <a href="userinfo.jsp"><i class="fa fa-table"></i> 修改密码</a>
                    </li>
                    <li>
                        <a href="charge.jsp"><i class="fa fa-table"></i> 用户充值 </a>
                    </li>


                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
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

                    </div>
                </div>

				

		
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
</c:if>
<c:if test="${empty admin}">
    你的权限不足或者没有<<a href="login_manager.jsp">登录</a>
</c:if>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
	 <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>


</body>

</html>
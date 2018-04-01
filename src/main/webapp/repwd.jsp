<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script type="text/javascript" src="static/js/common/common.js"></script>
    <!-- Google Fonts-->
    <script>
//        $(function(){
//            $("#id").bind("input propertychange",function () {
//                searcher();
//            });
//        })
        function updatePwd() {
            var p = $("#password").val();
            var data =  "{'password':'"+p+"'}";
            $.ajax({
                url : "http://localhost:38080/user/updatePwd",
                type : "POST",
                data : "data="+data,
                success : function (data) {
                    if (data.code == 200) {
                        var n = data.size;
                        for (var i = 0; i < n; i++) {
                            var o = data.users[i];
                            $("#username").attr("value",o.username);
                            $("#carId").attr("value",o.carId);
                            $("#usertype").attr("value",carType(o.usertype));
                            $("#tel").attr("value",o.tel);
                        }

                    }
                },
                dataType : "json",
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

<body onload="searcher()">
<c:if test="${not empty username}">
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index2.jsp"><i class="fa fa-gear"></i> <strong>PARK</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="regist.jsp"><i class="fa fa-user fa-fw"></i>信息维护</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/logout1"><i class="fa fa-sign-out fa-fw"></i>退出</a>
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
                        <a class="active-menu" href="userinfo.jsp"><i class="fa fa-table"></i> 修改密码</a>
                    </li>


                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            修改密码 <small>Modify password.</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Basic Form Elements
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form">
                                            <div class="form-group">
                                                <label>密码</label>
                                                <input type="password"  class="form-control" name="password" id="password">
                                            </div>
                                            <button onclick="updatePwd()" class="btn btn-default">修改</button>
                                            <button type="reset" class="btn btn-default">重置</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <footer><p>Copyright &copy; 2016.Company name All rights reserved.</p></footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
            <!-- /. PAGE INNER  -->
        </div>
</c:if>
<c:if test="${empty username}">
    <div>
        <h1>你没有<a href="login.jsp">登录</a></h1>
    </div>
</c:if>
        <!-- /. PAGE WRAPPER  -->
    </div>
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
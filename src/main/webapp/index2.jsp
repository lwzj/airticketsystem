﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="static/js/common/common.js"></script>
     
</head>

<body>
    <div id="wrapper">
<%--<c:if test="${not empty username}">--%>
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index2.jsp"><i class="fa fa-gear"></i> <strong>AIRTICKET</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="test/repwd.jsp"><i class="fa fa-user fa-fw"></i>修改密码</a>
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
                        <a href="index2.jsp" class="active-menu"><i class="fa fa-dashboard"></i> 首页</a>
                    </li>

                    <li>
                        <a href="table11.jsp" ><i class="fa fa-table"></i> 航班信息</a>
                    </li>
                    <li>
                        <a href="table22.jsp"><i class="fa fa-table"></i> 订单信息 </a>
                    </li>
                    <li>
                        <a href="table33.jsp"><i class="fa fa-table"></i> 意见反馈 </a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="table33.jsp"><i class="fa fa-table"></i> 用户历史信息 </a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="table44.jsp"><i class="fa fa-table"></i> 收费标准 </a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="table55.jsp"><i class="fa fa-table"></i> 当前在场信息 </a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="table66.jsp"><i class="ffa fa-table"></i> 当前可用车位信息</a>--%>
                    <%--</li>--%>


                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            航空售票系统 <small>Air ticket system</small>
                        </h1>
                    </div>
                </div>
				
				

		
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    <%--</c:if>--%>
    <%--</div>--%>
    <%--<c:if test="${empty username}">--%>
        <%--<div>--%>
            <%--<h1>你没有<a href="login.jsp">登录</a></h1>--%>
        <%--</div>--%>
    <%--</c:if>--%>
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
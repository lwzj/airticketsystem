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
    <!-- Google Fonts-->
    <link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        function tingche() {
            var stationid = $("#stationid").val();
            var carId = $("#carId").val();
            var data = "{'stationid':'"+stationid+"','carId':'"+carId+"'}";
            $.ajax({
               url : "http://localhost:38080/admin/tingche",
                type : "POST",
                data : "data="+data,
                success : function (data) {
                    if (data.code == 200) {
                        alert("停车成功！")
                    }else{
                        alert("停车失败！")
                    }
                },
                dataType : "json",
            });
        }
        function chuche() {
            var stationid = $("#stationid").val();
            var carId = $("#carId").val();
            var data = "{'stationid':'"+stationid+"','carId':'"+carId+"'}";
            $.ajax({
                url : "http://localhost:38080/admin/chuche",
                type : "POST",
                data : "data="+data,
                success : function (data) {
                    if (data.code == 200) {
                        alert("出车成功！应缴费用"+data.fee+"元 ")
                    }else{
                        alert("出车失败！")
                    }
                },
                dataType : "json",
            });
        }
    </script>
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
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                    </li>


                    <li>
                        <a href="table1.jsp"><i class="fa fa-table"></i> 出入场信息</a>
                    </li>
                    <li>
                        <a href="table2.jsp"><i class="fa fa-table"></i> 用户个人信息 </a>
                    </li>
                    <li>
                        <a href="table3.jsp"><i class="fa fa-table"></i> 用户历史信息 </a>
                    </li>
                    <li>
                        <a href="table4.jsp"><i class="fa fa-table"></i> 收费标准 </a>
                    </li>
                    <li>
                        <a href="table5.jsp"><i class="fa fa-table"></i> 当前在场信息 </a>
                    </li>
                    <li>
                        <a href="table6.jsp"><i class="ffa fa-table"></i> 当前可用车位信息</a>
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
                            停车场管理系统 <small>Parking management system.</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Charger
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>车牌号</label>
                                                <input type="text" value="" class="form-control" name="carId" id="carId">
                                            </div>
                                            <div class="form-group">
                                                <label>车位</label>
                                                <input class="form-control" name="stationid" id="stationid">
                                            </div>
                                            <button type="submit" class="btn btn-default" onclick="tingche()">停车</button>
                                            <button type="submit" class="btn btn-default" onclick="chuche()">出车</button>
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
        <!-- /. PAGE WRAPPER  -->
    </div>
</c:if>
<c:if test="${empty admin}">
    你的权限不足或者没有<a href="login_manager.jsp">登录</a>
</c:if>
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
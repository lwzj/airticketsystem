<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <script type="text/javascript" src="static/js/common/common.js"></script>
    <script type="text/javascript">
        function add() {
            var flightId = $("#flightId").val();
            var takeoffTime = $("#takeoffTime").val();
            var landingTime = $("#landingTime").val();
            var num = $("#num").val();
            var takeoffCity = $("#takeoffCity").val();
            var landingCity = $("#landingCity").val();
            var price = $("#price").val();
            var url = URL + "admin/addFlight";
            var data = "{'flightId':'" + flightId + "','takeoffTime':'" + takeoffTime + "','landingTime':'" + landingTime + "','num':'" + num + "','takeoffCity':'" + takeoffCity + "','landingCity':'" + landingCity + "','price':'" + price + "'}";
            $.ajax({
                url: url,
                type: "POST",
                data: "data=" + data,
                success: function (data) {
                    if (data.code == 200) {
                        alert("添加成功！")
                    } else {
                        alert("添加失败！")
                    }
                },
                dataType: "json",
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
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i> 添加航班</a>
                    </li>


                        <%--<li>--%>
                        <%--<a href="table1.jsp"><i class="fa fa-table"></i> 出入场信息</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<a href="table2.jsp"><i class="fa fa-table"></i> 用户个人信息 </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<a href="table3.jsp"><i class="fa fa-table"></i> 用户历史信息 </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<a href="table4.jsp"><i class="fa fa-table"></i> 收费标准 </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<a href="table5.jsp"><i class="fa fa-table"></i> 当前在场信息 </a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                        <%--<a href="table6.jsp"><i class="ffa fa-table"></i> 当前可用车位信息</a>--%>
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
                            航班管理系统
                            <small>Parking management system.</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="jebody">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    ADD FLIGHT
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>航班号</label>
                                                <input type="text" value="" class="form-control" name="flightId"
                                                       id="flightId">
                                            </div>
                                            <div class="form-group">
                                                    <div class="content">
                                                            <label>起飞时间</label>
                                                            <input class="form-control" type="datetime-local" id="takeoffTime"
                                                                       value="2016-09-24T13:59:59"/>
                                                        </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="jewarp">
                                                    <div class="content">
                                                        <div class="jeitem">
                                                            <label>降落时间</label>
                                                            <input class="form-control" type="datetime-local" value="2018-04-12T13:59:59"
                                                                   id="landingTime"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>票价</label>
                                                <input class="form-control" name="price" id="price">
                                            </div>
                                            <div class="form-group">
                                                <label>出发地</label>
                                                <input class="form-control" name="takeoffCity" id="takeoffCity">
                                            </div>
                                            <div class="form-group">
                                                <label>目的地</label>
                                                <input class="form-control" name="landingCity" id="landingCity">
                                            </div>
                                            <div class="form-group">
                                                <label>票数</label>
                                                <input class="form-control" name="num" id="num">
                                            </div>
                                            <button type="button" class="btn btn-default" onclick="add()">添加</button>
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
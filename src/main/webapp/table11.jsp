<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
    <!-- Bootstrap Styles-->
    <script type="text/javascript" src="js/jquery.js"></script>
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <script type="text/javascript"
            src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
    <script type="text/javascript"
            src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <%--<link href='http://fonts.useso.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />--%>
    <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
    <script type="text/javascript" src="static/js/common/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#search").bind("input propertychange", function () {
                searcher();
            });
        })

        function searcher() {
            $("#parkList").empty();
            var list = "";
            var s = $('#search').val();
            var data = "{'id':'" + s + "'}";
            $.ajax({
                url: URL + "user/queryFlightById",
                type: "POST",
                data: "data=" + data,
                success: function (data) {
                    if (data.code == 200) {
                        var n = data.size;
                        for (var i = 0; i < n; i++) {
                            var o = data.flights[i];
                            list += "<tr class=\"odd gradeX\"><td>" + o.flightId + "</td>\n" +
                                "<td>" + o.takeoffTime + "</td>\n" +
                                "<td>" + o.landingTime + "</td>\n" +
                                "<td class=\"center\">" + o.price + "</td>\n" +
                                "<td class=\"center\">" + o.takeoffCity + "</td>\n" +
                                "<td class=\"center\">" + o.landingCity + "</td>\n" +
                                "<td class=\"center\">" + o.num + "</td>\n" +
                                "<td class=\"center\"><input value='订票' id='flight_" + o.id + "' type='button' onclick='show(" + o.id + ")' /> </td></tr>"
                        }

                        $("#parkList").append(list);
                    } else {
                        alert(data.message);

                    }
                },
                dataType: "json",
            });
        }


        function show(id) {
            $("#ftid").data("ftid", id);
            $("#infos").show();
        }


        function order() {
            var list = new Array();
            var ftid = $("#ftid").data("ftid");
            var $name = $(".username");
            var $IDcard = $(".IDcard");
//            var data = '';
            for (var i = 0; i < $name.length; i++) {
                var order = {};
                order.flightId = ftid;
                order.username = $name[i].value;
                order.IDcard = $IDcard[i].value;
                list.push(order);
            }
            var olist = JSON.stringify(list);
//            alert(olist);
            data = olist;
            $.ajax({
                url: URL + "user/order",
                type: "POST",
                data: "data=" + data,
                success: function (data) {
                    if (data.code == 200) {
                        $("#infos").hide();
                        $(".username").attr("value","");
                        $(".IDcard").attr("value","");
                        alter(data.message+"订单号："+data.id);
                    }
                    else{
                        alter(data.message)
                    }
                },
                dataType: "json",
            });

        }

        function addUser() {
            $("#info").append("姓名：<input type=\"text\" class=\"username\"/>证件号：<input type=\"text\" class=\"IDcard\"/><br>")
        }

        //        function queryPark() {
        //            var list = "";
        //            $.ajax({
        //                url: URL + "user/queryFlight",
        //                type : "POST",
        //                success: function (data) {
        //                    if (data.code == 200) {
        //                        var n = data.size;
        //                        for (var i = 0; i < n; i++) {
        //                            var o = data.parks[i];
        //                            var start = new Date(o.startpark.time);
        //                            var end = new Date(o.endpark.time);
        //                            list += "<tr class=\"odd gradeX\"><td>" + o.stationid + "</td>\n" +
        //                                "<td>" + o.carId + "</td>\n" +
        //                                "<td>" + start.pattern("yyyy-MM-dd HH:mm:ss") + "</td>\n" +
        //                                "<td class=\"center\">" + end.pattern("yyyy-MM-dd HH:mm:ss")+ "</td>\n" +
        //                                "<td class=\"center\">" + o.fee + "</td></tr>"
        //                        }
        //                        $("#parkList").append(list);
        //                    }else{
        //                        alert(data.message);
        //                    }
        //                },
        //                dataType: "json"
        //            });
        //        }
    </script>

</head>
<body>
<div id="ftid"></div>
<div id="wrapper">
    <c:if test="${not empty username}">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index2.jsp"><i class="fa fa-gear"></i> <strong>FLIGHT</strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <%--<ul class="dropdown-menu dropdown-user">--%>
                <%--<li><a href="regist.jsp"><i class="fa fa-user fa-fw"></i>信息维护</a>--%>
                <%--</li>--%>
                <%--<li><a href="#"><i class="fa fa-gear fa-fw"></i>系统管理</a>--%>
                <%--</li>--%>
                <%--<li class="divider"></li>--%>
                <%--<li><a href="/logout1"><i class="fa fa-sign-out fa-fw"></i>退出</a>--%>
                <%--</li>--%>
                <%--</ul>--%>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="index2.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                </li>

                <li>
                    <a href="table11.jsp" class="active-menu"><i class="fa fa-table"></i> 航班信息</a>
                </li>
                <li>
                    <a href="table22.jsp"><i class="fa fa-table"></i> 订单信息 </a>
                </li>
                <li>
                    <a href="table33.jsp"><i class="fa fa-table"></i> 意见反馈 </a>
                </li>
                <%--<li>
                    <a href="table44.jsp"><i class="fa fa-table"></i> 收费标准 </a>
                </li>
                <li>
                    <a href="table55.jsp"><i class="fa fa-table"></i> 当前在场信息 </a>
                </li>
                <li>
                    <a href="table66.jsp"><i class="ffa fa-table"></i> 当前可用车位信息</a>
                </li>
                    </ul>
                </li>--%>

            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        航班信息
                        <small>Admission information</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            航班信息
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div class="col-sm-6">
                                    <div id="dataTables-example_filter" class="dataTables_filter">
                                        <label>Search:<input id="search" type="search" class="form-control input-sm"
                                                             aria-controls="dataTables-example"></label>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>航班号</th>
                                        <th>起飞时间</th>
                                        <th>到达时间</th>
                                        <th>票价</th>
                                        <th>出发地</th>
                                        <th>目的地</th>
                                        <th>剩余票数</th>
                                        <th>订票</th>
                                    </tr>
                                    </thead>
                                    <tbody id="parkList">

                                    </tbody>
                                </table>
                            </div>
                            <!-- 弹出添加人员信息-->
                            <div id="infos" style="display: none">
                                <div id="info">

                                    姓名：<input type="text" class="username"/>
                                    证件号：<input type="text" class="IDcard"/><br>
                                </div>
                                <input id="user" type="button" value="添加乘客" onclick="addUser()"/>
                                <input id="order" type="button" value="订票" onclick="order()">
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            <!-- /. ROW  -->

        </div>
        <footer><p>Copyright &copy; 2016.Company name All rights reserved.</p></footer>
    </div>
    <!-- /. PAGE INNER  -->
    </c:if>
    <c:if test="${empty username}">
    <div>
    <h1>你没有<a href="login.jsp">登录</a></h1>
    </div>
    </c:if>
</div>
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<%--<script src="assets/js/dataTables/jquery.dataTables.js"></script>--%>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>


</body>
</html>

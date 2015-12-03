<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="template_admin2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="template_admin2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="template_admin2/dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="template_admin2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="template_admin2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="ManagerHome.jsp">Manager</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        ${firstname} ${lastname}<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="help.html"><i class="fa fa-gear fa-fw"></i> Help</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="index.htm"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="ManagerHome.jsp"><i class="fa fa-dashboard fa-fw"></i> Manager Info</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Employees<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="EditEmployeeForm.jsp">New Employee</a>
                                </li>
                                <li>
                                    <a href="M_findEmployee.jsp">Find Employee</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Sales Reports<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="SalesReportJan.jsp">January</a>
                                </li>
                                <li>
                                    <a href="SalesReportFeb.jsp">February</a>
                                </li>
                                <li>
                                    <a href="SalesReportMar.jsp">March</a>
                                </li>
                                <li>
                                    <a href="SalesReportApr.jsp">April</a>
                                </li>
                                <li>
                                    <a href="SalesReportMay.jsp">May</a>
                                </li>
                                <li>
                                    <a href="SalesReportJun.jsp">June</a>
                                </li>
                                <li>
                                    <a href="SalesReportJul.jsp">July</a>
                                </li>
                                <li>
                                    <a href="SalesReportAug.jsp">August</a>
                                </li>
                                <li>
                                    <a href="SalesReportSep.jsp">September</a>
                                </li>
                                <li>
                                    <a href="SalesReportOct.jsp">October</a>
                                </li>
                                <li>
                                    <a href="SalesReportNov.jsp">November</a>
                                </li>
                                <li>
                                    <a href="SalesReportDec.jsp">December</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="ItemDisplay.jsp"><i class="fa fa-table fa-fw"></i> Items</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Sales By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="SalesByItemName.jsp">Item Name</a>
                                </li>
                                <li>
                                    <a href="SalesByCustomerName.jsp">Customer Name</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Summary Revenue By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="RevenueByItem.jsp">Item</a>
                                </li>
                                <li>
                                    <a href="RevenueByItemType.jsp">Item Type</a>
                                </li>
                                <li>
                                    <a href="RevenueByCustomer.jsp">Customer</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Highest Total Revenue By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="TotalRevenueEmployee.jsp">Customer Representative</a>
                                </li>
                                <li>
                                    <a href="TotalRevenueCustomer.jsp">Customer</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="BestSellersList.jsp"><i class="fa fa-edit fa-fw"></i> Best Sellers List</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
			<h2>Revenue By Customer</h2>
			<div>
				<form name="myForm" action="M_custSearch.jsp" method="post">
					<div class="form-control">
						<label>Search Customer:</label> <input type="number"
							name="customerNum" required />
					</div>
					<div>
						<button type="submit" class="btn btn-primary">Search</button>
					</div>
				</form>
			</div>
			<c:if test="${not empty returnVal and returnVal ne ''}">
				<div class="row">
					<div class="col-lg-12">
						<div class="alert alert-danger">${returnVal}</div>
					</div>
				</div>
			</c:if>
			<div class="row">
				<table class="table table-striped">
					<tr>
						<th>Customer ID</th>
						<th>Name</th>
						<th>Revenue Generated</th>
						
					</tr>
					<c:if test="${not empty customerID and customerID ne ''}">
						<tr>
							<td>${customerID}</td>
							<td><c:out value="${cfirstName} ${clastName}" /></td>
							<td>${revenueGenerated}</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
		<!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="template_admin2/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="template_admin2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="template_admin2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="template_admin2/dist/js/sb-admin-2.js"></script>

</body>

</html>

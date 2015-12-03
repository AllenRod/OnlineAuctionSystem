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
                <a class="navbar-brand" href="index.html">Manager</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        ${firstname} ${lastname}<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
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
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Manager Info</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Employees<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">New Employee</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Find Employee</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Sales Reports<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">January</a>
                                </li>
                                <li>
                                    <a href="#">February</a>
                                </li>
                                <li>
                                    <a href="#">March</a>
                                </li>
                                <li>
                                    <a href="#">April</a>
                                </li>
                                <li>
                                    <a href="#">May</a>
                                </li>
                                <li>
                                    <a href="#">June</a>
                                </li>
                                <li>
                                    <a href="#">July</a>
                                </li>
                                <li>
                                    <a href="#">August</a>
                                </li>
                                <li>
                                    <a href="#">September</a>
                                </li>
                                <li>
                                    <a href="#">October</a>
                                </li>
                                <li>
                                    <a href="#">November</a>
                                </li>
                                <li>
                                    <a href="#">December</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Items</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Sales By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Item Name</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Customer Name</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Summary Revenue By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Item</a>
                                </li>
                                <li>
                                    <a href="#">Item Type</a>
                                </li>
                                <li>
                                    <a href="#">Customer</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Highest Total Revenue By<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Customer Representative</a>
                                </li>
                                <li>
                                    <a href="login.html">Customer</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Best Sellers List</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
			<h2>Employee Edit Page</h2>
			<form name="myForm" action="editEmployeeInfo.jsp" method="post">
				<div class="form-group">
					<label>ID</label> <input class="form-control" name="id"
						value="${employeeID}" readonly />
				</div>
				<div class="form-group">
					<label>First Name</label> <input class="form-control"
						name="firstName" value="${cfirstName}" required />
				</div>
				<div class="form-group">
					<label>Last Name</label> <input class="form-control"
						name="lastName" value="${clastName}" required />
				</div>
				<div class="form-group">
					<label>Address</label> <input class="form-control" name="address"
						value="${caddress}" />
				</div>
				<div class="form-group">
					<label>City</label> <input class="form-control" name="city"
						value="${ccity}" />
				</div>
				<div class="form-group">
					<label>State</label> <input class="form-control" name="state"
						type="text" maxlength="2" value="${cstate}" />
				</div>
				<div class="form-group">
					<label>Zip Code</label> <input class="form-control" name="zipcode"
						type="number" max="99999" value="${czip}" />
				</div>
				<div class="form-group">
					<label>Telephone</label> <input class="form-control"
						name="telephone" value="${ctel}" type="number"
						max="9999999999" />
				</div>
				<div class="form-group">
					<label>Credit Card Number</label> <input class="form-control"
						name="ccn" value="${ccn}" type="number"
						max="9999999999999999" />
				</div>
				<div class="form-group">
					<label>Social Security Number</label> <input class="form-control"
						name="ssn" value="${ssn}" type="number"
						max="999999999" />
				</div>
				<div class="form-group">
					<label>Start Date</label> <input class="form-control"
						name="startDate" value="${startDate}" type="date" />
				</div>
				<div class="form-group">
					<label>Hourly Rate</label> <input class="form-control"
						name="hourlyRate" value="${hourlyRate}" type="number"/>
				</div>
				<div class="form-group">
					<label>Social Security Number</label> <input class="form-control"
						name="ssn" value="${ssn}" type="number"
						max="999999999" />
				</div>
				<div class="form-group">
					<label>Level</label> <input class="form-control"
						name="level" value="${level}" type="number"
						max="1" />
				</div>
				<button type="submit" class="btn btn-primary">Edit</button>
			</form>
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

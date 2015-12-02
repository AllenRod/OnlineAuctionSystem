<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Customer Profile - OAS</title>

<!-- Bootstrap Core CSS -->
<link
	href="template_admin2/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="template_admin2/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="template_admin2/dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="template_admin2/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="template_admin2/bower_components/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="template_admin2/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Customer
					Representative</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">${firstName} ${lastName}<i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="index.htm"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="CustomerInformation.jsp"><i class="fa fa-dashboard fa-fw"></i>
								Personal Information</a></li>
						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Browse All Listings</a></li>
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								Search for Sellers</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Purchase History</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Listing History</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<h2>Personal Information</h2>
			<form name="myForm" action="editCustInfo.jsp" method="post">
				<div class="form-group">
					<label>ID</label> <input class="form-control"
						name="id" value="${id}" readonly />
				</div>
				<div class="form-group">
					<label>Email Address</label> <input class="form-control"
						name="email" value="${email}" type="email" required/>
				</div>
				<div class="form-group">
					<label>First Name</label> <input class="form-control"
						name="firstName" value="${firstName}" required />
				</div>
				<div class="form-group">
					<label>Last Name</label> <input class="form-control"
						name="lastName" value="${lastName}" required />
				</div>
				<div class="form-group">
					<label>Address</label> <input class="form-control"
						name="address" value="${address}"/>
				</div>
				<div class="form-group">
					<label>City</label> <input class="form-control"
						name="city" value="${city}"/>
				</div>
				<div class="form-group">
					<label>State</label> <input class="form-control"
						name="state" type="text" maxlength="2" value="${state}"/>
				</div>
				<div class="form-group">
					<label>Zip Code</label> <input class="form-control"
						name="zipcode" type="number" max="99999" value="${zipcode}" />
				</div>
				<div class="form-group">
					<label>Telephone</label> <input class="form-control"
						name="telephone" value="${telephone}" type="number" max="9999999999"/>
				</div>
				<button type="submit" class="btn btn-primary">Edit</button>
			</form>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="template_admin2/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="template_admin2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="template_admin2/bower_components/metisMenu/dist/metisMenu.min.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="template_admin2/dist/js/sb-admin-2.js"></script>

</body>

</html>

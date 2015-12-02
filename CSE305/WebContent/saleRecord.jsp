<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Customer Representative Home Page - OAS</title>

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
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="EmployeeHome.jsp"><i
								class="fa fa-home fa-fw"></i>Home</a></li>
						<li><a href="saleRecord.jsp"><i class="fa fa-bars fa-fw"></i>
								Record Sale</a></li>
						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Employees</a></li>

						<li><a href="tables.html"><i class="fa fa-users fa-fw"></i>
								Users</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Forms</a></li>
						<li><a href="#"><i class="fa fa-users fa-fw"></i>
								Customers<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="newCustomer.html">New Customer</a></li>
								<li><a href="buttons.html">Find Customer</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
								Summary Revenue By<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#">Item</a></li>
								<li><a href="#">Item Type</a></li>
								<li><a href="#">Customer</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
								Highest Total Revenue By<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="blank.html">Customer Representative</a></li>
								<li><a href="login.html">Customer</a></li>
							</ul> <!-- /.nav-second-level --></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<h2>Sales Record</h2>
			<div>
				<form name="myForm" action="E_record.jsp" method="post">
					<div class="form-control">
						<label>Search Auction:</label> <input type="number"
							name="auctionNum" required />
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
						<th>Auction ID</th>
						<th>Item ID</th>
						<th>Item Name</th>
						<th>Buyer ID</th>
						<th>Buyer Name</th>
						<th>Seller ID</th>
						<th>Price</th>
						<th>Transaction Date</th>
					</tr>
					<tr>
						<c:if test="${auctionID ne ''}">
							<td>${auctionID}</td>
							<td>${itemID}</td>
							<td>${itemName}</td>
							<td>${buyerID}</td>
							<td>${buyerName}</td>
							<td>${sellerID}</td>
							<td>${paidAmt}</td>
							<td>${close}</td>
						</c:if>
					</tr>
				</table>
			</div>
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

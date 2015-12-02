<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Customer Homepage - OAS</title>

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
				<a class="navbar-brand" href="index.html">OAS Customer Homepage</a>
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
						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Personal Information</a></li>
						<li><a href="index.html"><i class="fa fa-dashboard fa-fw"></i>
								Employees</a></li>
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								Items</a></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								Forms</a></li>
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i> Sales
								By<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="panels-wells.html">Item Name</a></li>
								<li><a href="buttons.html">Customer Name</a></li>
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
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">Current Bids</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>Auction ID</th>
									<th>Item Name</th>
									<th>Current Bid</th>
									<th>End Time</th>
								</tr>
							</thead>
							<%
								String mysJDBCDriver = "com.mysql.jdbc.Driver";
								String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
								String mysUserID = "jiajli";
								String mysPassword = "cse305QuickSilver";
								String userID = "" + session.getAttribute("login");
								java.sql.Connection conn = null;
								try {
									Class.forName(mysJDBCDriver).newInstance();
									java.util.Properties sysprops = System.getProperties();
									sysprops.put("user", mysUserID);
									sysprops.put("password", mysPassword);

									//connect to the database
									conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
									System.out
											.println("Connected successfully to database using JConnect");

									java.sql.Statement stmt1 = conn.createStatement();

									java.sql.ResultSet rs = stmt1
											.executeQuery("SELECT DISTINCT Bidon.AuctionID, Item.ItemName, MAX(BidOn.BidAmt), List.ClosingDate FROM Bidon, Auction, Item, List WHERE Bidon.BidderID='"
													+ userID
													+ "' and Auction.AuctionID=Bidon.AuctionID and Auction.ItemID=Item.ItemID and Bidon.AuctionID=List.AuctionID");

									while (rs.next()) {
							%>
							<tr>
								<td style="width: 84px"><span style="font-size: 10pt"><%=rs.getString(1)%></span>
								</td>
								<td style="width: 187px"><span style="font-size: 10pt"><%=rs.getString(2)%></span>
								</td>
								<td style="width: 74px"><span style="font-size: 10pt"><%=rs.getString(3)%></span>
								</td>
								<td><span style="font-size: 10pt"><%=rs.getString(4)%></span>
								</td>
							</tr>
							<%
								}
								} catch (Exception e) {
									e.printStackTrace();
									out.print(e.toString());
								} finally {

									try {
										conn.close();
									} catch (Exception ee) {
									}
									;
								}
							%>
						</table>
						<!-- /.table-responsive -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
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

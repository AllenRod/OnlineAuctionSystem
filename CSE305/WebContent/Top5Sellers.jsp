<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Top 5 Sellers - OAS</title>

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

<!-- Custom Fonts -->
<link
	href="template_admin2/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script language="javascript" type="text/javascript">
	function Button1_onclick() {
		javascript: myForm.submit();
	}
	function Button2_onclick() {
	    window.open("AllCustomers.jsp","_self");
	}
</script>
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
				<a class="navbar-brand" href="CustomerHome.jsp">Online Auction
					System</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">

				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> ${firstName} ${lastName}<i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
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
						<li><a href="CustomerHome.jsp"><i
								class="fa fa-user fa-fw"></i> Customer Homepage</a></li>
						<li><a href="CustomerInformation.jsp"><i
								class="fa fa-edit fa-fw"></i> Personal Information</a></li>
						<li><a href="AllListings.jsp"><i
								class="fa fa-search fa-fw"></i> Browse All Listings</a></li>
						<li><a href="AllCustomers.jsp"><i
								class="fa fa-users fa-fw"></i> Our Sellers/Buyers</a></li>
						<li><a href="PurchaseHistory.jsp"><i
								class="fa fa-usd fa-fw"></i> Purchase History</a></li>
						<li><a href="ListingHistory.jsp"><i
								class="fa fa-bullhorn fa-fw"></i> Listing History</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="input-group">
				<form name="myForm" action="C_OtherCustomer.jsp" method="post" role="form">
					<fieldset>
						<div>
							<label style="font-size: 10pt">Search for a user </label> <input
								id="userSearch" type="text" name="cID"
								placeholder="Enter user ID" />
							<button type="submit" id="userSearchButton"
								onclick="return Button1_onclick()">Search</button>
							<button type="button" id="goBack"
								onclick="return Button2_onclick()">Go Back To All Users</button>
						</div>
					</fieldset>
				</form>
			</div>
			<h2>Top 5 Sellers with Highest Rating</h2>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Customer ID</th>
								<th>Items Sold</th>
								<th>Seller Rating</th>
							</tr>
						</thead>
						<tbody>
							<%
								String mysJDBCDriver = "com.mysql.jdbc.Driver";
								String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
								String mysUserID = "jiajli";
								String mysPassword = "cse305QuickSilver";

								String userID = "" + session.getValue("login");
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
											.executeQuery("SELECT DISTINCT C.CustomerID, C.ItemSold, C.SellerRating FROM Customer C, List L"
													+" WHERE C.CustomerID = L.SellerID ORDER BY C.SellerRating DESC LIMIT 5");
									while (rs.next()) {
							%>
							<tr>
								<form name="myForm" action="C_OtherCustomer.jsp" method="post" role="form">
									<td style="width: 80px">
										<span style="font-size: 10pt">
											<input type="hidden" value="<%=rs.getString(1)%>" name="cID">
											<input type="submit" value="<%=rs.getString(1)%>" onclick="return Button1_onclick()">
										</span>
									</td>
								</form>
								<td style="width: 80px"><span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
								<td style="width: 80px"><span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
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
						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
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

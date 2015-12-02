<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Customer Representative Mailing List - OAS</title>

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
								class="fa fa-home fa-fw"></i> Home</a></li>
						<li><a href="saleRecord.jsp"><i class="fa fa-bars fa-fw"></i>
								Record Sale</a></li>
						<li><a href="E_mailList.jsp"><i
								class="fa fa-envelope fa-fw"></i> Mailing List</a></li>
						<li><a href="#"><i class="fa fa-th-list fa-fw"></i>
								Item Suggestions</a></li>
						<li><a href="#"><i class="fa fa-file-text fa-fw"></i>
								Receipt</a></li>	
						<li><a href="#"><i class="fa fa-users fa-fw"></i>
								Customers<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="CustomerRegistration.htm">New Customer</a></li>
								<li><a href="findCustomer.jsp">Find Customer</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="E_allEmp.jsp"><i class="fa fa-users fa-fw"></i>
								Employee Info</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<h2>Mailing List</h2>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Last Name</th>
								<th>First Name</th>
								<th>Address</th>
								<th>City</th>
								<th>State</th>
								<th>ZipCode</th>
								<th>Email</th>
							</tr>
						</thead>
						<tbody>
							<%
								String mysJDBCDriver = "com.mysql.jdbc.Driver";
								String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
								String mysUserID = "jiajli";
								String mysPassword = "cse305QuickSilver";

								String profId = "" + session.getAttribute("login");
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
											.executeQuery("SELECT P.LastName, P.FirstName, P.Address, P.City, "
													+ "P.State, P.ZipCode, C.Email FROM person P, customer C "
													+ "WHERE P.ID = C.CustomerID ORDER BY LastName;");
									while (rs.next()) {
							%>
							<tr>
								<td ><span style="font-size: 10pt"><%=rs.getString(1)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(4)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(5)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(6)%></span></td>
								<td ><span style="font-size: 10pt"><%=rs.getString(7)%></span></td>

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

<!DOCTYPE html>
<html lang="en">
<%
	String aID = "" + request.getParameter("aID");
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Auction Information - OAS</title>

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
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						Information of Auction
						<%=aID%></h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-4">
					<div class="panel panel-default">
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
										.executeQuery("SELECT A.AuctionID, L.SellerID, A.ItemID, I.ItemName, I.ItemType, I.Description, I.YearManu, A.OpeningBid, A.CurrentBid, A.Status FROM Item I, Auction A, List L WHERE A.AuctionID='"
												+ aID + "' and A.ItemID=I.ItemID");
								if (rs.next()) {
						%>
						<div class="panel-heading">
							<form name="myForm" action="AuctionInformation.jsp" method="post"
								role="form">

								<label>Auction ID: </label> <input type="hidden"
									value="<%=rs.getString(1)%>" name="aID"> <input
									type="submit" value="<%=rs.getString(1)%>"
									onclick="return Button1_onclick()">
							</form>
						</div>
						<div class="panel-heading">
							<form name="myForm" action="C_OtherCustomer.jsp" method="post"
								role="form">
								<label>Seller ID: </label> <input type="hidden"
									value="<%=rs.getString(2)%>" name="cID"> <input
									type="submit" value="<%=rs.getString(2)%>"
									onclick="return Button1_onclick()">
							</form>
						</div>
						<div class="panel-heading">
							<form name="myForm" action="ItemInformation.jsp" method="post"
								role="form">
								<label>Item ID: </label> <input type="hidden"
									value="<%=rs.getString(3)%>" name="aID"> <input
									type="submit" value="<%=rs.getString(3)%>"
									onclick="return Button1_onclick()">
							</form>
						</div>
						<div class="panel-heading">
							<label>Item Name:</label>
							<%=rs.getString(4)%>
						</div>
						<div class="panel-heading">
							<label>Item Type:</label>
							<%=rs.getString(5)%>
						</div>
						<div class="panel-footer">
							<label>Year Manufactured:</label>
							<%=rs.getString(7)%>
						</div>
						<div class="panel-body">
							<p><%=rs.getString(6)%></p>
						</div>
						<div class="panel-footer">
							<label>Opening Bid:</label>
							<%=rs.getString(8)%>
						</div>
						<div class="panel-footer">
							<label>Highest Bid:</label>
							<%=rs.getString(9)%>
						</div>
						<div class="panel-footer">
							<label>Status:</label>
							<%=rs.getString(10)%>
						</div>
					</div>
				</div>
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

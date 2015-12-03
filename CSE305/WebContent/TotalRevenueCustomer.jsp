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
            <h2>Most Total Revenue Generated By Customer</h2>
            <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Customer ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Revenue</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%

        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli"; 
        String mysUserID = "jiajli"; 
        String mysPassword = "cse305QuickSilver";
        
        String profId = ""+session.getValue("login");
            java.sql.Connection conn=null;
            try 
            {
                Class.forName(mysJDBCDriver).newInstance();
                java.util.Properties sysprops=System.getProperties();
                sysprops.put("user",mysUserID);
                sysprops.put("password",mysPassword);
        
                //connect to the database
                        conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
                        System.out.println("Connected successfully to database using JConnect");
            
                        java.sql.Statement stmt1=conn.createStatement();
        				
                        //create a view for CustomerPurchases and CustomerRevenues
                        stmt1.executeUpdate("CREATE VIEW CustomerPurchases(CustomerID,FirstName,ItemID,BidAmt,AuctionID,EmployeeID) AS "
                        		+ "SELECT C.CustomerID,P.FirstName, A.ItemID, B.BidAmt, L.AuctionID, A.EmployeeID "
                        		+ "FROM Person P, Customer C,Bidon B, Auction A, List L "
                        		+ "WHERE A.Status = 'CLOSED' AND B.AuctionID = A.AuctionID AND B.BidderID = C.CustomerID AND C.CustomerID = P.ID");
                        
                    	stmt1.executeUpdate("CREATE VIEW CustomerRevenues(CustomerID, FirstName,LastName,Revenue) AS "
                    			+ "SELECT P.CustomerID,Y.FirstName,Y.LastName,SUM(P.BidAmt) "
                    			+ "FROM CustomerPurchases P, Customer C, Person Y "
                        		+ "WHERE P.CustomerID = Y.ID AND P.CustomerID = C.CustomerID");
                        		
                        java.sql.ResultSet rs = stmt1.executeQuery("SELECT R.CustomerID, R.FirstName,R.LastName,MAX(R.Revenue) "
                        		+ "FROM CustomerRevenues R");
          while(rs.next())
            {
%>
                    <tr>
                      <td style="width: 74px">
                          <span style="font-size: 10pt"><%=rs.getString(1)%></span></td>
                      <td style="width: 74px">
                          <span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
                    <td style="width: 74px">
                            <span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
                        <td style="width: 74px">
                          <span style="font-size: 10pt"><%=rs.getString(4)%></span></td>                             
                    </tr>
<%              
            }
          stmt1.executeUpdate("DROP VIEW CustomerPurchases");
          stmt1.executeUpdate("DROP VIEW CustomerRevenues");
  		stmt1.close();
            } catch(Exception e)
            {
                e.printStackTrace();
                out.print(e.toString());
            }
            finally{
            
                try{conn.close();}catch(Exception ee){};
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
    <script src="template_admin2/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="template_admin2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="template_admin2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="template_admin2/dist/js/sb-admin-2.js"></script>

</body>

</html>

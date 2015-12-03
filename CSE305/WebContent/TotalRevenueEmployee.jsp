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
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
            <h2>Most Total Revenue Generated By Employee</h2>
            <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Employee ID</th>
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
        				
                      //create a view for CustomerSales and Representative Revenues
                        stmt1.executeUpdate("CREATE VIEW CustomerSales(FirstName,ItemName,ItemID,ItemType,EmployeeID,BidAmt,AuctionID) AS "
                        		+ "SELECT P.FirstName, I.ItemName, I.itemID, I.ItemType, A.EmployeeID, B.BidAmt,L.AuctionID "
                        		+ "FROM Person p, Customer C, Item I, Bidon B, Auction A, List L "
                        		+ "WHERE P.ID = C.CustomerID AND C.CustomerID = L.SellerID AND L.AuctionID = A.AuctionID "
                        		+ "AND A.STATUS = 'CLOSED' AND L.AuctionID = B.AuctionID AND I.ItemID = A.ItemID "
                        		+ "AND B.BidAmt >= (SELECT MAX(B1.BidAmt) FROM Bidon B1) "
                        		+ "GROUP BY A.EmployeeID");
                        
                    	stmt1.executeUpdate("CREATE VIEW RepRevenues(EmployeeID, FirstName,LastName,Revenue) AS "
                    			+ "SELECT S.EmployeeID,P.FirstName,P.LastName,SUM(S.BidAmt) "
                    			+ "FROM CustomerSales S, Employee E, Person P "
                        		+ "WHERE S.EmployeeID = E.EmployeeID AND P.ID = E.EmployeeID");
                        		
                        java.sql.ResultSet rs = stmt1.executeQuery("SELECT R.EmployeeID, R.FirstName,R.LastName,MAX(R.Revenue) "
                        		+ "FROM RepRevenues R");
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
          stmt1.executeUpdate("DROP VIEW CustomerSales");
          stmt1.executeUpdate("DROP VIEW RepRevenues");
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

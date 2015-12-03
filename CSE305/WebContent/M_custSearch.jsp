<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int customerID = Integer.parseInt(request
			.getParameter("customerNum"));
	String mysJDBCDriver = "com.mysql.jdbc.Driver";
	String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
	String mysUserID = "jiajli";
	String mysPassword = "cse305QuickSilver";
	/*    	
	 if ((username!=null) &&(userpasswd!=null))
	 {
	 if (username.trim().equals("") || userpasswd.trim().equals(""))
	 {
	 response.sendRedirect("index.htm");
	 }
	 else
	 {
	 */
	// code start here
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
		// Update Person table first
		ResultSet rs = stmt1.executeQuery("SELECT C.CustomerID, P.FirstName, P.LastName,SUM(B.BidAmt) "
				+ "FROM Customer C,Person P, Bidon B, Auction A, List L "
				+ "WHERE A.Status = 'CLOSED' AND A.AuctionID = L.AuctionID AND B.AuctionID = A.AuctionID AND B.BidderID = '" + customerID + "' AND C.CustomerID = '" + customerID +"' AND P.ID = '" + customerID + "'");
		if (!rs.next()) {
			System.out.println("Customer not found");
			session.setAttribute("customerID", "");
			session.setAttribute("returnVal", "Customer Not Found");
			response.sendRedirect("RevenueByCustomer.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Customer found");
			session.setAttribute("returnVal", "");
			session.setAttribute("customerID", rs.getInt(1));
			session.setAttribute("cfirstName", rs.getNString(2));
			session.setAttribute("clastName", rs.getNString(3));
			session.setAttribute("revenueGenerated", rs.getDouble(4));
			stmt1.close();
			response.sendRedirect("RevenueByCustomer.jsp");
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
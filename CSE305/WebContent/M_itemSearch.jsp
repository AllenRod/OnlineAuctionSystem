<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int itemID = Integer.parseInt(request
			.getParameter("itemNum"));
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
		ResultSet rs = stmt1
				.executeQuery("SELECT I.ItemID,I.ItemName, SUM(B.BidAmt) FROM Item I, Auction A, List L, Bidon B WHERE I.ItemID = A.ItemID AND" 
		        		+ " L.AuctionID = A.AuctionID"
		        		+ " AND A.Status = 'CLOSED'"
		        		+ " AND B.AuctionID = L.AuctionID"
		        		+ " AND B.BidAmt >= (Select MAX(B1.BidAmt) From Bidon B1) AND I.ItemID = '" + itemID + "' AND A.ItemID = '" + itemID + "'");
		if (!rs.next()) {
			System.out.println("Item not found");
			session.setAttribute("itemID", "");
			session.setAttribute("returnVal", "Item Not Found");
			response.sendRedirect("RevenueByItem.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Item found");
			session.setAttribute("returnVal", "");
			session.setAttribute("itemID", rs.getInt(1));
			session.setAttribute("itemName", rs.getNString(2));
			session.setAttribute("revenueGenerated", rs.getDouble(3));
			stmt1.close();
			response.sendRedirect("RevenueByItem.jsp");
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
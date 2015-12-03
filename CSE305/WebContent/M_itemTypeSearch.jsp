<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String itemType = request.getParameter("itemType");
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
		
		ResultSet rs = stmt1.executeQuery("SELECT I.ItemType, SUM(B.BidAmt) FROM Item I, Auction A, List L, Bidon B WHERE I.ItemID = A.ItemID AND" 
        		+ " L.AuctionID = A.AuctionID"
        		+ " AND A.Status = 'CLOSED'"
        		+ " AND B.AuctionID = L.AuctionID"
        		+ " AND B.BidAmt >= (Select MAX(B1.BidAmt) From Bidon B1) AND I.ItemType = '" + itemType + "'");
		if (!rs.next()) {
			System.out.println("Item Type not found");
			session.setAttribute("itemType", "");
			session.setAttribute("returnVal", "Item Type Not Found");
			response.sendRedirect("RevenueByItemType.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("ItemType found");
			session.setAttribute("returnVal", "");
			session.setAttribute("itemType", rs.getNString(1));
			session.setAttribute("revenueGenerated", rs.getDouble(2));
			stmt1.close();
			response.sendRedirect("RevenueByItemType.jsp");
			
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
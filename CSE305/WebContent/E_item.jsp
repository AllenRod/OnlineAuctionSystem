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
		ResultSet rs = stmt1
				.executeQuery("SELECT P.FirstName, P.LastName "
						+ "FROM Person P, Customer C WHERE P.ID=C.CustomerID "
						+ "AND C.CustomerID='" + customerID + "'");
		if (!rs.next()) {
			System.out.println("Customer not found");
			session.setAttribute("itemID0", null);
			session.setAttribute("itemID1", null);
			session.setAttribute("itemID2", null);
			session.setAttribute("itemID3", null);
			session.setAttribute("itemID4", null);
			session.setAttribute("returnVal", "Customer Not Found");
			response.sendRedirect("E_itemSugg.jsp");
			stmt1.close();
			return;
		}
		session.setAttribute("returnVal", "");
		session.setAttribute("cName",
				rs.getNString(1) + " " + rs.getNString(2));
		// Create View BuyerHistory
		stmt1.executeUpdate("CREATE VIEW BuyerHistory_E(ItemID, ItemName, ItemType, Num) AS "
				+ "SELECT I.ItemID, I.ItemName, I.ItemType, COUNT(DISTINCT A.AuctionID) AS ItemCount "
				+ "FROM Item I, Auction A, Bidon B WHERE A.ItemID = I.ItemID "
				+ "AND B.BidderID='" + customerID
				+ "' AND B.AuctionID = A.AuctionID AND A.Status='CLOSED' AND "
				+ "B.BidderID = (SELECT BidderID "
				+ "FROM Bidon "
				+ "WHERE BidAmt >= (SELECT MAX(B2.BidAmt) "
				+ "FROM Bidon B2)) "
				+ "GROUP BY I.ItemID, I.ItemName, I.ItemType ORDER BY ItemCount DESC;");
		rs = stmt1.executeQuery("SELECT I.ItemID, I.ItemName, I.ItemType, I.Description "
				+ "FROM Item I, BuyerHistory_E H "
				+ "WHERE I.ItemType = H.ItemType AND I.ItemID <> H.ItemID "
				+ "ORDER BY I.AmtInStock DESC LIMIT 5;");
		int i = 0;
		while (rs.next()) {
			session.setAttribute("itemID" + i, rs.getInt(1));
			session.setAttribute("itemName" + i, rs.getNString(2));
			session.setAttribute("type" + i, rs.getNString(3));
			session.setAttribute("desc" + i, rs.getNString(4));
			i++;
		}
		stmt1.executeUpdate("DROP VIEW BuyerHistory_E");
		stmt1.close();
		response.sendRedirect("E_itemSugg.jsp");
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
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int auctionID = Integer
			.parseInt(request.getParameter("auctionNum"));
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
				.executeQuery("SELECT * FROM Auction WHERE AuctionID='"
						+ auctionID + "'");
		if (!rs.next()) {
			System.out.println("Auction not found");
			session.setAttribute("auctionID", "");
			session.setAttribute("returnVal", "Auction Not Found");
			response.sendRedirect("E_receipt.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Auction found");
			session.setAttribute("returnVal", "");
			stmt1.executeUpdate("CREATE VIEW Receipt(AuctionID, SellerFirstName, SellerLastName, "
					+ "BuyerFirstName, BuyerLastName, BuyerCreditCardNum, ItemName, PaidAmt, BidTime, PaidTime) AS "
					+ "SELECT A.AuctionID, P1.FirstName, P1.LastName, P2.FirstName, P2.LastName, C.CreditCardNum, I.ItemName, B.BidAmt, B.BidTime, L.ClosingDate "
					+ "FROM Person P1, Person P2, Customer C, Item I, Auction A, List L, Bidon B "
					+ "WHERE A.AuctionID='" + auctionID +"' AND L.AuctionID=A.AuctionID AND B.AuctionID=A.AuctionID AND A.ItemID = I.ItemID AND "
					+ "B.BidderID = (SELECT B1.BidderID "
					+ "FROM Bidon B1 "
					+ "WHERE B1.AuctionID = '" + auctionID  
					+ "'AND B1.BidAmt >= (SELECT MAX(B2.BidAmt) "
					+ "FROM Bidon B2 "
					+ "WHERE B2.AuctionID='" + auctionID + "')) "
					+ "AND B.BidAmt >= (SELECT MAX(B1.BidAmt) "
					+ "FROM Bidon B1 WHERE B1.AuctionID='" + auctionID + "') "
					+ "AND P1.ID = L.SellerID AND P2.ID = B.BidderID AND C.CustomerID = B.BidderID;");
		rs = stmt1.executeQuery("SELECT  * FROM Receipt");
			if (rs.next()) {
				session.setAttribute("auctionID", rs.getInt(1));
				session.setAttribute("rsellerName", rs.getNString(2) + " " + rs.getNString(3));
				session.setAttribute("rbuyerName", rs.getNString(4) + " " + rs.getNString(5));
				session.setAttribute("rccn", rs.getLong(6));
				session.setAttribute("itemName", rs.getNString(7));
				session.setAttribute("paidAmt", rs.getDouble(8));
				session.setAttribute("bid", rs.getTimestamp(9));
				session.setAttribute("close", rs.getTimestamp(10));
			} else {
				session.setAttribute("returnVal", "No receipt for this auction");
				session.setAttribute("auctionID", "");
			}
			stmt1.executeUpdate("DROP VIEW Receipt");
			stmt1.close();
			response.sendRedirect("E_receipt.jsp");
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
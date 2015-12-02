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
			response.sendRedirect("saleRecord.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Auction found");
			session.setAttribute("returnVal", "");
			stmt1.executeUpdate("UPDATE Auction SET Auction.Status='CLOSED' WHERE AuctionID='"
					+ auctionID + "'");
			stmt1.executeUpdate("CREATE VIEW Sale(AuctionID, BuyerID, SellerID, PaidAmt, ClosingTime) AS "
					+ "SELECT A.AuctionID, B.BidderID, L.SellerID, B.BidAmt, L.ClosingDate "
					+ "FROM Auction A, Bidon B, List L WHERE A.AuctionID='"
					+ auctionID
					+ "' AND L.AuctionID='"
					+ auctionID
					+ "' AND B.AuctionID='"
					+ auctionID
					+ "' AND B.BidderID=(SELECT B1.BidderID FROM Bidon B1 WHERE B1.AuctionID='"
					+ auctionID
					+ "' AND B1.BidAmt>=(SELECT MAX(B2.BidAmt) FROM Bidon B2 WHERE B2.AuctionID='"
					+ auctionID
					+ "')) AND B.BidAmt >=(SELECT MAX(B1.BidAmt) FROM Bidon B1 WHERE B1.AuctionID='"
					+ auctionID + "')");
			rs = stmt1
					.executeQuery("SELECT S.AuctionID, S.BuyerID, S.SellerID, S.PaidAmt, S.ClosingTime, "
							+ "P.FirstName, P.LastName, A.ItemID, I.ItemName FROM Sale S, Person P, Auction A, Item I "
							+ "WHERE S.BuyerID = P.ID AND S.AuctionID = A.AuctionID AND A.ItemID = I.ItemID");
			if (rs.next()) {
				session.setAttribute("auctionID", rs.getInt(1));
				session.setAttribute("buyerID", rs.getInt(2));
				session.setAttribute("sellerID", rs.getInt(3));
				session.setAttribute("paidAmt", rs.getDouble(4));
				session.setAttribute("close", rs.getTimestamp(5));
				session.setAttribute("buyerName", rs.getNString(6)
						+ " " + rs.getNString(7));
				session.setAttribute("itemID", rs.getInt(8));
				session.setAttribute("itemName", rs.getNString(9));
			} else {
				session.setAttribute("returnVal", "No sales record for this auction");
				session.setAttribute("auctionID", "");
			}
			stmt1.executeUpdate("DROP VIEW Sale");
			stmt1.close();
			response.sendRedirect("saleRecord.jsp");
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
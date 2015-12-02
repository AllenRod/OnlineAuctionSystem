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
		ResultSet rs = stmt1
				.executeQuery("SELECT P.ID, P.FirstName, P.LastName, P.Address, "
						+ "P.City, P.State, P.ZipCode, P.Telephone, C.CreditCardNum, "
						+ "C.BuyerRating, C.SellerRating, C.ItemSold, C.ItemPurchased, C.Email "
						+ "FROM Person P, Customer C WHERE P.ID='"
						+ customerID
						+ "' AND C.CustomerID='"
						+ customerID + "'");
		if (!rs.next()) {
			System.out.println("Customer not found");
			session.setAttribute("customerID", "");
			session.setAttribute("returnVal", "Customer Not Found");
			response.sendRedirect("findCustomer.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Customer found");
			session.setAttribute("returnVal", "");
			session.setAttribute("customerID", rs.getInt(1));
			session.setAttribute("cfirstName", rs.getNString(2));
			session.setAttribute("clastName", rs.getNString(3));
			session.setAttribute("caddress", rs.getNString(4));
			session.setAttribute("ccity", rs.getNString(5));
			session.setAttribute("cstate", rs.getNString(6));
			session.setAttribute("czip", rs.getInt(7));
			session.setAttribute("ctel", rs.getLong(8));
			session.setAttribute("ccn", rs.getLong(9));
			session.setAttribute("buyerRating", rs.getInt(10));
			session.setAttribute("sellerRating", rs.getInt(11));
			session.setAttribute("itemSold", rs.getInt(12));
			session.setAttribute("itemPurchase", rs.getInt(13));
			session.setAttribute("email", rs.getNString(14));
			stmt1.close();
			response.sendRedirect("findCustomer.jsp");
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
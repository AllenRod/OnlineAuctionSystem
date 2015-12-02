<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String id = request.getParameter("id");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zipcode");
	String tel = request.getParameter("telephone");
	String ccn = request.getParameter("ccn");
	String buyerRating = request.getParameter("buyerRating");
	String sellerRating = request.getParameter("sellerRating");
	String sold = request.getParameter("sold");
	String purchase = request.getParameter("purchase");
	String email = request.getParameter("email");
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
		stmt1.executeUpdate("UPDATE Person SET FirstName='" + firstName
				+ "', LastName='" + lastName + "', Address='"
				+ address + "', City='" + city + "', State='"
				+ state + "', ZipCode='" + zip + "', Telephone='"
				+ tel + "' WHERE ID='" + id + "'");
		System.out.println("Person table updated");
		// Update Customer table
		stmt1.executeUpdate("UPDATE Customer SET CreditCardNum='" 
				+ ccn + "', BuyerRating='"
				+ buyerRating + "', SellerRating='"
				+ sellerRating + "', ItemSold='"
				+ sold + "', ItemPurchased='"
				+ purchase + "', Email='"
				+ email + "' WHERE CustomerID=" + id);
		System.out.println("Customer table updated");
		stmt1.close();
		session.setAttribute("returnVal", "");
		session.setAttribute("customerID", id);
		session.setAttribute("cfirstName", firstName);
		session.setAttribute("clastName", lastName);
		session.setAttribute("caddress", address);
		session.setAttribute("ccity", city);
		session.setAttribute("cstate", state);
		session.setAttribute("czip", zip);
		session.setAttribute("ctel", tel);
		session.setAttribute("ccn", ccn);
		session.setAttribute("buyerRating", buyerRating);
		session.setAttribute("sellerRating", sellerRating);
		session.setAttribute("itemSold", sold);
		session.setAttribute("itemPurchase", purchase);
		session.setAttribute("email", email);
		response.sendRedirect("findCustomer.jsp");
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
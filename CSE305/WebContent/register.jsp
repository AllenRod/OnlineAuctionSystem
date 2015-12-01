<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String role = request.getParameter("role");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zipcode");
	String tel = request.getParameter("telephone");
	String password = request.getParameter("password");
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
		// ID of person
		int id = 0;
		// Insert into Person table first
		stmt1.executeUpdate("INSERT INTO Person(FirstName, LastName, Address, City, State, Password) VALUES('"
				+ firstName
				+ "','"
				+ lastName
				+ "','"
				+ address
				+ "','"
				+ city
				+ "','"
				+ state
				+ "','"
				+ password
				+ "')");
		ResultSet rs = stmt1.executeQuery("SELECT `AUTO_INCREMENT`"
				+ " FROM  INFORMATION_SCHEMA.TABLES"
				+ " WHERE TABLE_SCHEMA = 'jiajli'"
				+ " AND TABLE_NAME = 'person';");
		if (rs.next()) {
			id = rs.getInt("AUTO_INCREMENT");
			id--;
		}
		if (!zip.equals("")) {
			stmt1.executeUpdate("UPDATE Person SET ZipCode='" + zip
					+ "' WHERE ID=" + id);
		}
		if (!tel.equals("")) {
			stmt1.executeUpdate("UPDATE Person SET Telephone='" + tel
					+ "' WHERE ID=" + id);
		}
		out.print("Inserted new account with ID " + id + " into Person");
		if (role.equals("customer")) {
			String ccnStr = request.getParameter("ccn");
			String email = request.getParameter("email");
			stmt1.executeUpdate("INSERT INTO Customer(CustomerID, Email) VALUES('"
					+ id + "','" + email + "')");
			if (!ccnStr.equals("")) {
				stmt1.executeUpdate("UPDATE Customer SET CreditCardNum='"
						+ ccnStr + "' WHERE CustomerID=" + id);
			}
			out.print("Inserted new customer with ID " + id);
			stmt1.close();
		} else if (role.equals("employee")) {
			String ssn = request.getParameter("ssn");
			String startDateStr = request.getParameter("startDate");
			String hourlyRate = request.getParameter("hourlyRate");
			String level = request.getParameter("employmentLevel");
			stmt1.executeUpdate("INSERT INTO Employee VALUES('" + id
					+ "','" + ssn + "','" + startDateStr + "','"
					+ hourlyRate + "','" + level + "')");
			out.print("Inserted new employee with ID " + id + " with level " + level);
			stmt1.close();
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
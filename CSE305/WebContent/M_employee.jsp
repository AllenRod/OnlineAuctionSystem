<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int employeeID = Integer.parseInt(request
			.getParameter("employeeNum"));
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
						+ "P.City, P.State, P.ZipCode, P.Telephone, E.SSN, "
						+ "E.StartDate, E.HourlyRate, E.Level "
						+ "FROM Person P, Employee E WHERE P.ID='"
						+ employeeID
						+ "' AND E.employeeID='"
						+ employeeID + "'");
		if (!rs.next()) {
			System.out.println("Employee not found");
			session.setAttribute("employeeID", "");
			session.setAttribute("returnVal", "Employee Not Found");
			response.sendRedirect("M_findEmployee.jsp");
			stmt1.close();
			return;
		} else {
			System.out.println("Employee found");
			session.setAttribute("returnVal", "");
			session.setAttribute("employeeID", rs.getInt(1));
			session.setAttribute("cfirstName", rs.getNString(2));
			session.setAttribute("clastName", rs.getNString(3));
			session.setAttribute("caddress", rs.getNString(4));
			session.setAttribute("ccity", rs.getNString(5));
			session.setAttribute("cstate", rs.getNString(6));
			session.setAttribute("czip", rs.getInt(7));
			session.setAttribute("ctel", rs.getLong(8));
			session.setAttribute("ssn", rs.getLong(9));
			session.setAttribute("startDate", rs.getDate(10));
			session.setAttribute("hourlyRate", rs.getDouble(11));
			session.setAttribute("level", rs.getInt(12));
			stmt1.close();
			response.sendRedirect("M_findEmployee.jsp");
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
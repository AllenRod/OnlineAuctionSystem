
<%
	if ((request.getParameter("action") != null)
			&& (request.getParameter("action").trim().equals("logout"))) {
		session.setAttribute("login", "");
		response.sendRedirect("/");
		return;
	}

	String username = request.getParameter("username");
	String userpasswd = request.getParameter("userpasswd");
	String mysJDBCDriver = "com.mysql.jdbc.Driver";
	String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
	String mysUserID = "jiajli";
	String mysPassword = "cse305QuickSilver";

	session.setAttribute("login", "");
	if ((username != null) && (userpasswd != null)) {
		if (username.trim().equals("") || userpasswd.trim().equals("")) {
			response.sendRedirect("index.htm");
		} else {
			// code start here
			java.sql.Connection conn = null;
			try {
				Class.forName(mysJDBCDriver).newInstance();
				java.util.Properties sysprops = System.getProperties();
				sysprops.put("user", mysUserID);
				sysprops.put("password", mysPassword);

				//connect to the database
				conn = java.sql.DriverManager.getConnection(mysURL,
						sysprops);
				System.out
						.println("Connected successfully to database using JConnect");

				conn.setAutoCommit(false);
				java.sql.Statement stmt1 = conn.createStatement();
				java.sql.ResultSet rs = stmt1
						.executeQuery("SELECT * FROM Person, Customer WHERE ID='"
								+ username
								+ "' AND Password='"
								+ userpasswd
								+ "' AND Person.ID = Customer.CustomerID");
				if (rs.next()) {
					// login success
					session.setAttribute("login", username);
					String firstName = rs.getNString("FirstName");
					String lastName = rs.getNString("LastName");
					session.setAttribute("firstName", firstName);
					session.setAttribute("lastName", lastName);
					session.setAttribute("id", rs.getInt("ID"));
					session.setAttribute("email", rs.getNString("Email"));
					session.setAttribute("address", rs.getNString("Address"));
					session.setAttribute("city", rs.getNString("City"));
					session.setAttribute("state", rs.getNString("State"));
					session.setAttribute("zipcode", rs.getInt("ZipCode"));
					session.setAttribute("ccn", rs.getLong("CreditCardNum"));
					session.setAttribute("buyerRating", rs.getInt("BuyerRating"));
					session.setAttribute("sellerRating", rs.getInt("SellerRating"));
					session.setAttribute("sold", rs.getInt("ItemSold"));
					session.setAttribute("purchased", rs.getInt("ItemPurchased"));
					session.setAttribute("telephone", rs.getLong("Telephone"));
					response.sendRedirect("CustomerHome.jsp");
					System.out.println("Login as customer "
							+ rs.getNString("LastName") + ", "
							+ rs.getNString("FirstName"));

				} else {
					rs = stmt1
							.executeQuery("SELECT * from Person, Employee where ID='"
									+ username
									+ "' AND Password='"
									+ userpasswd
									+ "' AND Person.ID = Employee.EmployeeID");
					if (rs.next()) {
						session.setAttribute("login", username);
						String firstName = rs.getNString("FirstName");
						String lastName = rs.getNString("LastName");
						session.setAttribute("id", rs.getInt("ID"));
						session.setAttribute("firstName", firstName);
						session.setAttribute("lastName", lastName);
						session.setAttribute("ssn", rs.getInt("SSN"));
						session.setAttribute("address", rs.getNString("Address"));
						session.setAttribute("city", rs.getNString("City"));
						session.setAttribute("state", rs.getNString("State"));
						session.setAttribute("zipcode", rs.getInt("ZipCode"));
						session.setAttribute("telephone", rs.getLong("Telephone"));
						session.setAttribute("level", rs.getInt("Level"));
						if (rs.getInt("Level") == 0) {
							response.sendRedirect("EmployeeHome.jsp");
							System.out.println("Login as employee "
									+ firstName + ", "
									+ lastName);
						} else if (rs.getInt("Level") == 1) {
							response.sendRedirect("ManagerHome.jsp");
							System.out.println("Login as manager "
									+ rs.getNString("LastName") + ", "
									+ rs.getNString("FirstName"));
						} else {
							response.sendRedirect("passMistake.jsp");
						}
					} else {
						// username or password mistake
						response.sendRedirect("passMistake.jsp");
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (Exception ee) {
				}
				;

			}
		}
	}
%>

<%
	if((request.getParameter("action")!=null)&&	(request.getParameter("action").trim().equals("logout")))
	{
		session.setAttribute("login","");
		response.sendRedirect("/");
		return;
	}
		String username = request.getParameter("username");
		String userpasswd = request.getParameter("userpasswd");
     	String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
     	String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli"; 
     	String mysUserID = "jiajli"; 
    	String mysPassword = "cse305QuickSilver";
    	
	session.setAttribute("login","");
	if ((username!=null) &&(userpasswd!=null))
	{
		if (username.trim().equals("") || userpasswd.trim().equals(""))
		{
	response.sendRedirect("index.htm");
		}
		else
		{
	// code start here
	java.sql.Connection conn=null;
	try {
		            	Class.forName(mysJDBCDriver).newInstance();
            			java.util.Properties sysprops=System.getProperties();
            			sysprops.put("user",mysUserID);
            			sysprops.put("password",mysPassword);
        
		//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			conn.setAutoCommit(false);
            			java.sql.Statement stmt1=conn.createStatement();
		java.sql.ResultSet rs = stmt1.executeQuery(" select * from User, Person where userID='"+username+"' and password='"+userpasswd+"' and Person.ID = user.PersonID");
		if (rs.next())
		{
			// login success
			session.setAttribute("login",username);
			//response.sendRedirect("StudentInformation.jsp");
			System.out.println("Login" + rs.getNString("LastName") + ", " + rs.getNString("FirstName"));
			
		}
		//else
		//{
		//	rs = stmt1.executeQuery(" select * from Professor where Id='"+username+"' and Pswd='"+userpasswd+"'");
		//	if(rs.next())
		//	{
		//		session.putValue("login", username);
		//		response.sendRedirect("FacultyInformation.jsp");
		//	}
		//}
		else {
				// username or password mistake
				response.sendRedirect("passMistake.jsp");
			}
		
	} catch(Exception e)
	{
		e.printStackTrace();
	}
	finally{
		try{conn.close();}catch(Exception ee){};
	}
		}
	}
%>
package servlet;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * Check if auction status should be set to closed
 * 
 * @author CSE 305 Quick Silver
 */
public class AuctionChecker implements Runnable {

	/**
	 * Constructor for AuctionChecker
	 */
	public AuctionChecker() {
	}

	@Override
	public void run() {
		String mysJDBCDriver = "com.mysql.jdbc.Driver";
		String mysURL = "jdbc:mysql://mysql2.cs.stonybrook.edu:3306/jiajli";
		String mysUserID = "jiajli";
		String mysPassword = "cse305QuickSilver";
	
		System.out.println("Checking for auctions");
		// code start here
		java.sql.Connection conn = null;
		try {
			Class.forName(mysJDBCDriver).newInstance();
			java.util.Properties sysprops = System.getProperties();
			sysprops.put("user", mysUserID);
			sysprops.put("password", mysPassword);
			// connect to the database
			conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
			System.out
					.println("Connected successfully to database using JConnect");
			java.sql.Statement stmt1 = conn.createStatement();
			// Update Person table first
			ResultSet rs = stmt1
					.executeQuery("SELECT A.AuctionID, L.ClosingDate "
							+ "FROM Auction A, List L WHERE A.AuctionID = L.AuctionID AND A.Status = 'OPEN'");
			Calendar c = Calendar.getInstance();
			Date current = c.getTime();
			ArrayList<Integer> auctionClosed = new ArrayList<>();
			while (rs.next()) {
				System.out.println("Auction found");
				int auctionID = rs.getInt(1);
				Timestamp sqlDate = rs.getTimestamp(2);
				c.setTimeInMillis(sqlDate.getTime());
				Date time = c.getTime();
				if (time.before(current)) {
					auctionClosed.add(auctionID);
				}
			}
			for (Integer i : auctionClosed) {
				stmt1.executeUpdate("UPDATE Auction SET Auction.Status='CLOSED' WHERE AuctionID='"
						+ i + "'");
				System.out.println("Update auction " + i + " to CLOSED");
			}
			stmt1.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.toString());
		} finally {
			try {
				conn.close();
			} catch (Exception ee) {
			}
			;
		}
	}
}

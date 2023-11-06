package pass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class connection {

	
	
	  private static String url ="jdbc:mysql://192.168.18.245:3306/jb14101";
	  private static String driverName = "com.mysql.jdbc.Driver"; private static
	  String username = "jb14101"; private static String password = "jb14101";
	 
	 
	 

	
	
	/*
	 * private static String url = "jdbc:mysql://localhost:3306/electrogalaxy";
	 * private static String driverName = "com.mysql.jdbc.Driver"; private static
	 * String username = "electrogalaxy"; private static String password =
	 * "s892ks2922";
	 */
	 
	private static Connection con;

	public static void connect() {
		try {
			Class.forName(driverName);
			try {
				con = DriverManager.getConnection(url, username, password);
			} catch (SQLException ex) {
				// log an exception. fro example:
				System.out.println("Failed to create the database connection.");
			}
		} catch (ClassNotFoundException ex) {
			// log an exception. for example:
			System.out.println("Driver not found.");
		}

	}

	public PreparedStatement getPreparedstatement(String query) throws SQLException {
		connect();
		return con.prepareStatement(query);

	}

	public Statement getStatement() throws SQLException {

		return con.createStatement();

	}

	public void connectionClose() throws SQLException {
		con.close();
	}
}
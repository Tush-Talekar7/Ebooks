package MakeConnection;

import java.sql.*;
import NewUser.*;

public class GetConnection {

	private static Connection con;
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
		
		
		
		//pst.setString();
		
		return con;
	}
}

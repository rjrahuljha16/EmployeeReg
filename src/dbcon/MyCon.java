package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyCon {
	Connection con=null;
	Connection getMycon()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    con=DriverManager.getConnection("jdbc:mysql://localhost/world","root","root");
		}
		catch(Exception e)
		{
			System.out.println("Database connection class catch block");
			e.printStackTrace();
		}
		return con;
	}
}

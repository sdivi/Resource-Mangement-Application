package com.util;





import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	Connection con=null;
	public Connection getConnection()
	{
		//String db_file_name_prefix ="C:\\Users\\759515\\Desktop\\BBworkSpace\\RMG\\database\\db";
		//String db_file_name_prefix ="C:\\Users\\Himesh\\Desktop\\MyeclipseWS\\RMG\\database\\db";
		String db_file_name_prefix ="C:\\database\\MyDB";
	try {
		Class.forName("org.hsqldb.jdbcDriver");
		System.out.println("into try");
		con = DriverManager.getConnection("jdbc:hsqldb:file:"+db_file_name_prefix+";hsqldb.write_delay=false;ifexists=true;", "sa","");
		System.out.println("connection established");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	return con;
	}
	
}

package com.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import com.bean.Authentication;
import com.bean.Employee;
import com.bean.Project;
import com.util.DbConnection;
import com.util.Encryption;

public class EmployeeDAO {
	private Connection con=null;
	DbConnection dbconnection = new DbConnection();
	
	public int  checkEmployee(int empid)
	{
		try
		{
			con=dbconnection.getConnection();
			System.out.println("CONNECTION ESTABLISHED ");
			Statement stmt = con.createStatement();
			String sql="select * from Employee where emp_id = '" + empid + "' ";
			System.out.println(sql);
			
			ResultSet rs=stmt.executeQuery(sql);
			Employee emp = null;
			if(rs.next()){
				return 1;

			}
			
		}

		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return 0;
	}
	public Employee getEmployeeDetails(int empid)
	{
		try
		{
			con=dbconnection.getConnection();
			System.out.println("CONNECTION ESTABLISHED ");
			Statement stmt = con.createStatement();
			String sql="select * from Employee where emp_id = '" + empid + "' ";
			System.out.println(sql);
			
			ResultSet rs=stmt.executeQuery(sql);
			Employee emp = null;
			if(rs.next()){
				emp=new Employee();
				emp.setEmp_id(rs.getInt(1));
				emp.setEmp_name(rs.getString(2));
				emp.setEmail_id(rs.getString(3));
				emp.setDoj(rs.getString(4));
				emp.setTech(rs.getString(5));
				emp.setRole_id(rs.getString(6));
				emp.setDomain_id(rs.getString(7));
				emp.setLast_unallocated(rs.getString(8));
				emp.setStatus(rs.getString(9));
				emp.setP_id(rs.getInt(10));
				emp.setReq_date(rs.getString(11));
				emp.setNo_of_req(rs.getInt(12));
				emp.setLocation_id(rs.getString(13));

			}
			return emp;
		}

		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;

	}

	public Collection<Project> getProjects(int emp_id , String status) {


		try {

			con=dbconnection.getConnection();
			Statement statement = con.createStatement();
			String query2=null;
			if(status.equalsIgnoreCase("pending")||status.equalsIgnoreCase("allocated")){
			if(status.equalsIgnoreCase("pending")){
				query2 = "select * from project where p_id in (select p_id from request where emp_id='"+emp_id+"')";
				System.out.println(query2);}
			else if(status.equalsIgnoreCase("allocated")){
				query2 ="select * from project where p_id in (select p_id from employee where emp_id ='"+emp_id+"')";
			}
			

			ResultSet rs2 = statement.executeQuery(query2);
			
			Project pro = null;
			ArrayList<Project> projects = new ArrayList<>();
			while (rs2.next()) {
				pro = new Project();
				pro.setP_id(rs2.getInt(1));
				pro.setP_name(rs2.getString(2));
				pro.setDomain_id(rs2.getString(3));
				pro.setTech(rs2.getString(4));
				pro.setLocation_id(rs2.getString(5));
				pro.setBranch_id(rs2.getString(6));
				projects.add(pro);

			}
			return projects;
			}
		}// try
		catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;

	}

	public String afterAccept(int p_id,int emp_id,String role_id){

		try
		{


			con=dbconnection.getConnection();
			
			Statement stmt=con.createStatement();

			//message display
			String message = null;

			//updating emp table
			String query0="update employee set status='Allocated',no_of_req=0,p_id='"+ p_id+"' where emp_id='"+emp_id + "' ";
			System.out.println(query0);
			
			ResultSet rs0=stmt.executeQuery(query0);


			//updating request table
			String query1="delete from request where emp_id='"+emp_id +"'";  
			System.out.println("query1");
			
			ResultSet rs1=stmt.executeQuery(query1);

			//updating requirement table


			//3.Take the name of the column in requirement from employee table using emp_id
			String query2 = "select role_id from employee where emp_id='"+emp_id+"'" ;
			System.out.println(query2);
			
			ResultSet rs2 = stmt.executeQuery(query2);
			String role_name=null;
			if(rs2.next()){
				role_name= rs2.getString(1);
			}


			//4.Take the count of the particular role and decrement it 
			String query5="select " +role_name+" from requirement where p_id='"+p_id+"'";
			System.out.println(query5);

			ResultSet rs5 = stmt.executeQuery(query5);

			int count=0;
			if(rs5.next()){
				count= rs5.getInt(1);
				count--;

			}

			//5.Update the requirement table ..
			String query3=" update requirement set " +role_name+"= "+count+" where p_id='"+p_id+"'";
			System.out.println("query3----------->"+query3);
			ResultSet rs3 = stmt.executeQuery(query3);

			message="Congratulations!you have been successfully allocated for this project";
			return message;

		}

		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;

	}

	public String afterReject(int emp_id,int p_id)
	{
		try
		{


			con=dbconnection.getConnection();
			
			Statement stmt=con.createStatement();

			//message display
			String message = null;

			String query1="delete from request where emp_id='"+emp_id +"' and p_id='"+p_id+"' ";  
			
			System.out.println(query1);
			
			ResultSet rs=stmt.executeQuery(query1);
			
			String query2="select * from request where emp_id='"+emp_id +"' ";
			ResultSet rs1=stmt.executeQuery(query2);
//			String count=rs1.getString(1);
//			System.out.println(count);
			System.out.println(query2);
			/*No requests left*/
			if(!rs1.next()){
			
			
				String query3="update employee set status='available' where emp_id='"+emp_id +"'";
				System.out.println(query3);
				stmt.executeUpdate(query3);
			
			}


			message=" Please choose from other choices ";
			return message;

		}

		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return null;

	}
	
	
	static String algorithm = "DESede";
	public int insert(Employee e,Authentication a) throws SQLException 
	{
		Connection con=null;
		try
		{
		 con=dbconnection.getConnection();
		
		 System.out.println("CONNECTION ESTABLISHED ");
		 
		 String query="insert into employee(emp_id,emp_name,email_id,doj,tech,role_id,location_id,domain_id) values(?,?,?,?,?,?,?,?) ";
		 
		 PreparedStatement st = con.prepareStatement(query);
		 
		 
		Encryption enc=new Encryption();
		 
		String epsw=enc.encryptF(a.getPassword());	
		
		st.setInt(1,e.getEmp_id());
		 st.setString(2, e.getEmp_name());
		 st.setString(3, e.getEmail_id());
		 System.out.println(e.getDoj());
		 st.setString(4,e.getDoj());
		 st.setString(5, e.getTech());
		 st.setString(6, e.getRole_id());
		 st.setString(7, e.getLocation_id());
		 st.setString(8,e.getDomain_id());
		 
		 
		 int r=st.executeUpdate();
		 System.out.println("row updated "+r);
		 
		 String query1="insert into login values(?,?,?)";
		 PreparedStatement st1=con.prepareStatement(query1);
		 st1.setInt(1, a.getEmp_id());
		 st1.setString(2, epsw);
		 st1.setString(3, a.getRole());
		 
		 int r1=st1.executeUpdate();
		 
		 System.out.println("row updated "+r1);
		 return r1;
	}
	
	catch(Exception ex){
	   
		ex.printStackTrace();
	}
	finally{
		try {
			con.close();
		} catch (SQLException ex1) {
			// TODO Auto-generated catch block
			ex1.printStackTrace();
		}
	}
			 
	return 0;

}
	
	
}


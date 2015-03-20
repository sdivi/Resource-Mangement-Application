package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

import com.bean.Employee;
import com.bean.LocationPieChart;
import com.bean.Project;
import com.bean.Requirement;
import com.util.DbConnection;

public class RmgDAO {

	DbConnection dbconnection = new DbConnection();

	public Collection<Employee> getEmployees() {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Employee");
			Employee pro = null;
			ArrayList<Employee> employees = new ArrayList<Employee>();
			while (rs.next()) {
				pro = new Employee();
				pro.setEmp_id(rs.getInt(1));
				pro.setEmp_name(rs.getString(2));
				pro.setEmail_id(rs.getString(3));
				pro.setDoj(rs.getString(4));
				pro.setTech(rs.getString(5));
				pro.setRole_id(rs.getString(6));
				pro.setDomain_id(rs.getString(7));
				pro.setLast_unallocated(rs.getString(8));
				pro.setStatus(rs.getString(9));
				pro.setP_id(rs.getInt(10));
				pro.setReq_date(rs.getString(11));
				System.out.println(pro.getReq_date());
				pro.setNo_of_req(rs.getInt(12));
				pro.setLocation_id(rs.getString(13));

				employees.add(pro);
			}
			return employees;
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
	public Collection<Employee> getEmployee(int emp_id) {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Employee where emp_id = '"+emp_id+"'");
			Employee pro = null;
			ArrayList<Employee> employees = new ArrayList<Employee>();
			while (rs.next()) {
				pro = new Employee();
				pro.setEmp_id(rs.getInt(1));
				pro.setEmp_name(rs.getString(2));
				pro.setEmail_id(rs.getString(3));
				pro.setDoj(rs.getString(4));
				pro.setTech(rs.getString(5));
				pro.setRole_id(rs.getString(6));
				pro.setDomain_id(rs.getString(7));
				pro.setLast_unallocated(rs.getString(8));
				pro.setStatus(rs.getString(9));
				pro.setP_id(rs.getInt(10));
				pro.setReq_date(rs.getString(11));
				System.out.println(pro.getReq_date());
				pro.setNo_of_req(rs.getInt(12));
				pro.setLocation_id(rs.getString(13));

				employees.add(pro);
			}
			return employees;
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
	public Collection<Employee> getEmployeesFilter(String location,String status) {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Employee where location_id='"+location+"' and status='"+status+"'");
			Employee pro = null;
			ArrayList<Employee> employees = new ArrayList<Employee>();
			while (rs.next()) {
				pro = new Employee();
				pro.setEmp_id(rs.getInt(1));
				pro.setEmp_name(rs.getString(2));
				pro.setEmail_id(rs.getString(3));
				pro.setDoj(rs.getString(4));
				pro.setTech(rs.getString(5));
				pro.setRole_id(rs.getString(6));
				pro.setDomain_id(rs.getString(7));
				pro.setLast_unallocated(rs.getString(8));
				pro.setStatus(rs.getString(9));
				pro.setP_id(rs.getInt(10));
				pro.setReq_date(rs.getString(11));
				System.out.println(pro.getReq_date());
				pro.setNo_of_req(rs.getInt(12));
				pro.setLocation_id(rs.getString(13));

				employees.add(pro);
			}
			return employees;
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



	public Collection<Project> getProjects() {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			String query = "select * from Project";

			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			Project pro = null;
			ArrayList<Project> projects = new ArrayList<>();
			while (rs.next()) {
				pro = new Project();
				pro.setP_id(rs.getInt(1));
				
				pro.setP_name(rs.getString(2));
				pro.setDomain_id(rs.getString(3));
				pro.setTech(rs.getString(4));
				pro.setLocation_id(rs.getString(5));
				pro.setBranch_id(rs.getString(6));
				
				projects.add(pro);

			}
			return projects;
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
	
public Collection<Project> getProjectDetails(int p_id){
	Connection con = null;
		try
		{
			con = dbconnection.getConnection();
			System.out.println("inside getProjectsDetails");
			System.out.println("CONNECTION ESTABLISHED ");
			Statement stmt = con.createStatement();
			String sql="select * from Project where p_id = '" + p_id + "' ";
			System.out.println(sql);
			
			ResultSet rs=stmt.executeQuery(sql);
			Project prj=null;
			ArrayList<Project> projects = new ArrayList<Project>();
			
			while(rs.next()){
				prj=new Project();
				prj.setP_id(rs.getInt(1));
	        	prj.setP_name(rs.getString(2));
	        	prj.setDomain_id(rs.getString(3));
	        	prj.setTech(rs.getString(4));
	            prj.setLocation_id(rs.getString(5));
	        	prj.setBranch_id(rs.getString(6));
	        	projects.add(prj);
			}
			return projects;
			
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

	public Collection<Requirement> populateGrid() {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Requirement");
			Requirement pro = null;
			ArrayList<Requirement> requirements = new ArrayList<Requirement>();
			while (rs.next()) {
				pro = new Requirement();
				pro.setP_id(rs.getInt(1));
				pro.setRole1(rs.getInt(2));
				pro.setRole2(rs.getInt(3));
				pro.setRole3(rs.getInt(4));
				pro.setRole4(rs.getInt(5));
				pro.setRole5(rs.getInt(6));
				pro.setRole6(rs.getInt(7));
				pro.setRole7(rs.getInt(8));
				pro.setRole8(rs.getInt(9));
				pro.setRole9(rs.getInt(10));
				pro.setRole10(rs.getInt(11));
				requirements.add(pro);
			}
			return requirements;
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

	public Collection<Employee> populateTable(String status1, String status2,String roleid) {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			String query = "select * from Employee where status in (?,?) and role_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, status1);
			ps.setString(2, status2);
			ps.setString(3, roleid);
			ResultSet rs = ps.executeQuery();
			Employee pro = null;
			ArrayList<Employee> employees = new ArrayList<Employee>();
			while (rs.next()) {
				pro = new Employee();
				pro.setEmp_id(rs.getInt(1));
				pro.setEmp_name(rs.getString(2));
				pro.setEmail_id(rs.getString(3));
				pro.setDoj(rs.getString(4));
				pro.setTech(rs.getString(5));
				pro.setRole_id(rs.getString(6));
				pro.setDomain_id(rs.getString(7));
				pro.setLast_unallocated(rs.getString(8));
				pro.setStatus(rs.getString(9));
				pro.setP_id(rs.getInt(10));
				pro.setReq_date(rs.getString(11));
				pro.setNo_of_req(rs.getInt(12));
				pro.setLocation_id(rs.getString(13));
				employees.add(pro);
			}
			return employees;
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

	public String allocate(String[] employee_ids, int p_id, String role_id) {

		String rt = null;
		DbConnection db = new DbConnection();
		Connection connection = db.getConnection();

		try {

			System.out.println("inside allocate method");
			

			// Employee Id loop
			
			for(int i=0;i<employee_ids.length;i++){
				
				// 1. selecting the no_of_requests from employee table for the
				// selected employee_ids
				String query4 = "select no_of_req from employee where emp_id='"
						+ employee_ids[i] + "'";
				System.out.println("query4 ------>" + query4);

				Statement statement4 = connection.createStatement();
				ResultSet rs4 = statement4.executeQuery(query4);

				int no_of_req = 0;
				if (rs4.next()) {
					no_of_req = rs4.getInt(1);
					no_of_req++;
				}

				// 2.Updating the employee table for the selected employee_ids
				String query = "update Employee set status='Pending' , no_of_req='"
						+ no_of_req
						+ "' where emp_id='"
						+ employee_ids[i]
						+ "'";
				System.out.println("query-------> " + query);

				Statement statement1 = connection.createStatement();
				ResultSet rs1 = statement1.executeQuery(query);

				// 6 . In request table , insert the employee's id , project id
				// , request id , request date
				String query6 = "INSERT INTO request VALUES (NEXT VALUE FOR request, '"
						+ employee_ids[i] + "','" + p_id + "'," + null + ")";
				System.out.println("query6----------->" + query6);
				Statement statement6 = connection.createStatement();
				ResultSet rs6 = statement6.executeQuery(query6);
			}

			rt = "success";
		}

		catch (Exception e) {
			e.printStackTrace();
			rt = "failure";
		} finally {

			try {
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return rt;

	}

	public ArrayList<String> stopDuplicateRequests(int hidden_pid,String[] temp) {
		// TODO Auto-generated method stub
		Connection con = null;
		ArrayList<String> dupe_ids = null; 
		try {
			con = dbconnection.getConnection();
		
			for(int i=0;i<temp.length;i++)
			{
			String query = "select * from Request where emp_id=? and p_id=? ";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, temp[i]);
			ps.setInt(2, hidden_pid);
			ResultSet rs = ps.executeQuery();
			dupe_ids = new ArrayList<>();
			
				
				if(rs.next())
				{
					dupe_ids.add(temp[i]);
				}
				
			}
			return dupe_ids;
			
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
	
	public ArrayList<String> getLocations() {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			String query = "select distinct location_id from Employee";

			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			ArrayList<String> locations = new ArrayList<>();
			while (rs.next()) {
				
				locations.add(rs.getString(1));

			}
			return locations;
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
	public Collection<LocationPieChart> populatePieChart() {

		Connection con = null;
		try {
			con = dbconnection.getConnection();
			String query = "select location_id , count(*) from employee group by location_id";

			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			Collection<LocationPieChart> locations = new ArrayList<>();
			LocationPieChart location =null;
			while (rs.next()) {
				location = new LocationPieChart();
				location.setLocation_id(rs.getString(1));
				location.setCount(rs.getInt(2));
				locations.add(location);
				System.out.println(locations);
			}
			
			return locations;
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
}

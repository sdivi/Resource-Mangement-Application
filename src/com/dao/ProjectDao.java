package com.dao;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Project;
import com.bean.ProjectRequirement;
import com.bean.Requirement;
import com.util.DbConnection;

public class ProjectDao {

	private Connection connection;
	DbConnection db=new DbConnection();

	public ProjectDao() {
		connection = db.getConnection();
	}

	public int newProject(Project pj,Requirement req)throws SQLException
	{
		DbConnection dbConn=new DbConnection();
		connection = dbConn.getConnection();
		int i=0,j=0;
		try{	
			String id="call NEXT VALUE FOR project_id";
			String sql2 = "insert into project values(?,?,?,?,?,?,?)";
			String sql3="insert into requirement(p_id,role1,role2,role3,role4,role5,role6,role7,role8,role9,role10,pm_id) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt2 = connection.prepareStatement(id);
			ResultSet rs=pstmt2.executeQuery();
			if(rs.next())
				j=rs.getInt(1);
			System.out.println(j);
			
			PreparedStatement pstmt = connection.prepareStatement(sql2);
			pstmt.setInt(1,j);
			pstmt.setString(2,pj.getP_name());
			pstmt.setString(3,pj.getDomain_id());
			pstmt.setString(4,pj.getTech());
			pstmt.setString(5,pj.getLocation_id());
			pstmt.setString(6,pj.getBranch_id());
			pstmt.setInt(7,pj.getPm_id());
			
			pstmt.executeUpdate();
			
				pstmt = connection.prepareStatement(sql3);
				
				pstmt.setInt(1,j);
				pstmt.setInt(2,req.getRole1());
				pstmt.setInt(3,req.getRole2());
				pstmt.setInt(4,req.getRole3());
				pstmt.setInt(5,req.getRole4());
				pstmt.setInt(6,req.getRole5());
				pstmt.setInt(7,req.getRole6());
				pstmt.setInt(8,req.getRole7());
				pstmt.setInt(9,req.getRole8());
				pstmt.setInt(10,req.getRole9());
				pstmt.setInt(11,req.getRole10());
				pstmt.setInt(12,req.getPm_id());
				
				i=pstmt.executeUpdate();
			
			
			
			
			
			if(i==1)
				System.out.println("Successful");
			
			else
				System.out.println("not Successful");
			
			return j;
	}
	finally{
		try {
			connection.close();
		}catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}
	
	
	public void addProject(ProjectRequirement prj) {
		try {
			
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into project values(?,?,?,?,?,?)");
			// Parameters start with 1
			preparedStatement.setInt(1,prj.getP_id());
			preparedStatement.setString(2,prj.getP_name());
			preparedStatement.setString(3,prj.getDomain_id() );
			preparedStatement.setString(4,prj.getTech());			
			preparedStatement.setString(5,prj.getLocation_id());
			preparedStatement.setString(6,prj.getBranch_id());
			preparedStatement.executeUpdate();
			
			PreparedStatement preparedStatement1 = connection
					.prepareStatement("insert into requirement(p_id,role1,role2,role3,role4,role5) values(?,?,?,?,?,?)");
			preparedStatement1.setInt(1,prj.getP_id());
			preparedStatement1.setInt(2,prj.getRole1());
			preparedStatement1.setInt(3,prj.getRole2());
			preparedStatement1.setInt(4,prj.getRole3());
			preparedStatement1.setInt(5,prj.getRole4());
			preparedStatement1.setInt(6,prj.getRole5());
			preparedStatement1.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteProject(int p_id) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from project where p_id=?");
			// Parameters start with 1
			preparedStatement.setInt(1,p_id);
			preparedStatement.executeUpdate();
			
			PreparedStatement preparedStatement1 = connection
					.prepareStatement("delete from requirement where p_id=?");
			// Parameters start with 1
			preparedStatement1.setInt(1,p_id);
			preparedStatement1.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateProject(ProjectRequirement prj) throws ParseException {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update project set p_name=?,domain_id=?,tech=?,location_id=?,branch_id=?" +
							"where p_id=?");
			// Parameters start with 1			
			preparedStatement.setString(1,prj.getP_name());
			preparedStatement.setString(2,prj.getDomain_id());	
			preparedStatement.setString(3,prj.getTech());
			preparedStatement.setString(4,prj.getLocation_id());
			preparedStatement.setString(5,prj.getBranch_id());
			preparedStatement.setInt(6,prj.getP_id());
			//preparedStatement.executeUpdate();
			
			PreparedStatement preparedStatement1 = connection
					.prepareStatement("update requirement set role1=?,role2=?,role3=?,role4=?,role5=?,role6=?,role7=?,role8=?,role9=?,role10=?" +
							"where p_id=?");
			preparedStatement1.setInt(1,prj.getRole1());
			preparedStatement1.setInt(2,prj.getRole2());
			preparedStatement1.setInt(3,prj.getRole3());
			preparedStatement1.setInt(4,prj.getRole4());
			preparedStatement1.setInt(5,prj.getRole5());
			preparedStatement1.setInt(6,prj.getRole6());
			preparedStatement1.setInt(7,prj.getRole7());
			preparedStatement1.setInt(8,prj.getRole8());
			preparedStatement1.setInt(9,prj.getRole9());
			preparedStatement1.setInt(10,prj.getRole10());
			preparedStatement1.setInt(11,prj.getP_id());
			preparedStatement1.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ProjectRequirement> getAllProjects(int pm_id,int startindex,int pagesize) {
		List<ProjectRequirement> projects = new ArrayList<ProjectRequirement>();
		try {
			
			Statement statement = connection.createStatement();
			
			
			 int range = startindex+pagesize;
			 System.out.println(range);
			
			
			
			if(pm_id==999999)
			{
				ResultSet rs2 = statement.executeQuery("select limit "+ startindex +" "+range+" * from project");
				
				while (rs2.next()) {
					ProjectRequirement prj=new ProjectRequirement();
		        	   prj.setP_id(rs2.getInt(1));
		        	   prj.setP_name(rs2.getString(2));
		        	   prj.setDomain_id(rs2.getString(3));
		        	   prj.setTech(rs2.getString(4));
		        	   prj.setLocation_id(rs2.getString(5));
		        	   prj.setBranch_id(rs2.getString(6));
		        	   
		        	   PreparedStatement statement1 = connection.prepareStatement("select * from requirement where p_id=?");
		        	   statement1.setInt(1, rs2.getInt(1));
		        	   ResultSet rs3 = statement1.executeQuery();
		        	   
		        	   if(rs3.next())
		        	   {
		        	   prj.setRole1(rs3.getInt(2));
		        	   prj.setRole2(rs3.getInt(3));
		        	   prj.setRole3(rs3.getInt(4));
		        	   prj.setRole4(rs3.getInt(5));
		        	   prj.setRole5(rs3.getInt(6));
		        	   prj.setRole6(rs3.getInt(7));
		        	   prj.setRole7(rs3.getInt(8));
		        	   prj.setRole8(rs3.getInt(9));
		        	   prj.setRole9(rs3.getInt(10));
		        	   prj.setRole10(rs3.getInt(11));
		        	   }
		        	   projects.add(prj);
				}
			}
			else
			{
				ResultSet rs = statement.executeQuery("select limit  " + startindex +" "+range+" * from project where pm_id = '" + pm_id + "'");
				System.out.println("in all projects dao");
				
				while (rs.next()) {
					   ProjectRequirement prj=new ProjectRequirement();
					   
		        	   prj.setP_id(rs.getInt(1));
		        	   prj.setP_name(rs.getString(2));
		        	   prj.setDomain_id(rs.getString(3));
		        	   prj.setTech(rs.getString(4));
		        	   prj.setLocation_id(rs.getString(5));
		        	   prj.setBranch_id(rs.getString(6));
		        	   
		        	   PreparedStatement statement1 = connection.prepareStatement("select * from requirement where p_id=?");
		        	   System.out.println("p_id test :"+rs.getInt(1));
		        	   statement1.setInt(1,rs.getInt(1));
		        	   
		        	   ResultSet rs1 = statement1.executeQuery();
		        	   if(rs1.next())
		        	   {
		        	   prj.setRole1(rs1.getInt(2));
		        	   prj.setRole2(rs1.getInt(3));
		        	   prj.setRole3(rs1.getInt(4));
		        	   prj.setRole4(rs1.getInt(5));
		        	   prj.setRole5(rs1.getInt(6));
		        	   prj.setRole6(rs1.getInt(7));
		        	   prj.setRole7(rs1.getInt(8));
		        	   prj.setRole8(rs1.getInt(9));
		        	   prj.setRole9(rs1.getInt(10));
		        	   prj.setRole10(rs1.getInt(11));
		        	   }
		        	   projects.add(prj);
				}
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return projects;
	}
	
	
	
	
	public List<ProjectRequirement> getProjectById(String pname,int pm_id,String location,int startindex,int pagesize)
	{
		int range = startindex+pagesize;
		ResultSet rs=null;
		
		List<ProjectRequirement> lstProject=new ArrayList<ProjectRequirement>();
		System.out.println(location);
		PreparedStatement preparedStatement=null;
		
		
		
		try {
			
			if(pm_id==999999)
			{
			
			if(!pname.equalsIgnoreCase("")&&!location.equalsIgnoreCase("all")){
				System.out.println("both pname and location");
				if(pname.equalsIgnoreCase(""))
					pname="dummy";
				preparedStatement = connection.prepareStatement("select limit  " + startindex +" "+range+" * from Project where p_name like ? and location_id like ?");
				
			}
			else{
				System.out.println("only location");
				if(pname.equalsIgnoreCase(""))
					pname="dummy";
				preparedStatement = connection.prepareStatement("select limit  " + startindex +" "+range+" * from Project where p_name like ? or location_id like ?");
			}
		
			preparedStatement.setString(1,pname + "%");
			preparedStatement.setString(2,location);
			rs = preparedStatement.executeQuery();
			}
			else
			{
			
			if(!pname.equalsIgnoreCase("")&&!location.equalsIgnoreCase("all")){
				System.out.println("both pname and location");
				if(pname.equalsIgnoreCase(""))
					pname="dummy";
				preparedStatement = connection.prepareStatement("select limit  " + startindex +" "+range+" * from Project where pm_id = ? and (p_name like ? and location_id like ?)");
				
			}
			else{
				System.out.println("only location");
				if(pname.equalsIgnoreCase(""))
					pname="dummy";
				preparedStatement = connection.prepareStatement("select limit  " + startindex +" "+range+" * from Project where pm_id = ? and (p_name like ? or location_id like ?)");
			
			}
			preparedStatement.setInt(1, pm_id);
			preparedStatement.setString(2,pname + "%");
			preparedStatement.setString(3,location);
			rs = preparedStatement.executeQuery();
			
			}
			
			
			

			
			while(rs.next()) {
				
				System.out.println(rs.getInt(1));
				ProjectRequirement prj=new ProjectRequirement();
	        	   
				   prj.setP_id(rs.getInt(1));
	        	   prj.setP_name(rs.getString(2));
	        	   prj.setDomain_id(rs.getString(3));
	        	   prj.setTech(rs.getString(4));
	        	   prj.setLocation_id(rs.getString(5));
	        	   prj.setBranch_id(rs.getString(6)); 
	        	   
	        	   PreparedStatement statement = connection.prepareStatement("select * from requirement where p_id=?");
	        	   statement.setInt(1, rs.getInt(1));
	        	   ResultSet rs1 = statement.executeQuery();
	        	   
	        	   if(rs1.next())
	        	   {
	        	   prj.setRole1(rs1.getInt(2));
	        	   prj.setRole2(rs1.getInt(3));
	        	   prj.setRole3(rs1.getInt(4));
	        	   prj.setRole4(rs1.getInt(5));
	        	   prj.setRole5(rs1.getInt(6));
	        	   prj.setRole6(rs1.getInt(7));
	        	   prj.setRole7(rs1.getInt(8));
	        	   prj.setRole8(rs1.getInt(9));
	        	   prj.setRole9(rs1.getInt(10));
	        	   prj.setRole10(rs1.getInt(11));
	        	   }
	        	   lstProject.add(prj);
			}
			
		
			
     		   	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstProject;
		
	}

	public int getProjectCount(int pm_id)
	{
	        int count=0;
	        try 
	        {
	        	Statement stmt = connection.createStatement();
	        	if(pm_id==999999)
	        	{
	        		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM PROJECT");              
	                if (rs.next()) 
	                {
	                	count=rs.getInt(1);
	                	System.out.println(count);

	                }
	        	}
	        	else
	        	{
	        		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM PROJECT WHERE PM_ID ='"+pm_id+"'");              
	                if (rs.next()) 
	                {
	                	count=rs.getInt(1);
	                	System.out.println(count);

	                }
	        	}
	                
	                
	        } 
	        catch (SQLException e) 
	        {
	                System.err.println(e.getMessage());
	        }
	        return count;
	}
	
}

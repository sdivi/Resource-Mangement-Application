package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.Authentication;
import com.util.DbConnection;

public class LoginDAO {

	
public Authentication authenticate(long eid)
{
	Connection con=null;
	Authentication aobj=new Authentication();
	try{
	
	DbConnection db=new DbConnection(); 
	con=db.getConnection();
	String qry="select * from login where emp_id=?";
	PreparedStatement ps=con.prepareStatement(qry);
	ps.setLong(1,eid);
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next()){
		
	aobj.setEmp_id(rs.getInt("emp_id"));
	aobj.setPassword(rs.getString("password"));
	aobj.setRole(rs.getString("role"));
	
	}
	}
	catch(Exception e){
		
	}
	
	return aobj;
}
}

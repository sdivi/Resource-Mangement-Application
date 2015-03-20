package com.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Authentication;
import com.bean.Employee;
import com.dao.EmployeeDAO;
import com.google.gson.Gson;

/**
 * Servlet implementation class EmployeeHandler
 */
public class EmployeeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String check=request.getParameter("Employee");
		String message=null;
		if(check!=null)
		{
		if(request.getParameter("Employee").equalsIgnoreCase("signup"))
		{
			 	PrintWriter out=response.getWriter();
			 	
			 	Employee e=new Employee();
			 	Authentication a=new Authentication();
			 	
			 	java.text.DateFormat df = new java.text.SimpleDateFormat(
						"yyyy-MM-dd");
			 	
				e.setEmp_id(Integer.parseInt(request.getParameter("e_id")));
				e.setEmp_name(request.getParameter("emp_name"));
				e.setEmail_id(request.getParameter("emailid"));
				e.setDoj(request.getParameter("date"));
				e.setTech(request.getParameter("tech"));
				e.setLocation_id(request.getParameter("location"));
				e.setRole_id(request.getParameter("role"));
				e.setDomain_id(request.getParameter("domain"));
				
				a.setPassword(request.getParameter("password"));
				a.setEmp_id(Integer.parseInt(request.getParameter("e_id")));
				a.setRole("employee");
				
				//UserLogBean ulb;
				try {
					
				
				EmployeeDAO emp=new EmployeeDAO();
				
				int i=emp.checkEmployee(Integer.parseInt(request.getParameter("e_id")));
				System.out.println(i+"  this is check");
					
					if(i==1)
					{
						message="Employee is already present cannot be registered again";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
						//RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
						//rd.include(request, response);
						//out.println("<SCRIPT LANGUAGE=javascript>");
						//out.println("alert(\"Employee is already present cannot be registered again.\") ");
						//out.println("</script>");
					}
					else if(i==0)
					{
						emp.insert(e,a);
						message="Users has been added successfully.Please Login";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
					//RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
					//rd.include(request,response);
					//out.println("<SCRIPT LANGUAGE=javascript>");
					//out.println("alert(\"Users has been added successfully. Please Login\") ");
					//out.println("</script>");
					}
					
				}
		      
		        
				
				 catch (Exception ex) {
					// TODO Auto-generated catch block
					ex.printStackTrace();
				}
		}
		
		}
		
		
		else
		{
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		int emp_id = Integer.parseInt(request.getParameter("emp_id"));
		String role_id = request.getParameter("role_id");
		String submit = (String)request.getParameter("go");
		System.out.println("submit"+submit);
		
		EmployeeDAO empdao = new EmployeeDAO();
		
		Map<String, Object> options=null;
		
		if(submit.equalsIgnoreCase("accept")){
			message = empdao.afterAccept(p_id,emp_id,role_id);

		}
		else if(submit.equalsIgnoreCase("reject")){
			message = empdao.afterReject(emp_id,p_id);
		}
		options = new LinkedHashMap<String, Object>();
		options.put("Employe ID", emp_id);
		options.put("Project IDs", p_id);
		options.put("Role IDs",role_id);
		options.put("message", message);
		

	    String json = new Gson().toJson(options);

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}
	}
}

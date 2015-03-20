package com.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import com.dao.*;
import com.bean.*;
/**
 * Servlet implementation class ProjectHandler
 */
public class ProjectHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProjectDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectHandler() {
    	 dao=new ProjectDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("welcome");
		
		
		String message=null;
		if(request.getParameter("action")!=null){
			List<ProjectRequirement> lstProject=new ArrayList<ProjectRequirement>();
			String action=(String)request.getParameter("action");
			String value1=(String)request.getParameter("value");
			
			System.out.println(action);
			Gson gson = new Gson();
			response.setContentType("application/json");
			
			
			if(action.equals("list")){
				try{						
				//Fetch Data from User Table
					HttpSession session=request.getSession(false);
				
					String pname=request.getParameter("pname");
					String location=request.getParameter("locationId");
					
					System.out.println("pname :"+pname);
					System.out.println("location :"+location);
					
					
					//Pagination
					int startindex=Integer.parseInt(request.getParameter("jtStartIndex"));
					int pagesize=Integer.parseInt(request.getParameter("jtPageSize"));
					
					System.out.println("startindex :"+startindex);
					System.out.println("pagesize :"+pagesize);		
					
					
					if(pname.equalsIgnoreCase("") && location.equalsIgnoreCase("all"))
						lstProject=dao.getAllProjects((int)session.getAttribute("employeeid"),startindex,pagesize);	
					else
					{
						System.out.println("in all projects handler");
						
						lstProject=dao.getProjectById(pname,(int)session.getAttribute("employeeid"),location,startindex,pagesize);	
					}
				System.out.println("pm id : "+(int)session.getAttribute("employeeid"));
				//Convert Java Object to Json				
				
				int userCount = dao.getProjectCount((int)session.getAttribute("employeeid"));
				
				JsonElement element = gson.toJsonTree(lstProject, new TypeToken<List<ProjectRequirement>>() {}.getType());
				JsonArray jsonArray = element.getAsJsonArray();
				String listData = jsonArray.toString();				
				//Return Json in the format required by jTable plugin
				listData="{\"Result\":\"OK\",\"Records\":"+listData+",\"TotalRecordCount\":" + userCount +"}";			
				response.getWriter().print(listData);
				}
				catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					response.getWriter().print(error);
					ex.printStackTrace();
				}				
			}
			
			else if(action.equals("create") || action.equals("update")){
				
				ProjectRequirement prj=new ProjectRequirement();
				
				prj.setP_id(Integer.parseInt(request.getParameter("p_id")));
				prj.setP_name((String)request.getParameter("p_name"));
				prj.setDomain_id(request.getParameter("domain_id"));
				prj.setTech((String)request.getParameter("tech"));
				prj.setLocation_id(request.getParameter("location_id"));
				prj.setBranch_id(request.getParameter("branch_id"));
				
				prj.setRole1(Integer.parseInt(request.getParameter("role1")));
				prj.setRole2(Integer.parseInt(request.getParameter("role2")));
				prj.setRole3(Integer.parseInt(request.getParameter("role3")));
				prj.setRole4(Integer.parseInt(request.getParameter("role4")));
				prj.setRole5(Integer.parseInt(request.getParameter("role5")));
				prj.setRole6(Integer.parseInt(request.getParameter("role6")));
				prj.setRole7(Integer.parseInt(request.getParameter("role7")));
				prj.setRole8(Integer.parseInt(request.getParameter("role8")));
				prj.setRole9(Integer.parseInt(request.getParameter("role9")));
				prj.setRole10(Integer.parseInt(request.getParameter("role10")));
				
				
				
				
				try{											
					if(action.equals("create")){//Create new record
						dao.addProject(prj);					
						lstProject.add(prj);
						//Convert Java Object to Json				
						String json=gson.toJson(prj);					
						//Return Json in the format required by jTable plugin
						String listData="{\"Result\":\"OK\",\"Record\":"+json+"}";											
						response.getWriter().print(listData);
					}else if(action.equals("update")){//Update existing record
						dao.updateProject(prj);
						String listData="{\"Result\":\"OK\"}";									
						response.getWriter().print(listData);
					}
				}catch(Exception ex){
						String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getStackTrace().toString()+"}";
						response.getWriter().print(error);
				}
			}else if(action.equals("delete")){//Delete record
				try{
					if(request.getParameter("p_id")!=null){
						String p_id=(String)request.getParameter("p_id");
						dao.deleteProject(Integer.parseInt(p_id));
						String listData="{\"Result\":\"OK\"}";								
						response.getWriter().print(listData);
					}
				}catch(Exception ex){
				String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getStackTrace().toString()+"}";
				response.getWriter().print(error);
			}				
		}else if(action.equalsIgnoreCase("newProject"))
			{
				PrintWriter out=response.getWriter();
				try{
					HttpSession session=request.getSession(false);
					
					int id=0;
					Project pj=new Project();
					Requirement re=new Requirement();
					
					ProjectDao pd=new ProjectDao();
			
					
					pj.setP_name(request.getParameter("p_name"));
					pj.setDomain_id(request.getParameter("domain_id"));
					pj.setTech(request.getParameter("tech"));
					pj.setLocation_id(request.getParameter("location_id"));
					pj.setBranch_id(request.getParameter("branch_id"));
					pj.setPm_id((int)session.getAttribute("employeeid"));
					
					System.out.println("pm id : "+(int)session.getAttribute("employeeid"));
					
					//Requirement values
					
					int value=Integer.parseInt(request.getParameter("x_value"));
					
					System.out.println("x value="+value);
					
					for(int i=1;i<=value;i++)
					{
						 String demo=request.getParameter("role"+i);
						 System.out.println(demo);
						 
						 int count=Integer.parseInt(request.getParameter("rolecount"+i));
						 
						 int val=Integer.parseInt(demo.substring(4));
						 System.out.println("role["+val+"] :"+count);						
						 
						 if(val==1)
							 re.setRole1(count);
						 else if(val==2)
							 re.setRole2(count);
						 else if(val==3)
							 re.setRole3(count);
						 else if(val==4)
							 re.setRole4(count);
						 else if(val==5)
							 re.setRole5(count);
						 else if(val==6)
							 re.setRole6(count);
						 else if(val==7)
							 re.setRole7(count);
						 else if(val==8)
							 re.setRole8(count);
						 else if(val==9)
							 re.setRole9(count);
						 else if(val==10)
							 re.setRole10(count);
						 
					}
					
					System.out.println("Role values");
					System.out.println(re.getRole1());
					System.out.println(re.getRole2());
					System.out.println(re.getRole3());
					System.out.println(re.getRole4());
					System.out.println(re.getRole5());
					System.out.println(re.getRole6());
					System.out.println(re.getRole7());
					System.out.println(re.getRole8());
					System.out.println(re.getRole9());
					System.out.println(re.getRole10());
					
					

					
					re.setPm_id((int)session.getAttribute("employeeid"));
					
					System.out.print("Leaving ProjectHandler ");
					
					id=pd.newProject(pj,re);
					
					request.setAttribute("id", id);
//					
//					out.println("<html><head><script src='/RmgAllocation/themes/js/jquery-1.8.3.min.js'></script><script  src='/RmgAllocation/js/alert.js'></script><link href='/RmgAllocation/css/alert.css' rel='stylesheet' type='text/css'><script>$(document).ready(function(e){alert('Succesfully registered');e.preventDefault();});</script></head></html>");
//					//out.println("<html><head><script>alert('Succesfully registered');</script></head></html>");
//					response.setContentType("text/html");
//					
//					RequestDispatcher rd=request.getRequestDispatcher("/jsp/Homenew.jsp");
//					rd.include(request, response);
					
					message="success";
					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(message);
					
				}
				catch(Exception se){
					se.printStackTrace();
					System.out.println("sorry for the inconvience");
				}
			}
	 }

		
		
	}

}

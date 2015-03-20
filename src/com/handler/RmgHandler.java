package com.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RmgDAO;
import com.google.gson.Gson;

/**
 * Servlet implementation class RmgHandler
 */

public class RmgHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RmgHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("RmgHandler");
		String emp_ids = request.getParameter("emp_ids");System.out.println(emp_ids);
		String emp_names = request.getParameter("emp_names");System.out.println(emp_names);
		String[] temp=emp_ids.split(",");System.out.println(temp);	
		String[] temp1=emp_names.split(",");System.out.println(temp1);
		String hidden_role_id = request.getParameter("roleid");	System.out.println(hidden_role_id);
		int hidden_pid = Integer.parseInt(request.getParameter("pid"));	System.out.println(hidden_pid);
		String rmgdao=null;
		ArrayList<String> dupe_ids = new RmgDAO().stopDuplicateRequests(hidden_pid,temp);
		
		
		if(dupe_ids.size()==0){
			rmgdao = new RmgDAO().allocate(temp, hidden_pid,  hidden_role_id);
			Map<String, Object> options = new LinkedHashMap<String, Object>();
			options.put("Message", "A request has been sent to "+emp_names+"(with IDs "+ emp_ids +")");

			options.put("Project Ids", hidden_pid);
			
			options.put("Role details",hidden_role_id);
			options.put("Status ", " Waiting for approval");
			options.put("Project Owner ", "Sanjay  Jambhale (101467)");
			options.put("Contact Number ", "91-20-67940506");
			options.put("Email ", "sanjay.jambhale@tcs.com");
			
		    String json = new Gson().toJson(options);

		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		}
		else{
			Map<String, Object> options = new LinkedHashMap<String, Object>();
			options.put("Message", "A request has already been sent to ");
//			options.put("emp_ids", dupe_ids);
			options.put("names",emp_names);
			options.put("......", "Please contact .... ");
			options.put("Project Owner ", "Sanjay  Jambhale (101467)");
			options.put("Contact Number ", " 91-20-67940506");
			options.put("Email ", " sanjay.jambhale@tcs.com");
			System.out.println(options);
		    String json = new Gson().toJson(options);
		    System.out.println(json);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		}

		
		
 
	}

}

package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		out.print(request.getParameter("user"));
		
		
	   
		
		response.addHeader("Cache-Control","no-cache");
		HttpSession session=request.getSession(false);
		
		if(request.getParameter("Employee")!=null) {
			System.out.print("Deligating request to EmployeeHandler ");
			RequestDispatcher rd = request.getRequestDispatcher("/EmployeeHandler");
			rd.forward(request,response);
		}
		else if((request.getParameter("Project")!=null))	{
			System.out.print("Deligating request to ProjectHandler ");
			RequestDispatcher rd = request.getRequestDispatcher("/ProjectHandler");
			rd.forward(request,response);
		}
		else if(request.getParameter("Rmg")!=null) {
			System.out.print("Deligating request to  RMGHandler");
			RequestDispatcher rd = request.getRequestDispatcher("/RmgHandler");
			rd.forward(request,response);
		}
		else if(request.getParameter("user")!=null) 	{
			System.out.print("Deligating request to LoginHandler");
			RequestDispatcher rd = request.getRequestDispatcher("/LoginHandler");
			rd.forward(request,response);
		}	
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request,response);
		}
			
	}
		
		
	}


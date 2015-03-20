package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionValidationFilter implements Filter {

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		
		System.out.println("into filter");
		
		HttpServletRequest hreq=(HttpServletRequest)request;
		HttpServletResponse hres=(HttpServletResponse)response;
		
		HttpSession session=hreq.getSession(false);
		
		System.out.println(session);
		PrintWriter out =response.getWriter();
		
		if (session==null){
			response.setContentType("text/html");
			
			out.println("Please login before accessing the services ");
			
			hres.setHeader("refresh", 
					"2;URL="+hreq.getContextPath()+"/Login.jsp");
			
			hres.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			hres.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			hres.setDateHeader("Expires", 0); // Proxies.
			
			return;
		}
		//System.out.println((Integer)session.getAttribute("employeeid"));
		Integer user=(Integer)session.getAttribute("employeeid");
		//String user=user1.toString();
		
		String pwd=(String)session.getAttribute("password");
		
		if (user==null && pwd==null){
			response.setContentType("text/html");
			out.println("Please login before accessing the services");
			hres.setHeader("refresh", 
					"2;URL="+hreq.getContextPath()+"/Login.jsp");
			
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}

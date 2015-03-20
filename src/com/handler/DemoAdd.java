package com.handler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Project;
import com.bean.Requirement;

/**
 * Servlet implementation class DemoAdd
 */
public class DemoAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemoAdd() {
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
		
		Requirement re=new Requirement();
		
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
		
		
		
		
	}

}

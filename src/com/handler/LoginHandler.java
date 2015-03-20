package com.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Authentication;
import com.dao.LoginDAO;
import com.google.gson.Gson;
import com.util.Encryption;

import javax.servlet.http.Cookie;

/**
 * Servlet implementation class LoginHandler
 */
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		if (request.getParameter("user").equals("login")) {
			HttpSession session = request.getSession();
			Authentication aobj = new Authentication();
			LoginDAO ldao = new LoginDAO();
			String message = null;
			Map<String, Object> options = null;

			// PrintWriter out=response.getWriter();

			int empid = Integer.parseInt(request.getParameter("employeeid"));
			String psw = request.getParameter("password");
			System.out.println(psw);
					

			aobj = ldao.authenticate(empid);
			String r = aobj.getRole();

			System.out.println(aobj);
			System.out.println("role" + r);

			Encryption enc = new Encryption();
			System.out.println(aobj.getPassword());

			if (aobj.getPassword() != null) {

				String epsw = enc.decryptF(aobj.getPassword());
				System.out.println(epsw);

				if (psw.equals(epsw)) {
					session.setAttribute("employeeid", empid);
					session.setAttribute("password", psw);
					session.setAttribute("role", r);
					System.out.println(session.getAttribute("employeeid"));
					System.out.println(r);

					if (r.equalsIgnoreCase("pm")) {
					//	RequestDispatcher rd = request
							//	.getRequestDispatcher("/jsp/Homenew.jsp");
						// response.setHeader("Cache-Control","no-store");
						//rd.forward(request, response);
						message="success";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
					} else if (r.equalsIgnoreCase("employee")) {
						System.out.println("hello.....");
						//RequestDispatcher rd = request
								//.getRequestDispatcher("/jsp/Homenew.jsp");
						// response.setHeader("Cache-Control","no-store");
						//rd.forward(request, response);
						message="success";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
					} else if (r.equalsIgnoreCase("rmg")) {
						//RequestDispatcher rd = request
								//.getRequestDispatcher("/jsp/Homenew.jsp");
						// response.setHeader("Cache-Control","no-store");
						//rd.forward(request, response);
						message="success";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
					} else if (r.equalsIgnoreCase("admin")) {
						//RequestDispatcher rd = request
							//	.getRequestDispatcher("/jsp/Homenew.jsp");
						// response.setHeader("Cache-Control","no-store");
						//rd.forward(request, response);
						message="success";
						response.setContentType("text/plain");
						response.setCharacterEncoding("UTF-8");
						response.getWriter().write(message);
					}

				} else {

					message = "Please check your credentials";

					response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(message);
				}

			} else {
				message = "Please check your Credentials";

				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(message);
			}

		}

		else if (request.getParameter("user").equals("logout")) {
			System.out.println("logout");

			HttpSession session = request.getSession(false);

			session.invalidate();

			// System.out.println(session.getAttribute("employeeid"));
			Cookie cs[] = request.getCookies();
			if (cs != null) {
				for (Cookie c : cs) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}

			RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");

			rd.forward(request, response);
			// response.sendRedirect(
			// request.getContextPath()+"/Login.jsp");
		}

	}
}

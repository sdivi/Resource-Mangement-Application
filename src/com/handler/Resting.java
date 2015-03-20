package com.handler;

import java.util.Collection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


import com.bean.Project;
import com.dao.ProjectDao;
import com.dao.RmgDAO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


@Path("/getProjects")
public class Resting {

	  @GET
      @Produces("application/json")
    public Response getProducts() {
		  	System.out.println("in getProjects method");
			RmgDAO rmgdao = new RmgDAO();
			Collection<Project> projects = rmgdao.getProjects();
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(projects, new TypeToken<Collection<Project>>() {}.getType());
			System.out.println(element);
			JsonArray jsonArray = element.getAsJsonArray();
			System.out.println(jsonArray);
//			String result = jsonArray.toString();      result will be a jsonArray (array of json objects) but its format not supported by datatables
			String result = "{\"data\" : " + jsonArray.toString()+"}";   // this format {"data ": [{...},{...}]} is supported by datatables    
			System.out.println(result);
			return Response.status(200).entity(result).build();
			
	  }
	  
	  @Path("/project/{id}")
	  @GET
	  @Produces("application/json")
	   public Response getSelectProject(@PathParam("id") Integer id) {
			  	System.out.println("in getSelectProject method");
				RmgDAO rmgdao = new RmgDAO();
				Collection<Project> Projects = rmgdao.getProjectDetails(id);
				//Collection<Employee> Employees = rmgdao.getEmployees();	
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(Projects, new TypeToken<Collection<Project>>() {}.getType());
				System.out.println(element);
				JsonArray jsonArray = element.getAsJsonArray();
				System.out.println(jsonArray);			
//				String result = jsonArray.toString();      result will be a jsonArray (array of json objects) but its format not supported by datatables
				String result = jsonArray.toString();   // this format {"data ": [{...},{...}]} is supported by datatables    
				System.out.println(result);
				
				return Response.status(200).entity(result).build();
				
		  }
	  
}
	
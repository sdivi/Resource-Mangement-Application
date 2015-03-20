package com.handler;

import java.util.Collection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import com.bean.Employee;
import com.bean.LocationPieChart;
import com.bean.Project;
import com.dao.RmgDAO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@Path("/getEmployees")
public class RestingEmployees {

	 @GET
     @Produces("application/json")
    public Response getEmployees() {
		  	System.out.println("in getEmployees method");
			RmgDAO rmgdao = new RmgDAO();
			Collection<Employee> Employees = rmgdao.getEmployees();	  			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(Employees, new TypeToken<Collection<Employee>>() {}.getType());
			System.out.println(element);
			JsonArray jsonArray = element.getAsJsonArray();
			System.out.println(jsonArray);			
//			String result = jsonArray.toString();     // result will be a jsonArray (array of json objects) but its format not supported by datatables
			String result = "{\"data\" : " + jsonArray.toString()+"}";   // this format {"data ": [{...},{...}]} is supported by datatables    
			System.out.println(result);
			
			return Response.status(200).entity(result).build();
			
	  }

	  
	  @Path("/rolefilter/{roleid}")
	  @GET
     @Produces("application/json")
    public Response getSelectEmployees(@PathParam("roleid") String roleid) {
		  	System.out.println("in getSelectEmployees method");
			RmgDAO rmgdao = new RmgDAO();
			Collection<Employee> Employees = rmgdao.populateTable("Pending", "Available",roleid);	  			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(Employees, new TypeToken<Collection<Employee>>() {}.getType());
			System.out.println(element);
			JsonArray jsonArray = element.getAsJsonArray();
			System.out.println(jsonArray);			
//			String result = jsonArray.toString();      result will be a jsonArray (array of json objects) but its format not supported by datatables
			String result = "{\"data\" : " + jsonArray.toString()+"}";   // this format {"data ": [{...},{...}]} is supported by datatables    
			System.out.println(result);
			
			return Response.status(200).entity(result).build();
			
	  }

	  @Path("/employee/{id}")
	  @GET
	  @Produces("application/json")
	    public Response getEmployee(@PathParam("id") Integer id) {
			  	System.out.println("in getEmployees method");
				RmgDAO rmgdao = new RmgDAO();
				Collection<Employee> Employees = rmgdao.getEmployee(id);	  			
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(Employees, new TypeToken<Collection<Employee>>() {}.getType());
				System.out.println(element);
				JsonArray jsonArray = element.getAsJsonArray();
				System.out.println(jsonArray);			
//				String result = jsonArray.toString();      result will be a jsonArray (array of json objects) but its format not supported by datatables
				String result = jsonArray.toString();   // this format {"data ": [{...},{...}]} is supported by datatables    
				System.out.println(result);
				
				return Response.status(200).entity(result).build();
				
		  }
	 
	  @Path("{location}/{status}")
	  @GET
     @Produces("application/json")
     public Response getEmployeesFilter(@PathParam("location") String location,@PathParam("status") String status) {
		  	System.out.println("in getEmployeeFilter method");
			RmgDAO rmgdao = new RmgDAO();
			Collection<Employee> Employees = rmgdao.getEmployeesFilter(location,status);	  			
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(Employees, new TypeToken<Collection<Employee>>() {}.getType());
			System.out.println(element);
			JsonArray jsonArray = element.getAsJsonArray();
			System.out.println(jsonArray);			
//			String result = jsonArray.toString();      result will be a jsonArray (array of json objects) but its format not supported by datatables
			String result = "{\"data\" : " + jsonArray.toString()+"}";   // this format {"data ": [{...},{...}]} is supported by datatables    
			System.out.println(result);
			
			return Response.status(200).entity(result).build();
			
	  }
		 @Path("/populatePieChart")
		 @GET
	     @Produces("application/json")
	     public Response getEmployeesFilter() {
			  	System.out.println("in populatePieChart method");
				RmgDAO rmgdao = new RmgDAO();
				Collection<LocationPieChart> locationPieChart = rmgdao.populatePieChart();	  			
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(locationPieChart, new TypeToken<Collection<LocationPieChart>>() {}.getType());
				System.out.println(element);
				JsonArray jsonArray = element.getAsJsonArray();
				System.out.println(jsonArray);			
				String result = jsonArray.toString();     // result will be a jsonArray (array of json objects) but its format not supported by datatables    
				System.out.println(result);
				
				return Response.status(200).entity(result).build();
				
		  }



}

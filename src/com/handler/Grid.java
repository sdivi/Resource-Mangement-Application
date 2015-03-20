package com.handler;

import java.util.Collection;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


import com.bean.Requirement;
import com.dao.RmgDAO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@Path("/grid")
public class Grid {

	@GET
	@Produces("application/json")
	public Response populateGrid() {
		System.out.println("in populateGrid method");
		RmgDAO rmgdao = new RmgDAO();
		Collection<Requirement> reqs = rmgdao.populateGrid();
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(reqs, new TypeToken<Collection<Requirement>>() {}.getType());
		System.out.println(element);
		JsonArray jsonArray = element.getAsJsonArray();
		System.out.println(jsonArray);
		
		String result = jsonArray.toString();  
		System.out.println(result);
		System.out.println("out of grid.java");
		return Response.status(200).entity(result).build();

	}
}

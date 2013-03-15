package com.UBC417.A2.Helpers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import static com.google.appengine.api.taskqueue.TaskOptions.Builder.*;

@SuppressWarnings("serial")
public class FreeSeats extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		List<Entity> l = new ArrayList<Entity>();
		
		//get all flights
		Query qFlights = new Query("Flight");
		Iterable<Entity> flights = ds.prepare(qFlights).asIterable();
		for(Entity flight : flights )
		{
			//for each flight, get all seats
			Query qSeats = new Query(flight.getKey().getName()).addFilter("PersonSitting", FilterOperator.NOT_EQUAL, null );
			Iterable<Entity> seats = ds.prepare(qSeats).asIterable();
			for( Entity s : seats )
			{
				//clear person sitting in this seat
				s.setProperty("PersonSitting", null);
				l.add(s);
			}
		}
		
		// put seats back into datastore
		ds.put(l);
		
		//create task to retry reservations from waiting list

		// redirect to freeSeats.jsp
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/FreeSeats.jsp");
		rd.forward(req, resp);
	}
}

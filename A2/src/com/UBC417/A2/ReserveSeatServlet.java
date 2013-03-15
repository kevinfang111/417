package com.UBC417.A2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.UBC417.A2.Data.Seat;
import com.UBC417.A2.Data.SeatReservation;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class ReserveSeatServlet extends HttpServlet {
	

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		// Get parameters
		String Flight = req.getParameter("Flight");		
		String SeatID = req.getParameter("SeatID");
		
		String FirstName = req.getParameter("FirstName");
		String LastName = req.getParameter("LastName");
		
		String forwardTo = "/seatConfirmation.jsp";
		try {
			if (!Seat.ReserveSeat(Flight, SeatID, FirstName, LastName)) {
				// seat not reserved, show error page
				forwardTo = "/reserveSeatError.jsp";
			}
		} catch (EntityNotFoundException e) {
			// seat not found, show error page
			forwardTo = "/reserveSeatError.jsp";
		}

		// redirect to final page
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(forwardTo);
		rd.forward(req, resp);
	}
}

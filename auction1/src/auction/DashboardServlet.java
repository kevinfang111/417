package auction;
import java.io.IOException;

import Data.queryItems;
import Data.user;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")

public class DashboardServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
					throws IOException, ServletException {
		String searchItems = req.getParameter("searchItems");
		req.getSession().setAttribute("query", searchItems);
		req.getRequestDispatcher("queryResults.jsp").forward(req, resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String searchItems = req.getParameter("searchItems");
		req.getSession().setAttribute("query", searchItems);
		req.getRequestDispatcher("queryResults.jsp").forward(req, resp);
	}
}

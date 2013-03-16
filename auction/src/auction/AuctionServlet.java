package auction;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")

public class AuctionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
					throws IOException, ServletException {

		
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
		rd.forward(req, resp);
	}
}

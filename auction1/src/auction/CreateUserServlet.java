package auction;
import java.io.IOException;
import Data.user;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")

public class CreateUserServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
					throws IOException, ServletException {

		/*String username = req.getParameter("username");
		String password = req.getParameter("password");
		String forwardTo = null;
		
		user u = new user();
		String result = u.retreiveUserInfo(username);
		
		
		if (result.equals("none")) {
			forwardTo = "createUser.jsp";
		} else {
			forwardTo = "dashboard.jsp";
		}
		
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(forwardTo);
		rd.forward(req, resp);*/
	}
}

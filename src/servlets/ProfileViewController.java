package servlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
 
public class ProfileViewController extends HttpServlet {
	private static final long serialVersionUID = 145425026613626544L;

@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		   throws IOException, ServletException {
	loadPage(request,response,"profile_view.jsp");
   }

@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void loadPage(HttpServletRequest request, HttpServletResponse response,String pagename)
			throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);
	}
}
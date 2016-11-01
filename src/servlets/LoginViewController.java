package servlets;

import java.io.*;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;

import src.DBManager;
import src.Landlord;
import src.Session;
import src.Tenant;
import src.User;
 
public class LoginViewController extends HttpServlet {
	private static final long serialVersionUID = -7682619775594735721L;

	private static final int NAVIGATION	=0;
	private static final int LOGIN		=1;
	private static final int REGISTER	=2;
	
@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		   throws IOException, ServletException {
		int caller=getCaller(request);

		switch(caller){
			case LOGIN:
				String email=request.getParameter("email");
				String pwd=request.getParameter("password");
				
				if(authenticate(email,pwd)){
					User u=DBManager.getInstance().getUserTable().get(email);
					Session.getInstance().setUser(u);
					loadPage(request,response,"login_good.jsp");
				}
				else
					loadPage(request,response,"login_bad.jsp");
			break;
			case REGISTER:
				String type=request.getParameter("type");
				if(type.equals("Landlord Account"))
					Session.getInstance().setUser(new Landlord());
				else
					Session.getInstance().setUser(new Tenant());
				
				User s=Session.getInstance().getUser();
				s.setAddress(request.getParameter("address"));
				s.setEmail(request.getParameter("email"));
				s.setFirstName(request.getParameter("first_name"));
				s.setLastName(request.getParameter("last_name"));
				s.setPassword(request.getParameter("password"));
				s.setPhoneNumber(request.getParameter("password"));
				
				//check for duplicates TODO
				DBManager.getInstance().getUserTable().put(s.getEmail(),s);
				
				loadPage(request,response,"register_good.jsp");
			break;
			case NAVIGATION:
				String t=request.getParameter("type");
				if(t.equals("login"))
					loadPage(request,response,"login_view.jsp");
				else if(t.equals("register"))
					loadPage(request,response,"register_view.jsp");
				else if(t.equals("logout")){
					//update user information
					Map<String,User> utable=DBManager.getInstance().getUserTable();
					User nu=Session.getInstance().getUser();
					utable.put(nu.getEmail(),nu);
					
					Session.getInstance().setUser(null);
					loadPage(request,response,"logout.jsp");
				}
			break;
			default:
				System.out.println("ERROR!");
		}
		
   }

@Override
	public void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private int getCaller(HttpServletRequest request){
		try{
			return Integer.parseInt(request.getParameter("caller"));
		}catch(Exception exc){
			return -1;
		}
	}
	
	private void loadPage(HttpServletRequest request, HttpServletResponse response,String pagename)
			throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);
	}
	
	private boolean authenticate(String username,String password){
		Map<String,User> userTable=DBManager.getInstance().getUserTable();
		
		try{
			if(password.equals(userTable.get(username).getPassword()))
				return true;
			else 
				return false;
		}catch(Exception exc){
			return false;
		}
	}
}
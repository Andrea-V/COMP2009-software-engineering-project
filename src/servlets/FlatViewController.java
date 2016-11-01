package servlets;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import src.*;

public class FlatViewController extends HttpServlet {
	private static final int FLAT=0;
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws IOException, ServletException {
      // Set the response message's MIME type
      response.setContentType("text/html;charset=UTF-8");
      // Allocate a output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();
      DBManager manager = DBManager.getInstance();
      User u=Session.getInstance().getUser();
      boolean landlord=u instanceof Landlord;
      int caller;
      try{
    	  caller=Integer.parseInt(request.getParameter("caller"));
      }catch(Exception exc){
    	  caller=-1;
      }
      switch(caller){
	      case FLAT:
	    	  String p1=request.getParameter("interested");
	    	  String p2=request.getParameter("account");
	    	  
	    	  if(p2!=null)
	    		  loadPage(request,response,"account_view.jsp");
	    	  
	    	  if(p1!=null){
	    		System.out.println("A");
	    	  	int new_id=Integer.parseInt(request.getParameter("flat_id"));
	    	  	System.out.println("B");
	    	  	((Tenant)u).getInterestingFlats().add(new_id);
	    	  	System.out.println("C");
	    	  	loadPage(request,response,"flatProfileView.jsp");
	    	  //TODO try to understand the null pointer exception after
	    	  //pressing the "I'm interested" button.
	    	  }
	      break;
	      default:
		      // Process search if search query is sent
		      if(request.getParameter("id") != null){
		    	  Flat f = manager.getFlatTable().get(Integer.parseInt(request.getParameter("id")));
		    	  request.setAttribute("flat", f);
		    	  RequestDispatcher rd = request.getRequestDispatcher("flatProfileView.jsp");
		    	  rd.forward(request, response);
		      }
	   }
   }
   
   private void loadPage(HttpServletRequest request, HttpServletResponse response,String pagename)
			throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);
	}
}
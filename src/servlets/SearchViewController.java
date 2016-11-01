package servlets;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import src.Flat;
import src.DBManager;
 
public class SearchViewController extends HttpServlet {
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws IOException, ServletException {
      // Set the response message's MIME type
      response.setContentType("text/html;charset=UTF-8");
      // Allocate a output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();
      
      // Write the response message, in an HTML page
      /*try {
         out.println("<!DOCTYPE html>");
         out.println("<html><head>");
         out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
         out.println("<title>Hello, World</title></head>");
         out.println("<body>");
         out.println("<h1>Hello, world!</h1>");  // says Hello
         // Echo client's request information
         out.println("<p>Request URI: " + request.getRequestURI() + "</p>");
         out.println("<p>Protocol: " + request.getProtocol() + "</p>");
         out.println("<p>PathInfo: " + request.getPathInfo() + "</p>");
         out.println("<p>Remote Address: " + request.getRemoteAddr() + "</p>");
         // Generate a random number upon each request
         out.println("<p>A Random Number: <strong>" + Math.random() + "</strong></p>");
         out.println("</body>");
         out.println("</html>");

      } finally {
         out.close();  // Always close the output writer
      }*/
      
      /**** Dummy values ****/
      
      DBManager manager = DBManager.getInstance();
      HashMap<Integer, Flat> flatList = manager.getFlatTable();
	  
      
      /******* DO WORK ********/
      
      
      // Process search if search query is sent
      if(request.getParameter("address") != null){
    	  
    	  RequestDispatcher rd = request.getRequestDispatcher("searchResultsView.jsp");
    	   	  
    	  request.setAttribute("search_results", flatList);
    	  rd.forward(request, response);
      }
      // Show the full view of search
      else if(request.getParameter("full") != null && request.getParameter("full").equals("true")){
    	  //TODO: create search_full.jsp
    	  RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
    	  rd.forward(request, response);
      }
      // Default to 'home' search view
      else{
    	  RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
    	  rd.forward(request, response);
      }
	
   }
}
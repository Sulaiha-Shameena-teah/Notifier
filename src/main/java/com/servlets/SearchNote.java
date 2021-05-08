package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;




public class SearchNote extends HttpServlet {
	private static final long serialVersionUID = 12345687L;

	public SearchNote() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String notename = request.getParameter("notename");
			String email = request.getParameter("email");
			String username = request.getParameter("name");
			
			
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notedescription","root","");

            Statement st = conn.createStatement();

            
            String sql = "select * from notetable WHERE notename = '"+notename+"' and email = '"+email+"'";
            
            System.out.println(notename);
            st.executeQuery(sql);
            PrintWriter out = response.getWriter(); 
            response.sendRedirect(request.getContextPath() + "/details.jsp?name="+username + "&email="+ email +"&notename="+notename);
      		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

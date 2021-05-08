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




public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 12345687L;

	public EditUser() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String username = request.getParameter("username");
			String phonenumber = request.getParameter("phonenumber");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
		
			
			
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registeruser","root","");

            Statement st = conn.createStatement();

            
            String sql = "UPDATE registertable SET username = '"+username+"',password = '"+password+"',phnumber = '"+phonenumber+"'  WHERE email = '"+email+"'";
            
            st.executeUpdate(sql);
            PrintWriter out = response.getWriter(); 
            response.sendRedirect(request.getContextPath() + "/dashboard.jsp?name="+username + "&email="+ email);
      		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

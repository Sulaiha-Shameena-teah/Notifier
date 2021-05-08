package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;

import com.entities.Note;
import com.entities.Register;
import com.helper.FactoryProvider;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;


public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1234567890L;
       
  
    public UserLogin() {
        super();
       
    }


	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
		
			String email = request.getParameter("email"); 
			String password = request.getParameter("psw");
			
			//System.out.println(email+" "+password);
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registeruser","root","");

            PrintWriter out = response.getWriter(); 
            Statement st = conn.createStatement();
		
            String sql = "SELECT password,username FROM registeruser.registertable  where email='"+ email + "'";
            
            ResultSet resultSet = st.executeQuery(sql);

            resultSet.next();
            String retrievedString = resultSet.getString(1); 
            String username = resultSet.getString(2);
            //System.out.println(retrievedString);
            
            if(retrievedString.equals(password))
            {
            	response.sendRedirect(request.getContextPath() + "/dashboard.jsp?name="+username + "&email="+ email);
            }
            else 
            {
            	response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
           
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}


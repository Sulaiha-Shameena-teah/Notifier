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
import java.sql.Statement;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;


public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1234567890L;
       
  
    public UserRegister() {
        super();
       
    }


	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String username = request.getParameter("uname");
			String mobilenumber = request.getParameter("mobilenumber");
			String email = request.getParameter("email"); 
			String password = request.getParameter("psw");
			
			Register register = new Register(username, mobilenumber, email, password); 
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registeruser","root","");

            Statement st = conn.createStatement();

            String sql = "insert into registeruser.registertable (username,phnumber,email,password) values('"+username+"','"+mobilenumber+"','"+email+"','"+password+"')";

            st.executeUpdate(sql);
            PrintWriter out = response.getWriter(); 
            response.sendRedirect(request.getContextPath() + "/login.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}


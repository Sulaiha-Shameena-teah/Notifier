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




public class Notedesc extends HttpServlet {
	private static final long serialVersionUID = 12345687L;

	public Notedesc() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String name = request.getParameter("note");
			String startdate = request.getParameter("startdate");
			String enddate = request.getParameter("enddate");
			String remainderdate = request.getParameter("remainderdate");
			String status = request.getParameter("status");
			String tag = request.getParameter("tag");
			String description = request.getParameter("description");
			String email = request.getParameter("email");
			String username = request.getParameter("name");
			System.out.println(name+" "+startdate+" "+tag);
			
		
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notedescription","root","");

            Statement st = conn.createStatement();

            String sql = "insert into notetable (notename,startdate,enddate,remainderdate,status,tag,description,email) values('"+name+"','"+startdate+"','"+enddate+"','"+remainderdate+"','"+status+"','"+tag+"','"+description+"','"+email+"')";

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

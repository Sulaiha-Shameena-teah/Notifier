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




public class SaveNote extends HttpServlet {
	private static final long serialVersionUID = 12345687L;

	public SaveNote() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date()); 
			int id = note.getId(); 
			Date date = note.getAddedDate();
			
			Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes","root","");

            Statement st = conn.createStatement();

            String sql = "insert into notestable (id,title,content,addedDate) values('"+id+"','"+title+"','"+content+"','"+date+"')";

            st.executeUpdate(sql);
            PrintWriter out = response.getWriter(); 
            response.sendRedirect(request.getContextPath() + "/display.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

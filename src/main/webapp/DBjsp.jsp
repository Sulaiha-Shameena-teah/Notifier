<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.entities.DBclass"%>
<%@page import="com.entities.NotifierTemplate"%>
<%@page import="com.servlets.DBservlet" %>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "notedescription";
String userId = "root";
String password = "";
int count = 0;

try 
{
Class.forName(driverName);
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ArrayList<DBclass> DBArray = new ArrayList<DBclass>();

	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM notedescription.notetable where email='"+ email + "'" ;
	resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			String notename = resultSet.getString("notename"); 
			String startdate = resultSet.getString("startdate"); 
			String enddate = resultSet.getString("enddate"); 
			String remainderdate = resultSet.getString("remainderdate"); 
			String status = resultSet.getString("status"); 
			String tag = resultSet.getString("tag"); 
			String description = resultSet.getString("description"); 
			String curr_email = resultSet.getString("email");
			DBclass dbins = new DBclass(notename, startdate, enddate, remainderdate, status, tag, description, curr_email);
			DBArray.add(dbins);
		}
	} 
	catch (Exception e) 
		{
			e.printStackTrace();
		}
	
	
	for(DBclass ins : DBArray)
	{
		System.out.println(ins.getNotename());
	}
	
	
	DBservlet dbservleins = new DBservlet(DBArray);
	
	
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = formatter.format(date); 
	System.out.println(strDate);
	
	
	ArrayList<DBclass> generalbox = new ArrayList<DBclass>();
	
	for(DBclass ins : DBArray)
	{
		String remainder = ins.getRemainderdate(); 
		if(remainder.equals(strDate))
		{
			System.out.print("notification");
			String notename = ins.getNotename(); 
			String curr_email = ins.getEmail();
			String remainderdate = ins.getRemainderdate();
			Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notedescription","root","");
            Statement st = conn.createStatement();
            String sql = "DELETE from notetable  WHERE notename = '"+notename+"' and email = '"+curr_email+"'";
            System.out.println(notename+ "deleted");
            st.executeUpdate(sql);
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","");
            Statement st1 = conn1.createStatement();
            String sql1 = "insert into notifiertable (notes,remainderdate,email) values('"+notename+"','"+remainderdate+"','"+curr_email+"')";
            st1.executeUpdate(sql1);    		
		}
		else 
		{	
			 generalbox.add(ins);
		}
	}
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","");
    Statement st2 = conn2.createStatement();
    String sql2 = "DELETE from notifiertable  WHERE remainderdate < '"+strDate+"'";
    st2.executeUpdate(sql2);
    
    
    ArrayList<NotifierTemplate> notificationbox = new ArrayList<NotifierTemplate>();


    Class.forName("com.mysql.jdbc.Driver");
    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/notify","root","");
    Statement st3 = conn3.createStatement();
    String sql3 = "SELECT distinct * FROM notifiertable where email='"+ email + "'";
    ResultSet resultSet3 = st3.executeQuery(sql3);
	while(resultSet3.next()){
		String notes = resultSet3.getString("notes"); 
		String remainderdate = resultSet3.getString("remainderdate"); 
		String curr_email = resultSet3.getString("email");
		NotifierTemplate notins = new NotifierTemplate (notes, curr_email, remainderdate);
		notificationbox.add(notins);
	}
 	
	System.out.println(notificationbox);
	
	int no_of_notifications = notificationbox.size();
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn_user = DriverManager.getConnection("jdbc:mysql://localhost:3306/registeruser","root","");
    Statement st_user = conn_user.createStatement();
    String sql_user = "select * from registertable  WHERE email = '"+email+"'";
    ResultSet resultSet_user =  st_user.executeQuery(sql_user);
    resultSet_user.next();
	String user_password = resultSet_user.getString("password"); 
	String user_phonenumber = resultSet_user.getString("phnumber"); 
	email = resultSet_user.getString("email");
	name = resultSet_user.getString("username"); 	

	
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn_personal = DriverManager.getConnection("jdbc:mysql://localhost:3306/notedescription","root","");
    Statement st_personal = conn_personal.createStatement();
    String sql_personal = "select count(*) from notetable  WHERE email = '"+email+"' and tag = 'Personal'" ;
    ResultSet resultSet_personal =  st_personal.executeQuery(sql_personal);
    resultSet_personal.next();
	String personal_count = resultSet_personal.getString(1); 
	System.out.println("personal count : "+personal_count);
	
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn_work = DriverManager.getConnection("jdbc:mysql://localhost:3306/notedescription","root","");
    Statement st_work = conn_work.createStatement();
    String sql_work = "select count(*) from notetable  WHERE email = '"+email+"' and tag = 'Work'" ;
    ResultSet resultSet_work =  st_work.executeQuery(sql_work);
    resultSet_work.next();
	String work_count = resultSet_work.getString(1); 
	System.out.println("work count : "+work_count);
%>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	 


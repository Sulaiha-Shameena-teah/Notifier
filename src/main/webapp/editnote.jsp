<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>  
     <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <title>Document</title>
</head>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% 
String email=request.getParameter("email"); 
String notename = request.getParameter("notename"); 
String name = request.getParameter("name");

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "notedescription";
String userId = "root";
String password = "";

String startdate = "";
String enddate = "";
String remainderdate = "";
String status = ""; 
String tag = "";
String description = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM notedescription.notetable where email='"+ email + "' and notename = '"+ notename +"'" ;
resultSet = statement.executeQuery(sql);

while(resultSet.next()){ 
	 startdate = resultSet.getString("startdate"); 
	 enddate = resultSet.getString("enddate"); 
	 remainderdate = resultSet.getString("remainderdate"); 
	 status = resultSet.getString("status"); 
	 tag = resultSet.getString("tag"); 
	 description = resultSet.getString("description"); 
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<body>
    <h2>Note</h2>
    <form action="EditNote" method="post">
	    <table class="table table-striped">
	    	<input type="hidden" class="form-control" name="email" value="<%=email%>">
	    	<input type="hidden" class="form-control" name="name" value="<%=name%>">
	        <tr>
	            <td>Name</td>
	            <td><input type="text" class="form-control" name="notename" value="<%=notename%>"></td>
	        </tr>
	        <tr>
	            <td>StartDate</td>
	            <td><input type="text" class="form-control" name="startdate" value="<%=startdate%>"></td>
	        </tr>
	        <tr>
	            <td>EndDate</td>
	            <td><input type="text" class="form-control" name="enddate" value="<%=enddate%>"></td>
	        </tr>
	        <tr>
	            <td>RemainderDate</td>
	            <td><input type="text" class="form-control" name="remainderdate" value="<%=remainderdate%>"></td>
	        </tr>
	        <tr>
	            <td>Status</td>
	            <td>
	            	<select name="status" class="form-control" id="notebookname">
						  <option value="Started">Started</option>
						  <option value="Inprogress">Inprogress</option>
						  <option value="Finished">Finished</option>
					 </select>
	            </td>
	        </tr>
	        <tr>
	            <td>Tag</td>
	            <td>
	            	 <select name="tag" class="form-control" id="notebookname">
						  <option value="Personal">Personal</option>
						  <option value="Work">Work</option>
					 </select>
	            	
	            </td>
	        </tr>
	        <tr>
	            <td>Description</td>
	            <td><input type="text" class="form-control" name="description" value="<%=description%>"></td>
	        </tr>
	    </table>
	    
		<br>
	 	<button class="btn btn-primary text-center" type="submit">Submit</button>  
	 </form>

   
    
</body>


</script>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
    	<%@include file="navbar.jsp" %>
    
    Add Notes 
    
    <form action="SaveNote" method="post">
	  <div class="form-group">
	    <label for="title">note title</label>
	    <input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here">
	  </div>
	  <div class="form-group">
	    <label for="content">note content</label>
	    <textarea required name="content" id="content" placeholder="enter your content" class="form-control" ></textarea>
	   
	  </div>
	  <br>
	  
	  <button type="submit" class="btn btn-primary">Add</button>
	</form>
	
</div>	
	

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
    <style>
        *
        {
            padding: 0;
            margin: 0;
        }

    li
    {
        list-style: none;
    } 
    .badge{
        position: relative;
        left: -30%;
        top: -10px;
      }   

      .notification
      {
          position: absolute;
          right: 100px;
      }
    </style>
    
    
       
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
String email = request.getParameter("email");
String name = request.getParameter("name");
%>
<%@include file="DBjsp.jsp" %>

    <nav class="navbar navbar-dark bg-dark p-3">    
            <div class="container-fluid d-flex bd-highlight">
                <div class="me-auto p-2 bd-highlight">
                    <i class="fa fa-bars text-light" onclick="display()"></i>
                </div>
                <div class="p-2 bd-highlight text-light">
                	<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#savenotebook">
                		ADD NOTES
                	</button>
                </div>
                <div class="p-2 bd-highlight">          
                    <i class="fa fa-bell text-light" onclick="shownotification()"></i>
                    <span class="rounded bg-danger p-1 badge"><%=no_of_notifications%></span>
                </div>
                <div class="p-2 bd-highlight text-light">
                	<button class="btn btn-dark" onclick="window.location='login.jsp'" >
                		<i class="fa fa-sign-out"></i> Logout
                	</button>
                    
                </div>
            </div>
    </nav>
    
    
    
   
	
    <!--notifier check-->
    
    <div id="notifier" class="notification container bg-light rounded border border-2 overflow-auto" style="height: 400px; width: 300px; display:none;">
        <h3>Remainder</h3>
        <hr>
        <% 
        for(NotifierTemplate ins: notificationbox)
			{ %>
			<%
			String notename = ins.getNotes();
			String remainderdate = ins.getRemainderdate();
			%>
			
        <div class="card text-center my-2">
            <span class="text-primary"><%=notename%></span>
                  <%=remainderdate%>
        </div>
       <%  } %>
         
     
    </div>

    <div class="container-fluid row p-0 m-0">
        <div class=" container-fluid col-md-2  bg-dark text-light" id="menu" style="height: 90vh;">
            <div class="d-flex justify-content-end">
                <i class="fa fa-times" onclick="display()"></i>
            </div>
            <li>
                <%=request.getParameter("name")%>
            </li>
            <li>
                <a href="notebook.jsp?personalcount=<%=personal_count%>&workcount=<%=work_count%>">Notebook</a> 
            </li>
            <li>
                <a href="dashboard.jsp?email=<%=email%>&name=<%=name%>">Notes</a>   
            </li>
            <li>
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#edituser">
                    Edit User
                </button>  
            </li>
        </div>

        <div class="container-fluid col-md-10 bg-light" style="height: 90vh;">
            <div class="conatiner d-flex justify-content-end p-2">
            
                <form class="d-flex col-md-4" action="SearchNote" method="post">
                	<input type="text" value="<%=request.getParameter("email")%>" name="email" style="display:none;">
                     <input type="text" value="<%=request.getParameter("name")%>" name="name" style="display:none;">
                    <input class="form-control" type="text" name="notename" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                  </form>
            </div>

            <h1>Notes</h1>

			<%
			String rem_copy = "";
			for(DBclass ins: generalbox)
			{ %>
            <div class="container row p-2 m-2 rounded border" style="background-color: white;">
            <%
	            String notename = ins.getNotename();
	            String startdate = ins.getStartdate();
				String enddate = ins.getEnddate();
				String remainderdate = ins.getRemainderdate();
				String status = ins.getStatus();
				String tag= ins.getTag();
				String description= ins.getDescription();
			    String rem = remainderdate;
			    rem_copy = remainderdate;
			    
			 %>
			 
			 
                <div class="col-md-2">
                    <%=notename%>
                    <br>
                    <br>
                    <a href="details.jsp?notename=<%=notename%>&email=<%=email%>&name=<%=name%>">
                     <i class="fa fa-plus text-primary"></i>
                    </a>
                     
                </div>
                <div class="col-md-8">
                    started on : <%=startdate%> 
                    <button class="btn <%=status%>"><%=status%></button>
                </div>
                <div class="col-md-2 text-primary">
                	<a href="editnote.jsp?notename=<%=notename%>&email=<%=email%>&name=<%=name%>">
                		<i class="fa fa-edit"></i> Edit 
                	</a>
                	
                    &nbsp;
                    <a href="deletenote.jsp?notename=<%=notename%>&email=<%=email%>&name=<%=name%>">
                    		<i class="fa fa-times"></i>Delete
                    </a>		
                    	
                    
                </div>
            </div>
            
               
            <% 
			}
			%>

        </div>
    </div>

	
    <div class="modal fade" id="savenotebook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">ADD NOTE</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="Notedesc" method="post">
                    <label for="notebookname" class="form-label">Name</label>
                    <input type="text" class="form-control" id="notebookname" name="note">
                    <label for="notebookname" class="form-label">StartDate</label>
                    <input type="date" class="form-control" id="notebookname" name="startdate">
                    <label for="notebookname" class="form-label">EndDate</label>
                    <input type="date" class="form-control" id="notebookname" name="enddate">
                    <label for="notebookname" class="form-label">RemainderDate</label>
                    <input type="date" class="form-control" id="notebookname" name="remainderdate">
                    <label for="notebookname" class="form-label">Status</label>
                    
                     <select name="status" class="form-control" id="notebookname">
						  <option value="Started">Started</option>
						  <option value="Inprogress">Inprogress</option>
						  <option value="Finished">Finished</option>
					 </select>
                    
                    <label for="notebookname" class="form-label">Tag</label>
                    
                    <select name="tag" class="form-control" id="notebookname">
						  <option value="Personal">Personal</option>
						  <option value="Work">Work</option>
					 </select>
					 
                    <label for="notebookname" class="form-label">Description</label>
                    <input type="text" class="form-control" id="notebookname" name="description">
                    <input type="text" value="<%=request.getParameter("email")%>" name="email" style="display:none;">
                     <input type="text" value="<%=request.getParameter("name")%>" name="name" style="display:none;">
                     
                    
                    <button type="submit" class="btn btn-success">Submit</button>
                </form>
            </div>
        </div>
        </div>
    </div>
    
     
            
            
    

    <!-- Modal -->
    <div class="modal fade" id="edituser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">EDIT USER</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="EditUser" method="post">
                    <label for="username" class="form-label">User Name</label>
                    <input type="text" class="form-control" id="username" value="<%=name%>" name="username">
                    <label for="phonenumber" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="<%=user_phonenumber%>">
                    <input type="hidden" class="form-control" id="email" value="<%=email%>" name="email">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" class="form-control" id="password" name="password" value="<%=user_password%>">
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
            
            	
        </div>
        </div>
    </div>
</body>


<script>
    function display()
    {
        menu_check = document.getElementById("menu").style.display;
        if(menu_check == "none")
        {
            document.getElementById("menu").style.display = "block";
        }
        else 
        {
            document.getElementById("menu").style.display = "none";
        }
    }

    function shownotification()
    {
        notifier_check = document.getElementById("notifier").style.display;
        if(notifier_check == "none")
        {
            document.getElementById("notifier").style.display = "block";
        }
        else 
        {
            document.getElementById("notifier").style.display = "none";
        }
    }
    
    $(".Started").addClass("btn-primary");   
    $(".Started").removeClass("btn-warning");
    $(".Started").removeClass("btn-success");
    
    
    $(".Inprogress").removeClass("btn-primary");   
    $(".Inprogress").addClass("btn-warning");
    $(".Inprogress").removeClass("btn-success");
    
    $(".Finished").removeClass("btn-primary");   
    $(".Finished").removeClass("btn-warning");
    $(".Finished").addClass("btn-success");
    
</script>
</html>

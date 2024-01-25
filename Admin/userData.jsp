<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qt.practice.models.UserRegModel"%>
<%@page import="com.qt.practice.beans.RegisterUser"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="asset/style.css">

        <title>Success Page</title>
        
       
    </head>
    
    <%
        UserRegModel usermodel = new UserRegModel();
        ArrayList<RegisterUser> Users = usermodel.select();
    %>
    <body>
        <div class="header text-center pt-3">
            <a href="index.jsp"><h3>Admin Dashboard</h3></a>
        </div>
        <div class="container">
            <div class="card sidebar">
                <ul class="nav-bar">
                    <li class="nav-link"><a href="index.jsp">Dashboard</a></li>                    
                    <li class="nav-link"><a href="userData.jsp">All Users</a></li>
                    <li class="nav-link"><a href="addUser.jsp">Add New User</a></li>
                  </ul>
            </div>      
        <div class="container container1">
            <h3 class="text-center heading">All Users</h3>
            <br>
               <div class="addUser">
                <a href="addUser.jsp" style="color: inherit; text-decoration: none;">
                  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="35" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16" color="#198754">
                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                  <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                  </svg>
                </a><h5>Add User</h5>
           </div>
                
            
            <div class="row">

            <div class="col-sm-1"></div>
            <div class="col-sm-8 text-center">
            <p>${param.msg}</p>
                <table class="table table-hover shadow">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Mobile Number</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (Users.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="8">No Data Found</td>
                        </tr>
                        <%
                        } else {
                            for (RegisterUser us : Users) {
                        %>
                        <tr> 
                            <td><%= us.getId()%></td>
                            <td><%= us.getFirst_name()%></td>
                            <td><%= us.getLast_name()%></td>
                            <td><%= us.getMobile_number()%></td>
                            <td><%= us.getEmail()%></td>
                            <td> <a href="updateData.jsp?id=<%= us.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" width="26" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg></a> 
                                    <span class="p-1" >
                                        <a href="UserRegController?action=delete&id=<%= us.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash3 btn-delete" viewBox="0 0 16 16">
                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
                                        </svg></a>
                                    </span>
                                 
                            </td>

                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table> 

            </div>
            <div class="col-sm-1"></div>
            
        </div>
            
        </div>
    </body>
</html>

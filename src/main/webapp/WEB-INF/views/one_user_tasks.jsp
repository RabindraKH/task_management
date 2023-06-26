<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="top_menu.jsp" %>
<%@ page import ="java.util.List" import="java.util.ArrayList" import="com.task_management.entity.UserTask"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
   .container {
  display: grid;
  place-items: center;
 
}
label,input{
 
  margin-bottom: 10px;
  margin-right: 10px;
  padding: 5px;
}
table{
border: 0px solid black;
position: absolute;
  padding: 20px;
  top: 120px;
  left: 400px;
  margin-bottom: 20px;
  margin-top: 20px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
}

th, td  {
      padding: 8px;
      text-align: center;
       vertical-align: middle;
    }

  </style>
</head>
<body>

<div class="container">
<h4>Your Tasks</h4>
<table border="3">
       <tr>
       <th>Task Title</th>
       <th>Description</th>
       <th>Due Date</th>
       <th>Task Status</th>
       <th>Update</th>
       <th>Delete</th>
       </tr>     
<% List<UserTask> list= (List<UserTask>)request.getAttribute("listOfTask");
for(UserTask task:list){
	%> 
       <tr>
       <td><%=task.getTitle() %></td>
       <td><%=task.getDescription()%></td>
       <td><%=task.getDueDate()%></td>
       <td><%=task.getTaskStatus()%></td>
       <td><a href="update?id=<%= task.getId()%>">Update the Task</a></td>
       <td><a href="delete?id=<%= task.getId()%>">Delete the Task</a></td>       
       </tr><%}%>
</table>
${message1}
</div>
</body>
</html>
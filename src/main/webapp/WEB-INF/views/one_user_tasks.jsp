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
    html, body {
      height: 60%;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align:center;
    }

    .container {
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    td {
      vertical-align: middle;
    }

    th {
      vertical-align: middle;
      text-align: center;
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
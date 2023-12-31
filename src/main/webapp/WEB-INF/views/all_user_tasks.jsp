<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="top_menu.jsp" %>    
<%@ page import ="java.util.List" import="java.util.ArrayList" import="com.task_management.entity.UserTask" import="java.util.TreeSet"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    .container, {
  display: grid;
  place-items: right;
 
}
.search-form {
position: absolute;
top: 80px;
left: 950px;

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
<%
TreeSet<String> dueDate= (TreeSet<String>)request.getAttribute("distinctDueDate");
TreeSet<String> taskStatus= (TreeSet<String>)request.getAttribute("distinctStatus");
String tempDate;
%>

<table border="3">

       <tr>
       <th>User Name</th>
       <th>Task Title</th>
       <th>Description</th>
       
       <th>Due Date
       <form action="dueDateTasks" method="post">
       <select name="dueDate">
       <% if(dueDate!=null){
       
       for(String date:dueDate) {%>
       <option><%=date%></option><% }}%>
       </select>
       <input type="submit" value="Find">
       </form>
	   </th>
	   
       <th>Task Status
       <form action="tasksBasedOnStatus" method="post">
       <select name="taskStatus">
       <% if(taskStatus!=null){
       
       for(String status:taskStatus) {%>
       <option><%=status%></option><% }}%>
       </select>
       <input type="submit" value="Find">
       </form>
       </th>
       
       </tr>
<% List<UserTask> list= (List<UserTask>)request.getAttribute("allTasks");
List<UserTask> searchTask=(List<UserTask>)request.getAttribute("searchedTask");

if(list!=null){
for(UserTask task:list){
	%> 
       <tr>
       <td><%=task.getUserName() %></td>
       <td><%=task.getTitle() %></td>
       <td><%=task.getDescription()%></td>
       <td><%=task.getDueDate()%></td>
       <td><%=task.getTaskStatus()%></td>
       </tr>
<%}}%>
<%
if(searchTask!=null){
for(UserTask task:searchTask){
	%> 
       <tr>
       <td><%=task.getUserName() %></td>
       <td><%=task.getTitle() %></td>
       <td><%=task.getDescription()%></td>
       <td><%=task.getDueDate()%></td>
       <td><%=task.getTaskStatus()%></td>
       </tr>
<%}}%>


</table>
</div>
<div class="search-form">
<form action="filterSearch" method="post">
<input type="text" name="search" placeholder="Enter username/title/desription to search"/>
<input type="submit" value="Search"/>
</form>
</div>
</body>
</html>
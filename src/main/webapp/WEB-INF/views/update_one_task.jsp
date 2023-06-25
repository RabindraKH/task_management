<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="top_menu.jsp" %>    
<%@ page  import="com.task_management.entity.UserTask" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.container {
      border: 2px solid #333; 
      padding: 20px; 
      width: 600px; 
      margin: 0 auto; 
    }
    html, body {
      height: 60%;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 0 auto;
    }

    th, td {
      padding: 8px;
      text-align: center;
      border-bottom: 1px solid #ddd;
      box-sizing: border-box;
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
<h2>Update here</h2>

<% UserTask oneTask=(UserTask)request.getAttribute("oneTask");%>
<form action="updateOneTask" method="post">
<pre>
<input type="hidden" name="id" value="<%=oneTask.getId()%>"/><br>
Title:<input type="text" name="title"  value="<%=oneTask.getTitle()%>" required/><br>
Description : <textarea name="description" required><%=oneTask.getDescription()%></textarea><br>
Date:<input type="date" name="dueDate" value="<%=oneTask.getDueDate()%>"required/><br>
Select if Task completed<input type="radio" name="taskStatus"/>
<input type="submit" value="Update">
</pre>
</form>
${message1}
</div>
</body>
</html>
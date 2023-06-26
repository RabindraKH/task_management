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
  display: grid;
  place-items: center;
 
}
label,input{
 
  margin-bottom: 10px;
  margin-right: 10px;
  padding: 5px;
}
h1{
position: absolute;
top: 50px;
left: 640px;
}

table{
border: 0px solid black;
position: absolute;
  padding: 20px;
  top: 120px;
  left: 550px;
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
<h1>Update here</h1>

<% UserTask oneTask=(UserTask)request.getAttribute("oneTask");%>
<form action="updateOneTask" method="post">
<table>
<input type="hidden" name="id" value="<%=oneTask.getId()%>"/>
<tr><td>
<label>Title:</label>
<input type="text" name="title"  value="<%=oneTask.getTitle()%>" required/>
</td></tr>
<tr><td>
<label>Description :</label> 
<textarea name="description" required><%=oneTask.getDescription()%></textarea>
</td></tr>
<tr><td>
<label>Date:</label>
<input type="date" name="dueDate" value="<%=oneTask.getDueDate()%>"required/>
</td></tr>
<tr><td>
<label>Select if Task has completed</label>
<input type="radio" name="taskStatus"/>
</td></tr>
<tr><td>
<input type="submit" value="Update">
</td></tr>
</table>
</form>
${message1}
</div>
</body>
</html>
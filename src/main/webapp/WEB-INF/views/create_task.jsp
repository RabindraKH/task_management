<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="top_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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
left: 450px;
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
<h1>Welcome ${userName} to your Task Dashboard</h1>

<form action="createTask" method="post">
<table class="form-table">

<tr><td>
Title : <input type=text name="title" required/>
</td></tr>
<tr><td>
Description : <textarea required name="description" ></textarea>
</td></tr>
<tr><td>
Due date : <input type=date name="dueDate" required/>
</td></tr>
<tr><td>
<input type=submit value="Create Task"/>
</td></tr>
</table>
</form>
<h4>${message1}</h4>
</div>
</body>
</html>
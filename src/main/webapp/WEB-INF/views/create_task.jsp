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

    .container {
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
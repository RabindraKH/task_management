<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    }

    .container {
      border: 2px solid #333; 
      padding: 20px; 
      width: 600px; 
      margin: 0 auto; 
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
<h2>Register Here</h2>
Enter new username and password to register<br>

<form action="addNewUser" method="post">
<Table>
<tr><td>
User Name<input type="text" name="userName" required/>
</td></tr>
<tr><td>
Password<input type="password" name="password" required/>
</td></tr>
<tr><td>
<input type="submit" value="Register"/>
</td>
</tr>
</Table>
</form>
<a href="loginPage">Login</a>
<h4>${message1}</h4>
<h4>${message2}</h4>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
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
    <h2>Login Here</h2>
<form action="verifyLogin" method="post">
<table>
<tr><td>
User Name<input type="text" name="userName" required/>
</td></tr>
<tr><td>
Password<input type=Password name="password" required/>
</td></tr>
<tr><td>
<input type="submit" value="Login"/>
</td></tr>
</table>
</form>
To Register<a href="register">Click Here</a>
<h4>${message}</h4>
<h4>${message1}</h4>
<h4>${message2}</h4>
  </div>


</body>
</html>
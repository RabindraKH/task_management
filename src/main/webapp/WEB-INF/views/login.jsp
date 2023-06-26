<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<style>
    .container {
  display: grid;
  place-items: center; 
}
label, input {
  margin-bottom: 10px;
  margin-right: 10px;
  padding: 5px;
}
table{
border: 0px solid black;
  padding: 20px;
  margin-bottom: 20px;
  margin-top: 20px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
}
th, td {
      padding: 8px;
      text-align: center;
       vertical-align: middle;
    }
</style>
</head>

<body>
 <div class="container">
<h2>Login Here</h2>
<form action="verifyLogin" method="post">
<table>
<tr><td>
<label>User Name</label>
<input type="text" name="userName" required/>
</td></tr>
<tr><td>
<label>Password</label>
<input type=Password name="password" required/>
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
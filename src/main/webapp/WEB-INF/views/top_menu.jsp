<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.menu-bar {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background-color: #333;
      color: #fff;
      height: 50px;
      text-align: center;
    }
.menu-bar {
      background-color: #333;
      color: #fff;
      height: 50px;
    }

    .menu-bar ul {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }

    .menu-bar li {
      display: inline-block;
      padding: 15px;
    }

    .menu-bar li a {
      color: #fff;
      text-decoration: none;
    }

    .menu-bar li a:hover {
      text-decoration: underline;
    }
 </style> 
</head>
<body>
<div class="menu-bar">
    <ul>
      <li><a href="myAllTasks">My Tasks</a></li>
      <li><a href="NewTaskPage">Create New Task</a></li>
      <li><a href="viewAllUserTasks">View All Tasks</a></li>
      <li><a href="logOut">Log Out</a></li>
    </ul>
  </div>
</body>
</html>
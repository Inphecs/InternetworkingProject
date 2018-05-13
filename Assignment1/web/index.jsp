<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="uts.wsd.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Diary Keeper</h1>
<%
User user = (User)session.getAttribute("user");
%>

<% if (user != null) { %>
<div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= user.getName() %> &lt;<%= user.getEmail() %>&gt;</div>
<div style="text-align: right;"><a href="logout.jsp">Logout</a></div>
<ul>
       <li><a href="edit_user.jsp">My Account</a></li>
       <li><a href="users.jsp">Users</a></li>
      </ul>
<% } else { %>
<div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in</div>
<div style="text-align: right;"><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>
<% } %>
</body>
</html>
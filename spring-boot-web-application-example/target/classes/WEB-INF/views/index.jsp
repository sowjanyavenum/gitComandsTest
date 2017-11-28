<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
import="com.mongodb.DB"
import="com.mongodb.DBCollection"
import="com.mongodb.DBCursor"
import="com.mongodb.ServerAddress"
import="com.mongodb.DBObject"
import="com.mongodb.BasicDBObject"
import="com.mongodb.WriteConcern"
import="com.mongodb.Mongo"
import="com.mongodb.MongoException"
import="java.util.Arrays"
import="java.util.*"
import="com.boraji.tutorial.springboot.Db_Connectivity"
%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN"
http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sap Auditing Chat Messenger</title>
</head>
<body>
<%
String login=request.getParameter("Login");
if(login!=null)
{
	
	Db_Connectivity mymongo=Db_Connectivity.createInstance();
	DBCollection collection=mymongo.getCollection("users");
    String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
    BasicDBObject query=new BasicDBObject();
    query.put("_id",uname);
    query.put("pwd",pwd);
    BasicDBObject where=new BasicDBObject();
    where.put("$and",query);
    DBObject doc=collection.findOne(query);
    if(doc!=null)
    {
    	session.setAttribute("id",request.getParameter("username"));
    	response.sendRedirect("hello.jsp");
    }
    else
    {
    	out.println("\nInvalid Credentials");
    }


}

%>
<h1>Welcome to Sap Audit Messenger</h1><br><a href="signUp.jsp">New user?Register here</a>
<form method="post" action="index.jsp">
UserName:<input type="text" name="username"><br><br>
Password:<input type="password" name="password"><br><br>
<input type="checkbox" name="remember">Remember me<br>
<input type="submit" style="width:108px;" name="Login" value="Login"><br>
</form>
</body>
</html>
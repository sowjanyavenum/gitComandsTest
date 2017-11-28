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

String signup=request.getParameter("signup");
if(signup!=null)
{
	Db_Connectivity mymongo=Db_Connectivity.createInstance();
	DBCollection collection=mymongo.getCollection("users");
    BasicDBObject doc=new BasicDBObject();
    doc=new BasicDBObject();
    doc.append("_id",request.getParameter("uname"));
    doc.append("pwd",request.getParameter("pwd"));
    doc.append("email",request.getParameter("email"));
    collection.insert(doc);
    session.setAttribute("id",request.getParameter("uname"));
    response.sendRedirect("index.jsp");
}

%>
<form action="/index.jsp">
  <div class="container">
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
   <label><b>FullName</b></label>
    <input type="text" placeholder="Enter your full name" name="fullname" required>
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Email" name="username" required>
    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <label><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    <input type="checkbox" checked="checked"> Remember me
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <div class="clearfix">
       <button type="submit" class="signupbtn">signup</button>
    </div>
  </div>
</form>

</body>

</html>
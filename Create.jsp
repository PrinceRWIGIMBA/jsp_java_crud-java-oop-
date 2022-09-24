<%@ page import="java.sql.*" %>
<%!
String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/Student";
String user="root",pass="";
String fname,lname,gender;
int level;int status;
Connection conn;
PreparedStatement ps;
%>
<%
fname=request.getParameter("fname");
lname=request.getParameter("lname");
gender=request.getParameter("gender");
level=Integer.parseInt(request.getParameter("level"));
try{
Class.forName(driver);
conn=DriverManager.getConnection(url,user,pass);
ps=conn.prepareStatement("INSERT INTO student SET fname=?,lname=?,gender=?,level=?");
ps.setString(1, fname);
ps.setString(2, lname);
ps.setString(3, gender);
ps.setInt(4, level);
status=ps.executeUpdate();
if(status>0)
{
response.sendRedirect("Read.jsp");
}
else
{
response.sendRedirect("CreateError.html");
}}
catch(Exception e)
{
out.print(e.getMessage());
}
%>
<strong style="color:red">There is a problem of inserting data, </strong><br/>
<a href="formjsp.html">try again</a>
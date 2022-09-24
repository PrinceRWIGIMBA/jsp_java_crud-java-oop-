<%@ page import="java.sql.*" %>
<%!
String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/Student";
String user="root",pass="";
String fname,lname,gender;
int level;int status;int id;
Connection conn;
PreparedStatement ps;
%><%
id=Integer.parseInt(request.getParameter("id"));
fname=request.getParameter("fname");
lname=request.getParameter("lname");
gender=request.getParameter("gender");
level=Integer.parseInt(request.getParameter("level"));
try{
Class.forName(driver);
conn=DriverManager.getConnection(url,user,pass);
ps=conn.prepareStatement("UPDATE student SET fname=?,lname=?,gender=?,level=? WHERE id=?");
ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,gender);
ps.setInt(4,level);
ps.setInt(5,id);
status=ps.executeUpdate();
if(status>0){
response.sendRedirect("Read.jsp");
}else
{
response.sendRedirect("UpdateError.html");
}
}
catch(Exception e)
{
out.print(e.getMessage());
}
%>
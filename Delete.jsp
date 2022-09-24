<%@ page import="java.sql.*" %>
<%!
String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/Student";
String user="root",pass="";
int status;int id;
Connection conn;
PreparedStatement ps;
%>
<%
id=Integer.parseInt(request.getParameter("id"));
try{
Class.forName(driver);
conn=DriverManager.getConnection(url,user,pass);
ps=conn.prepareStatement("DELETE FROM student WHERE id=?");
ps.setInt(1, id);
status=ps.executeUpdate();
if(status>0)
{
response.sendRedirect("Read.jsp");
}
else
{
response.sendRedirect("DeleteError.html");
}
}
catch(Exception e)
{
out.print(e.getMessage());
}
%>

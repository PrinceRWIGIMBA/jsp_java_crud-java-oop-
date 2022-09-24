<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%! String driver="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/Student";
String user="root",pass="";
%>
<html>
<head>
<title>CRUD-Read</title>
</head>
<body>
<%
try{
Class.forName(driver);
Connection conn=DriverManager.getConnection(url, user, pass);
PreparedStatement ps=conn.prepareStatement("select * from student");
ResultSet rs=ps.executeQuery();
out.print("<a href='NewStudent.html'>Add Student</a>");
out.print("<table style='width:700px' border=1>");
out.print("<tr><th>ID</th><th>FIRST NAME</th><th>LAST NAME</th>");
out.print("<th>GENDER</th><th>LEVEL</th><th colspan='2'>ACTION</th></tr>");

while(rs.next()){
out.print("<tr><td>"+rs.getInt(1)+"</td>");
out.print("<td>"+rs.getString(2).toString()+"</td>");
out.print("<td>"+rs.getString(3).toString()+"</td>");
out.print("<td>"+rs.getString(4).toString()+"</td>");
out.print("<td>"+rs.getString(5).toString()+"</td>");
out.print("<td><a href='Edit.jsp?id="+rs.getInt(1)+"'>Edit</a></td>");
out.print("<td><a href='Delete.jsp?id="+rs.getInt(1)+"'>Delete</a></td></tr>");}
out.print("</table>");
}
catch(Exception e){
out.print(e.getMessage());
}
%>
</body>
</html>
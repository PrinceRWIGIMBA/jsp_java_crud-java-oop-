<%@ page import="java.sql.*" %>
<%!
String driver,url,user,pass,fname,lname;
int id;
Connection conn;PreparedStatement ps;ResultSet rs;
%>
<html>
<head>
<title>Edit</title>
</head>
<body>
<%
try{
driver="com.mysql.jdbc.Driver";
url="jdbc:mysql://localhost/Student";
user="root";pass="";
id=Integer.parseInt(request.getParameter("id"));
Class.forName(driver); 
conn=DriverManager.getConnection(url,user,pass);
ps=conn.prepareStatement("SELECT * FROM student WHERE id=?");
ps.setInt(1,id);
rs=ps.executeQuery();
if(rs.next())
{
fname=rs.getString(2).toString();
lname=rs.getString(3).toString();
%>
<form action="Update.jsp" method="POST">
<input type="hidden" name="id" value="<%= id %>"><br/>
<label>First name</label><br/>
<input type="text" name="fname" value="<%= fname 
%>"><br/>
<label>Last name</label><br/>
<input type="text" name="lname" value="<%= lname 
%>"><br/>
<label>Gender</label><br/>
<input type="radio" name="gender" value="male"
checked="checked">Male
<input type="radio" name="gender" value="female">Female
<br/>
<label>Level</label><br/>
<select name="level">
<option value="1">Level 1</option>
<option value="2">Level 2</option>
<option value="3">Level 3</option>
</select><br/>
<input type="submit" name="update" value="Update">
</form>
<%
}
}
catch(Exception e){
out.print(e.getMessage());
} 
%>
</body>
</html>
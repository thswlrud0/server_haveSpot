<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %> 

<%
String one = request.getParameter("one");
String two = request.getParameter("two");
String three = request.getParameter("three");
String four = request.getParameter("four");

Connection conn = null;
Statement stmt = null;

try{
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hubdb?useUnicode=true&characterEncoding=utf8","root","");
   
   if(conn == null)
       throw new Exception("db nono..");
   stmt = conn.createStatement();
   String command = String.format("insert into user"+"(user_id, user_password, user_name, user_phone, num_of_stamps) values ('%s','%s','%s','%s','%s');",one,two,three,four, 0);
   
   int rowNum = stmt.executeUpdate(command);
   
   if(rowNum <1 )
	   throw new Exception("nonono...");
   }

   finally {
   try{
   stmt.close();
   }
   catch(Exception ignored){
   }
   try{
   conn.close();
   }
   catch(Exception ignored){
   }
   }


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<body>

</body>
</html>
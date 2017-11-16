<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="org.json.simple.JSONObject"%> 
<%@ page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="org.json.simple.*" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>

<%
String[] getAndroidData = {"", ""};
request.setCharacterEncoding("UTF-8");
getAndroidData[0] = request.getParameter("hey");
getAndroidData[1] = request.getParameter("really"); 


Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
 
try{
    String jdbcDriver = "jdbc:mysql://localhost:3306/hubdb?useUnicode=true&characterEncoding=utf8";
    String dbUser = "root";
    String dbPwd = "";
     
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
     
    pstmt = conn.prepareStatement("select * from store");
     
    rs = pstmt.executeQuery();
     
    JSONArray jArray = new JSONArray(); 
    Map<String, String> errtab = new HashMap<String, String>();
    JSONObject jsonMain = new JSONObject();
    
    while(rs.next())
    { 

     
        JSONObject jObject = new JSONObject();
      
      
    	//String store_name = URLEncoder.encode(rs.getString("store_name"), "UTF-8");
    	String store_name="test1..";
       
    	//String store_phone = URLEncoder.encode(rs.getString("store_phone"), "UTF-8");
        String store_phone=  " test..";
        
        //String store_address = URLEncoder.encode(rs.getString("store_address"),"UTF-8");
        String store_address =" test 2..";
        
        errtab.put("store_name", store_name);
        errtab.put("store_phone", store_phone);
        errtab.put("store_address", store_address);
        
        
        jObject.put("hey", errtab.get("store_name"));
        jObject.put("really",errtab.get("store_phone"));
        jObject.put("three", errtab.get("store_address"));
        
        jArray.add(0, jObject); 
        
    }  

   
    
    jsonMain.put("dataSend", jArray); 
    out.println(jsonMain); 
    out.flush();
    
}catch(SQLException e){
    e.printStackTrace();
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
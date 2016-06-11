<%@page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
<%@page import="java.sql.*"%>
<%!
public static class LoadDriver {
   	public static void main(String[] args) {
        try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            System.out.println("Error connecting to database");
        }
    }
}
%>


<%
Connection conn = null;
String URL = "jdbc:mysql://localhost:3306/mysql?useSSL=false";
String USER = "root";
String PASS = "morh123";
try {
      conn = DriverManager.getConnection(URL,USER,PASS);

} catch (SQLException ex) {
    // handle any errors
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello world!</h1>
<h2>All the customers</h2>
<%
String query = "SELECT * FROM customer";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<ul>
<% while(rs.next()){%>
		<li><%=rs.getString("firstname")%>&nbsp<%=rs.getString("lastname")%></li>
<%}%>
</ul>


</body>
</html>
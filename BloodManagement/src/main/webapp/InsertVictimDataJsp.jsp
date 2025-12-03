<%@ page import="java.sql.*" %>

<%
    String vname = request.getParameter("vname");
    String vrelative = request.getParameter("vrelative");
    String vphone = request.getParameter("vphone");
    String vbloodgroup = request.getParameter("vbloodgroup");
    String vlocation = request.getParameter("vlocation");

 
    String message = "";

    String query = "INSERT INTO victimsdata(vname, vrelativename, vphone, vbloodgroup, vlocation) VALUES (?, ?, ?, ?, ?)";

    try {
        
        Class.forName("com.mysql.cj.jdbc.Driver");

        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/victims", "root", "root");

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, vname);
        ps.setString(2, vrelative);
        ps.setString(3, vphone);
        ps.setString(4, vbloodgroup);
        ps.setString(5, vlocation);

        
        int cnt = ps.executeUpdate();
        if (cnt > 0) {
            message = "<p> Data stored successfully!</p>";
        } else {
            message = "<p> Data insert failed!</p>";
        }
        
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        message = e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Page</title>
</head>
<body>
   <h2>Data Insertion Status</h2>
   <%= message %> 
   <br><br>
   <a href="InsertDatasJsp.jsp">Insert</a>
</body>
</html>

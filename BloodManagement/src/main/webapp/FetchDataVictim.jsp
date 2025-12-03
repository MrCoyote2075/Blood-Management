<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    String vid = request.getParameter("vid");
    String hospital = request.getParameter("hospital");
    
    String vname = "", vrelative = "", vphone = "", vlocation = "", vbloodgroup = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/victims", "root", "root");

        PreparedStatement ps = con.prepareStatement("SELECT vname, vrelativename, vphone, vbloodgroup, vlocation FROM victimsdata WHERE vid = ?");
        ps.setInt(1, Integer.parseInt(vid));
        ResultSet rs = ps.executeQuery();

        if (rs.next()) { 
            vname = rs.getString("vname");
            vrelative = rs.getString("vrelativename");
            vphone = rs.getString("vphone");
            vbloodgroup = rs.getString("vbloodgroup");
            vlocation = rs.getString("vlocation");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }  
    
    int len = vbloodgroup.length();
    String notation ="";
    if( vbloodgroup.charAt(len-1) == '+'){
    	notation = "positive";
    }
    else{
    	notation = "negative";
    }
    //response.sendRedirect("SearchBlood.jsp?hospital=" + hospital + "&bloodgroup=" + vbloodgroup);
                                                  //// 1 based ID                 // A                   //positive
    response.sendRedirect("SearchBlood.jsp?hospital=" + hospital + "&bloodgroup="+vbloodgroup +"&notation="+notation +"&vname="+vname );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

</head>
<body>
    <h1>Needed Blood: <%= vbloodgroup %></h1>
    
</body>
</html>

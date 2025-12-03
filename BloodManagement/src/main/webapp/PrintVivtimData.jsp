<%@ page import="java.sql.*" %>
    
 <%
 try{
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/victims", "root", "root");
 String query = "select * from victimsdata;";
 PreparedStatement ps = con.prepareStatement(query);
 ResultSet rs = ps.executeQuery();
 
 %>
 
 <!DOCTYPE html>	
 <html>
 <head>
 <meta charset="UTF-8">
 <title>patient Data</title>
 <style>
   body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #4B1D95, #3752D4); /* Dark Purple to Blue Gradient */
    text-align: center;
    padding: 20px;
}
a {
    position: absolute;
    top: 10px;
    left: 10px;
    padding: 10px 20px;
    background: linear-gradient(135deg, #ff6a00, #ee0979); /* Orange-Pink Gradient */
    color: white;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    transition: 0.3s ease-in-out;
}

a:hover {
    background: linear-gradient(135deg, #ee0979, #ff6a00); /* Reverse Gradient */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}
h1 {
    color: white;
    font-size: 24px;
    margin-bottom: 20px;
}

table {
    width: 80%;
    margin: auto;
    border-collapse: collapse;
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background: #7E229C; /* Purple */
    color: white;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #FCE7F3; /* Light Pink */
}

tr:hover {
    background: #E2B4E3; /* Soft Pink */
    transition: 0.3s ease-in-out;
}


 </style>
 </head>
 <body>

 <table>
     <thead>
        <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Patient Relative Name</th>
            <th>Relative Phone</th>
            <th>Patient Group</th>
            <th>Patient Location</th>
        </tr>
    </thead>

 <%
 while (rs.next()){
 %>
 <tr>
    <td><%= rs.getInt("vid") %></td>
    <td><%= rs.getString("vname")%></td>
    <td><%= rs.getString("vrelativename") %></td>
    <td><%= rs.getString("vphone") %></td>
    <td><%= rs.getString("vbloodgroup") %></td>
    <td><%= rs.getString("vlocation") %></td>
 </tr>
 <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
  <a href="AdminPage.jsp">Go Back</a>
</body>
</html>

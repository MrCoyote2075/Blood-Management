<%@ page import="java.sql.*" %>
<%
    String locationname = request.getParameter("locationname");
    String AP = request.getParameter("A+");
    String AN = request.getParameter("A-");
    String BP = request.getParameter("B+");
    String BN = request.getParameter("B-");
    String ABP = request.getParameter("AB+");
    String ABN = request.getParameter("AB-");
    String OP = request.getParameter("O+");
    String ON = request.getParameter("O-");
    String bankname = request.getParameter("bloodbankname");
    String bankid = request.getParameter("bloodbankid");
    String message = "";
    String query = "INSERT INTO blooddata(locationname, `A+`, `A-`, `B+`, `B-`, `AB+`, `AB-`, `O+`, `O-`, bloodbankname, bloodbankid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    //String query = "INSERT INTO blooddata(locationname, A+, A-, B+, B-, AB+, AB-, O+, O-, bloodbankname, bloodbankid) VALUES(?,?,?,?,?,?,?,?,?,?,?);";

    try { 
      Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodavailability", "root", "root");
        PreparedStatement ps = c.prepareStatement(query);
        ps.setString(1, locationname);
        ps.setString(2, AP);
        ps.setString(3, AN);
        ps.setString(4, BP);
        ps.setString(5, BN);
        ps.setString(6, ABP);
        ps.setString(7, ABN);
        ps.setString(8, OP);
        ps.setString(9, ON);
        ps.setString(10, bankname);
        ps.setString(11, bankid);

        int rowsInserted = ps.executeUpdate();  // Execute the query

        if (rowsInserted > 0) {
            message = "Successfully Inserted...";
        } else {
            message = "Insertion Failed";
        }

        ps.close();
        c.close();
    } catch (Exception e) {
        e.printStackTrace();
        message = "Insertion Failed";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Blood Data</title>
</head>
<style>
	body{
		background-color: lightgreen;
	}
	h1{
		
	}
</style>
<body>
    <h1><%=message %></h1>
    <a href="InsertBloodAvail.jsp">AGAIN ADD</a>
</body>
</html>
<%@ page import="java.sql.*" %>


<%@ page import="java.sql.*" %>
<%
   String query = "SELECT * FROM blooddata;";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blood Data</title>

<style>
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

    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc); /* Purple Gradient */
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    h1 {
        margin-bottom: 20px;
        color: white;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
    }

    table {
        width: 80%;
        border-collapse: collapse;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        overflow: hidden;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 16px;
    }

    th {
        background: linear-gradient(135deg, #7b1fa2, #9c27b0); /* Purple Header */
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f3e5f5; /* Light Purple */
    }

    tr:hover {
        background: linear-gradient(135deg, #ab47bc, #8e24aa); /* Darker Purple */
        color: white;
        transition: 0.3s ease-in-out;
    }

    /* Adding subtle animations */
    table {
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>


</head>
<body>

    <h1>Detail Data</h1>

    <table>
        <thead>
            <tr>
                <th>Location</th>
                <th>Place</th>
                <th>A+</th>
                <th>A-</th>
                <th>B+</th>
                <th>B-</th>
                <th>AB+</th>
                <th>AB-</th>
                <th>O+</th>
                <th>O-</th>
                <th>BloodBank</th>
                <th>BloodBankID</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodavailability", "root", "root");
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("location") %></td>
                <td><%= rs.getString("locationname") %></td>
                <td><%= rs.getString("A+") %></td>
                <td><%= rs.getString("A-") %></td>
                <td><%= rs.getString("B+") %></td>
                <td><%= rs.getString("B-") %></td>
                <td><%= rs.getString("AB+") %></td>
                <td><%= rs.getString("AB-") %></td>
                <td><%= rs.getString("O+") %></td>
                <td><%= rs.getString("O-") %></td>
                <td><%= rs.getString("bloodbankname") %></td>
                <td><%= rs.getString("bloodbankid") %></td>
            </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
    
    <a href="AdminPage.jsp">Go Back</a>

</body>
</html>

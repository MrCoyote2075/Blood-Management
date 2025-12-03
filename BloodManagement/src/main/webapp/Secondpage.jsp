<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String victim = request.getParameter("victimid"); 
    String hospital = request.getParameter("goinghospital"); 
    response.sendRedirect("FetchDataVictim.jsp?vid=" + victim + "&hospital=" + hospital) ; 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Victim Details</title>
</head>
<body>
	
    <p>Victim ID: <%= victim %></p>
    <p>Going to hospital: <%= hospital %></p>
    
</body>
</html>

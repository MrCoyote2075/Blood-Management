<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	   body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #ff416c, #ff4b2b); /* Red-Pink Gradient */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
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

form {
    background: rgba(255, 255, 255, 0.95);
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    width: 320px;
    animation: fadeIn 0.8s ease-in-out;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 2px solid #ddd;
    border-radius: 6px;
    transition: 0.3s ease-in-out;
}

input[type="text"]:focus {
    border-color: #ff416c;
    outline: none;
    box-shadow: 0 0 8px rgba(255, 65, 108, 0.5);
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #ff416c, #ff4b2b);
    border: none;
    color: white;
    font-size: 18px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background: linear-gradient(135deg, #ff4b2b, #ff416c);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 65, 108, 0.3);
}

/* Subtle fade-in animation */
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
	
	    <form action="InsertVictimDataJsp.jsp" method="post">
	        <label>Name:</label>
	        <input type="text" name="vname"> <br>
	
	        <label>Relative Name:</label>
	        <input type="text" name="vrelative"> <br>
	
	        <label>Relative Phone:</label>
	        <input type="text" name="vphone"> <br>
	
	        <label>Blood Group:</label>
	        <input type="text" name="vbloodgroup"> <br>
	
	        <label>Location:</label>
	        <input type="text" name="vlocation"> <br>
	
	        <input type="submit" value="Register">
	    </form>
	 
    	<a href="AdminPage.jsp">Go Back</a>
    					
    		
	</body>
	</html>

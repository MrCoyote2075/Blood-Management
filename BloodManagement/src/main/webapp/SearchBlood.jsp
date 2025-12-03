<%@ page import="java.sql.*, java.util.*" %>
<%! 
    public int findNearestHospital(int[][] graph, boolean[] hasBlood, int src, int n) {
        int[] dist = new int[n];
        boolean[] visited = new boolean[n]; 
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>(Comparator.comparingInt(a -> a[1]));
        pq.add(new int[]{src, 0});

        while (!pq.isEmpty()) {
            int[] node = pq.poll();
            int u = node[0];
            int currentDist = node[1];

            if (visited[u]) continue;
            
            visited[u] = true;

            if (hasBlood[u]) 
                return u;

            for (int v = 0; v < n; v++) {
                if (graph[u][v] > 0 && !visited[v]) {  
                    int newDist = currentDist + graph[u][v];
                    if (newDist < dist[v]) {
                        dist[v] = newDist;
                        pq.add(new int[]{v, newDist});
                    }
                }
            }
        }
        return -1;
    }
%>  
<%
    String srchospital = request.getParameter("hospital");
    String notation = request.getParameter("notation");
    String nd = request.getParameter("bloodgroup");
   String nameofpatient = request.getParameter("vname");
    int src = Integer.parseInt(srchospital) ;
    String neededblood = nd.trim()+("positive".equals(notation) ? "+" : "-");
  
    String starting = "";
    String foundhospital = "";
   
    
    int n = 5;
    int[][] matrix = { 
        {0,3,5,5,5},
        {3,0,6,3,8},
        {5,6,0,8,10},
        {5,3,8,0,6},
        {5,8,10,6,0}
    };

    boolean[] hasBlood = new boolean[n];
    String hospitalName = "Not Found"; 

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodavailability", "root", "root")) {
        PreparedStatement stmt = conn.prepareStatement("SELECT bloodbankname FROM blooddata WHERE location = ?");
        stmt.setInt(1, src);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            starting = rs.getString("bloodbankname");
        }
        rs.close();
        stmt.close();
    } catch(Exception e) {
        e.printStackTrace();
    }

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodavailability", "root", "root");
        String query = "SELECT * FROM blooddata;";
        PreparedStatement stmt2 = conn.prepareStatement(query);
        ResultSet rs = stmt2.executeQuery();
        String data="A+";
        int k=0;
        while (rs.next()) {
        	
            int hospitalId = rs.getInt("location");
            if ((hospitalId - 1) >= 0 && (hospitalId - 1) < n) { 
            	System.out.print(neededblood);
            	System.out.print(nd);
                String bloodStr = rs.getString(neededblood);
                
               
                if (bloodStr != null && !bloodStr.isEmpty() && !bloodStr.equals("")) {
                    int bloodCount = Integer.parseInt(bloodStr); 
                	
                    hasBlood[hospitalId - 1] = bloodCount > 0 ;
                } else {
                    hasBlood[hospitalId - 1] = false;
                }
            }
        }
        rs.close();
        stmt2.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
   
    int nearestHospital = findNearestHospital(matrix, hasBlood, src-1, n);
    int nearestHospitalindex = (nearestHospital == -1) ? -1 : nearestHospital +1 ; 
    if (nearestHospital != -1) {
        try (Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodavailability", "root", "root")) {
            PreparedStatement stmt = connn.prepareStatement("SELECT locationname, bloodbankname FROM blooddata WHERE location = ?");
            stmt.setInt(1, nearestHospitalindex);
            ResultSet rss = stmt.executeQuery(); 
            if (rss.next()) {
                hospitalName = rss.getString("locationname");
                foundhospital = rss.getString("bloodbankname");
            }
            rss.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Blood</title>
    <style>
    body {
        margin: 0;
        background-color: lightgreen;
        color: black;
        text-align: center;
        margin-top: 90px;
    }
    b{
    	color:green;
    }
    </style>
</head>
<body>
    <h1>Source Hospital: <%= starting %></h1>
    <h1>Needed Blood: <%= neededblood %></h1> 
	
    <% if (nearestHospital != -1) { %>  
        <h1>Nearest Hospital with Required Blood: <b><%= hospitalName %></b><br><br> Hospital Name:<b> <%= foundhospital %></b></h1>
        <h1>Relative Name : <%=nameofpatient %></h1>
    <% } else { %> 
        <h2>No hospital found with the required blood type.</h2> 
    <% } 
    /*
    String 
    try (Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/victims", "root", "root")) {
        PreparedStatement st1 = con1.prepareStatement("SELECT vrelativename,vphone FROM victimsdata WHERE location = ");
        st1.setInt(1, nameofpatient );
        ResultSet rs1 = st1.executeQuery(); 
        if (rs1.next()) {
             = rs1.getString("locationname");
            foundhospital = rs1.getString("bloodbankname");
        }
        rss.close();
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    */
    %>
    
</body>
</html>
